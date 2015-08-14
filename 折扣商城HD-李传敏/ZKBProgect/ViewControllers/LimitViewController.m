//
//  LimitViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "LimitViewController.h"
#import "XianshiCell.h"
#import "ZheKouModel.h"
#import "MJRefresh.h"
#import "LikeViewController.h"
@interface LimitViewController ()<MJRefreshBaseViewDelegate>
{
    MJRefreshHeaderView *header;
    MJRefreshFooterView *footer;
    
    
    int flag;
    int flag1;
    
    __block NSString *str;
    
}
@end

@implementation LimitViewController

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
    str = @"http://app.api.repai.com/zkb/api/zhekoubao.php?model=miaosha_data&time=0&id=9/HTTP/1.1";
    [super viewDidLoad];
    
    [self createNav];
    
    [self makeUI];
    
    [self createTableView];
    
    [self createRefresh];
    
    [header beginRefreshing];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)createRefresh
{
    //下拉刷新，上拉加载
    header = [MJRefreshHeaderView header];
    header.scrollView = _tableView;
    header.beginRefreshingBlock = ^(MJRefreshBaseView*view){
        [self loadData];
    };
    //    footer = [MJRefreshFooterView footer];
    //    footer.scrollView = _tableView;
    //    footer.beginRefreshingBlock = ^(MJRefreshBaseView*view){
    //        [self loadData];
    //    };
    
}
- (void)loadData
{
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:str Block:^(BOOL isSucceed, HttpRequestBlock *http) {
        
        if(isSucceed)
        {
            NSArray *array = http.dataDic[@"data"];
            self.dataArray = [NSMutableArray arrayWithCapacity:0];
            
            
            //建模
            for(NSDictionary *dic in array)
            {
                ZheKouModel *model = [[ZheKouModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                
                //追加数据
                [self.dataArray addObject:model];
                
                [_tableView reloadData];
                
            }
            
            [header endRefreshing];
        }
        
    }];
}

- (void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, WIDTH, HEIGHT-64-49-30) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XianshiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(!cell)
    {
        cell = [[XianshiCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    //读取数据源
    ZheKouModel *model = self.dataArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell configModel:model];
    
    return cell;
    
}

//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
    
}
- (void)makeUI
{
    for(int i=0;i<6;i++)
    {
        UIButton *button = [ZCControl createButtonWithFrame:CGRectMake((i-1)*WIDTH/5, 0, WIDTH/5, 30) title:nil imageName:nil bgImageName:nil target:self method:@selector(buttonClick:)];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        switch (i) {
            case 1:
                [button setTitle:[NSString stringWithFormat:@"9点"] forState:UIControlStateNormal];
                break;
                
            case 2:
                [button setTitle:[NSString stringWithFormat:@"12点"] forState:UIControlStateNormal];
                break;
                
            case 3:
                [button setTitle:[NSString stringWithFormat:@"15点"] forState:UIControlStateNormal];
                break;
                
            case 4:
                [button setTitle:[NSString stringWithFormat:@"18点"] forState:UIControlStateNormal];
                break;
                
            case 5:
                [button setTitle:[NSString stringWithFormat:@"21点"] forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        
        button.tag = 100+i;
        button.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:button];
        
        
    }
    
}

//点击选时间
- (void)buttonClick:(UIButton *)button
{
    switch (button.tag-100) {
            
        case 1:
        {
            flag1 = 9;
        }
            break;
            
        case 2:
        {
            flag1 = 12;
        }
            
            break;
            
        case 3:
        {
            flag1 = 15;
        }
            break;
            
        case 4:
        {
            flag1 = 18;
        }
            break;
        case 5:
        {
            flag1 = 21;
        }
            break;
        default:
            break;
    }
    
    //拼接地址
    str = [NSString stringWithFormat:_UrlStr,flag,flag1];
    
    [_tableView reloadData];
    
    [header beginRefreshing];
    
}
//设置导航栏
- (void)createNav
{
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置导航背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"88_Nav.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    flag = 0;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LikeViewController *vc = [[LikeViewController alloc]init];
    vc.title = @"淘宝详情";
    
    ZheKouModel *model = self.dataArray[indexPath.row];
    vc.urlStr = [NSString stringWithFormat:TAOBAOWANGYE,model.num_iid];
    [self.navigationController pushViewController:vc animated:YES];
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
