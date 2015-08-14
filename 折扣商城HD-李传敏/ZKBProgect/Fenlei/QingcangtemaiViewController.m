//
//  QingcangtemaiViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-2-3.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "QingcangtemaiViewController.h"
#import "ZheKouModel.h"
#import "ChaozhijiukuaijiuCell.h"
#import "MJRefresh.h"
#import "QingcangDetailViewController.h"

@interface QingcangtemaiViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView1;
    UITableView *_tableView2;
    
    MJRefreshHeaderView *header;
    MJRefreshFooterView *footer;
    
}
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation QingcangtemaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNav];

     [self createTableView];
    
    [self createRefresh];
    
    [header beginRefreshing];
    
    
    
    // Do any additional setup after loading the view.
}


-(void)createRefresh{
    //下拉刷新，上拉加载
    header = [MJRefreshHeaderView header];
    header.scrollView = _tableView1;
    header.beginRefreshingBlock = ^(MJRefreshBaseView*view){
        [self loadData];
    };
    //    footer = [MJRefreshFooterView footer];
    //    footer.scrollView = _tableView2;
    //    footer.beginRefreshingBlock = ^(MJRefreshBaseView*view){
    //        [self loadData];
    //    };
    
}

- (void)loadData
{
    
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:_urlstr Block:^(BOOL isSucceed, HttpRequestBlock *http) {
        //获得数据，建立模型
        if(isSucceed)
        {
            NSArray *array = http.dataDic[@"data"];
            
            
            self.dataArray = [NSMutableArray arrayWithArray:0];
            
            //建立模型
            for(NSDictionary *dic in array)
            {
                ZheKouModel *model = [[ZheKouModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                //追加数据
                [self.dataArray addObject:model];
                //追加完成后刷新数据
                [_tableView1 reloadData];
                [_tableView2 reloadData];
            }
            [header endRefreshing];
            
        }
        
    }];
    
    
}



- (void)createTableView
{
    _tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0,10,WIDTH/2 , HEIGHT-64-10) style:UITableViewStylePlain];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    
    //隐藏分割线
    _tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //隐藏进度条
    _tableView1.showsVerticalScrollIndicator = NO;
    
    
    [self.view addSubview:_tableView1];
    
    
    //创建第二个
    _tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(WIDTH/2,10,WIDTH/2,HEIGHT-64-10) style:UITableViewStylePlain];
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
        
        ZheKouModel *model = self.dataArray[indexPath.row*2];
        
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell1 configModel1:model];
        
        return cell1;
        
        
    }else
    {
        ChaozhijiukuaijiuCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"tableView2"];
        if(!cell2)
        {
            cell2 = [[ChaozhijiukuaijiuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView2"];
            
        }
        ZheKouModel *model=self.dataArray[indexPath.row*2+1];
        
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell2 configModel1:model];
        
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

        QingcangDetailViewController *vc = [[QingcangDetailViewController alloc]init];
        vc.title = @"淘宝详情";
        
        ZheKouModel *model = self.dataArray[indexPath.row*2];
        vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.num_iid];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else
    {
        //NSLog(@"点击了右边");
        QingcangDetailViewController *vc = [[QingcangDetailViewController alloc]init];
        vc.title = @"淘宝详情";
        
        ZheKouModel *model = self.dataArray[indexPath.row*2+1];
        vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.num_iid];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}



- (void)createNav
{
    
    
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置导航背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"88_Nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
}

- (void)buttonClick:(UIButton *)button
{
    //[self.navigationController popViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
