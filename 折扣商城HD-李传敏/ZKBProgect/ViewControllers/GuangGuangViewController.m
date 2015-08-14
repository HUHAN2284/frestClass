//
//  GuangGuangViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "GuangGuangViewController.h"
#import "GuangguangModel.h"
#import "GuangguangCell.h"
#import "MJRefresh.h"

#import "HotViewController.h"
#import "FashionViewController.h"
#import "ChooseViewController.h"

#import "LikeViewController.h"

@interface GuangGuangViewController ()
{
    MJRefreshHeaderView *header;
    MJRefreshFooterView *footer;
    
}
@end

@implementation GuangGuangViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createNav];
    
    [self createView];
    
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
    footer = [MJRefreshFooterView footer];
    footer.scrollView = _tableView2;
    footer.beginRefreshingBlock = ^(MJRefreshBaseView*view){
    [self loadData];
    };
 
}



- (void)loadData
{
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:_UrlStr Block:^(BOOL isSucceed, HttpRequestBlock *http) {
        //获得数据，建立模型
        if(isSucceed)
        {
            NSArray *array = http.dataDic[@"data"];
            self.dataArray = [NSMutableArray arrayWithArray:0];
           // NSLog(@"~~~~~%@~~~~",array[0][@"title"]);
            
            //建立模型
            for(NSDictionary *dic in array)
            {
                GuangguangModel *model = [[GuangguangModel alloc]init];
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
//创建tableView
- (void)createTableView
{
    _tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 90+34,WIDTH/2 , HEIGHT-64-49-90-34) style:UITableViewStylePlain];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    
    
   //隐藏分割线
    _tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //隐藏进度条
    _tableView1.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_tableView1];

    
    //创建第二个
    _tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(WIDTH/2, 90+34,WIDTH/2,HEIGHT-64-49-90-34) style:UITableViewStylePlain];
    _tableView2.dataSource = self;
    _tableView2.delegate = self;
    
    //隐藏分割线
    _tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //隐藏进度条
    _tableView2.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_tableView2];
    
    
}

#pragma mark  tableView相关代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(tableView ==_tableView1)
    {
        GuangguangCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"tableView1"];
        if(!cell1)
        {
            cell1 = [[GuangguangCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView1"];
        }
        GuangguangModel *model = self.dataArray[indexPath.row*2];
        
       
        //设置点击cell后为白色
//        UIView *aView = [[UIView alloc]initWithFrame:cell1.contentView.frame];
//        aView.backgroundColor = [UIColor whiteColor];
//        cell1.selectedBackgroundView = aView;
        //或者
         cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        [cell1 configModel:model];
        
        return cell1;
    }else
    {
        GuangguangCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"tableView2"];
        if(!cell2)
        {
            cell2 = [[GuangguangCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView2"];
        }
        GuangguangModel *model = self.dataArray[indexPath.row*2+1];
       
        UIView *aView = [[UIView alloc]initWithFrame:cell2.contentView.frame];
        aView.backgroundColor = [UIColor whiteColor];
        
        cell2.selectedBackgroundView = aView;

        
        [cell2 configModel:model];

        return cell2;
    }

}

//设置行高

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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


- (void)createView
{
    UIImageView *UpView = [ZCControl createImageViewFrame:CGRectMake(0, 0, WIDTH, 90) imageName:@"128_Nav.png"];
    [self.view addSubview:UpView];
    
    NSArray *iconArray = @[@"fenlei.png",@"reci.png",@"jingxuan.png"];
    NSArray *titleArray = @[@"热门分类",@"时尚热词",@"本周精选"];
    
    
    //循环创建3个button和label
    for(int i=0;i<3;i++)
    {
        UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(28+i*WIDTH/3,7, 50, 50) title:nil imageName:nil bgImageName:nil target:self method:@selector(buttonClick:)];
        button.tag = 100+i;
        [UpView addSubview:button];
        
         //设置图像
        [button setBackgroundImage:[UIImage imageNamed:iconArray[i]] forState:UIControlStateNormal];
        
        //创建label
        UILabel *TitleLabel = [ZCControl createLabelWithFrame:CGRectMake(30+i*WIDTH/3, 65, 60, 20) font:12 text:[NSString stringWithFormat:@"%@",titleArray[i]]];
        
        [UpView addSubview:TitleLabel];
    }
    
    //猜你喜欢的背景
    UIImageView *cainixihuanView = [ZCControl createImageViewFrame:CGRectMake(0, 90, WIDTH, 34) imageName:@"tiao.png"];
    
    [self.view addSubview:cainixihuanView];
    
    //猜你喜欢
    UILabel *label = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"猜你喜欢"];
    [cainixihuanView addSubview:label];
    
    
}

- (void)buttonClick:(UIButton *)button
{
    
    switch (button.tag-100) {
        case 0:
        {
            HotViewController *vc = [[HotViewController alloc]init];
            vc.title = @"热门分类";
            vc.UrlStr = HOT;
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
        {
            FashionViewController *vc = [[FashionViewController alloc]init];
            vc.title =@"时尚热词";
            vc.UrlStr = FASHION;
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            ChooseViewController *vc = [[ChooseViewController alloc]init];
            vc.title = @"本周精选";
            
            vc.UrlStr = CHOOSE;
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
    }
}


//设置导航栏
- (void)createNav
{
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置导航背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"88_Nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}];
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
        //NSLog(@"点击了左边");
        
        LikeViewController *vc = [[LikeViewController alloc]init];
        vc.title = @"淘宝详情";
        
        GuangguangModel *model = self.dataArray[indexPath.row*2];
        vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.num_iid];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else
    {
        //NSLog(@"点击了右边");
        LikeViewController *vc = [[LikeViewController alloc]init];
        vc.title = @"淘宝详情";
        
        GuangguangModel *model = self.dataArray[indexPath.row*2+1];
        vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.num_iid];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
