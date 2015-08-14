//
//  DetailHotViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-2-1.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "DetailHotViewController.h"
#import "ChaozhijiukuaijiuCell.h"
#import "MJRefresh.h"
#import "LikeViewController.h"
#import "FashionModel.h"
@interface DetailHotViewController ()
{
    MJRefreshHeaderView *header;
    MJRefreshFooterView *footer;
    
    __block int start;
    
    BOOL isSelect;
    
    __block NSString *str;
}

@end

@implementation DetailHotViewController


- (void)viewDidLoad {
    
    start = 0;
    str = [NSString stringWithFormat:_UrlStr,_num,start,@"p"];
    
    [super viewDidLoad];
    
    /*
     
     sort = p,d,s
     p:价格
     d:销量
     s:人气
     
     */

    [self createNav];
    
    [self createSegmentedControl];
    
    [self createTableView];
    
    [self createRefresh];
    
    //进入后开始下拉刷新
    [header beginRefreshing];

    
    
    // Do any additional setup after loading the view.
}

-(void)createRefresh{
    //下拉刷新，上拉加载
    
    header=[MJRefreshHeaderView header];
    header.scrollView=_tableView1;
    header.beginRefreshingBlock=^(MJRefreshBaseView*view){
        start=0;
        [self loadData];
    };
    
    footer=[MJRefreshFooterView footer];
    footer.scrollView=_tableView1;
    footer.beginRefreshingBlock=^(MJRefreshBaseView*view){
        start++;
        [self loadData];
        
    };
    
}

-(void)loadData
{
    
//    str = [NSString stringWithFormat:_UrlStr,_num,start,@"p"];
    
    
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:str Block:^(BOOL isSucceed, HttpRequestBlock *http) {
            if(isSucceed)
            {
                NSArray *array =http.dataDic[@"list"];
                self.dataArray = [NSMutableArray arrayWithCapacity:0];
                
                for(NSDictionary *dic in array)
                {
                    FashionModel *model = [[FashionModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.dataArray addObject:model];
                    
                    [_tableView1 reloadData];
                    [_tableView2 reloadData];
                    
                }
                
                [_tableView1 reloadData];
                [_tableView2 reloadData];
                
                
                if (start==0) {
                    [header endRefreshing];
                }else{
                    [footer endRefreshing];
                }
                
            }
        }];
}

- (void)createTableView
{
    _tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0,50,WIDTH/2 , HEIGHT-64-49-50) style:UITableViewStylePlain];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    
    //隐藏分割线
    _tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //隐藏进度条
    _tableView1.showsVerticalScrollIndicator = NO;
    
    
    [self.view addSubview:_tableView1];
    
    
    //创建第二个
    _tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(WIDTH/2,50,WIDTH/2,HEIGHT-64-49-50) style:UITableViewStylePlain];
    _tableView2.dataSource = self;
    _tableView2.delegate = self;
    
    //隐藏分割线
    _tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView2];

}


#pragma mark  tableView相关代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView ==_tableView1)
    {
        ChaozhijiukuaijiuCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"tableView1"];
        if(!cell1)
        {
            cell1 = [[ChaozhijiukuaijiuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView1"];
            
        }
        
        FashionModel *model = self.dataArray[indexPath.row*2];
        
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell1 configModel3:model];
        
        return cell1;
        
        
    }else
    {
        ChaozhijiukuaijiuCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"tableView2"];
        if(!cell2)
        {
            cell2 = [[ChaozhijiukuaijiuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView2"];
            
        }
        FashionModel *model=self.dataArray[indexPath.row*2+1];
        
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell2 configModel3:model];
        
        return cell2;
        
    }
}

//设置行高

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView ==_tableView2)
    {
        if (self.dataArray.count%2==1)
        {
            return (self.dataArray.count-1)/2;
        }
        if(self.dataArray.count%2==0)
        {
            return (self.dataArray.count+1)/2;
        }
        
    }
    
    return (self.dataArray.count+1)/2;
    
}


//设置上面高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
//设置下面高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark 瀑布流核心方法,让两个tableView同时滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView ==_tableView1)
    {
        _tableView2.contentOffset = _tableView1.contentOffset;
        
    }else
    {
        _tableView1.contentOffset = _tableView2.contentOffset;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView ==_tableView1)
    {
        LikeViewController *vc = [[LikeViewController alloc]init];
        vc.title = @"淘宝详情";
        
        FashionModel *model = self.dataArray[indexPath.row*2];
        vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.item_id];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else
    {
        //NSLog(@"点击了右边");
        LikeViewController *vc = [[LikeViewController alloc]init];
        vc.title = @"淘宝详情";
        
        FashionModel *model = self.dataArray[indexPath.row*2+1];
        vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.item_id];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}






- (void)createSegmentedControl
{

    _array1 =@[@"价格↑",@"销量",@"人气"];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:_array1];
    seg.frame = CGRectMake(10, 5, WIDTH-20, 35);
    
    
    seg.selectedSegmentIndex = 0;
    
    
    seg.tintColor = [UIColor orangeColor];
    
    
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:seg];
    
}

-(void)segClick:(UISegmentedControl *)seg
{
    start = 0;
    
    switch (seg.selectedSegmentIndex) {
        case 0:
        {
            
            str = [NSString stringWithFormat:_UrlStr,_num,start,@"p"];
            
            [_tableView1 reloadData];
            [_tableView2 reloadData];
            
            [header beginRefreshing];
        }
            break;
           
        case 1:
        {
            str = [NSString stringWithFormat:_UrlStr,_num,start,@"d"];
            
            [_tableView1 reloadData];
            [_tableView2 reloadData];
            
            [header beginRefreshing];
        
        }
           break;
            
        case 2:
        {
            
            str = [NSString stringWithFormat:_UrlStr,_num,start,@"s"];
            
            [_tableView1 reloadData];
            [_tableView2 reloadData];
            
            [header beginRefreshing];

        }
            break;
            
        default:
            break;
    }
    
}


- (void)createNav
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
}
- (void)buttonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
