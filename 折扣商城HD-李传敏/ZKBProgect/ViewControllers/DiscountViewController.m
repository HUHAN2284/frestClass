//
//  DiscountViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "DiscountViewController.h"
#import "DiscountModel.h"
#import "DiscountCell.h"
#import "DiscountDetailViewController.h"

@interface DiscountViewController ()

@end

@implementation DiscountViewController

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
    
    [self createTableView];
    
    [self loadData];
    
    
    
    // Do any additional setup after loading the view.
}

//加载数据
-(void)loadData
{
//    NSString *newUrlStr = [NSString stringWithString:_UrlStr];
//    
    
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:_UrlStr Block:^(BOOL isSucceed, HttpRequestBlock * http) {
        //获得数据，建立模型
        if(isSucceed)
        {
            NSArray *array = http.dataDic[@"data"];
            
            self.dataArray = [NSMutableArray arrayWithCapacity:0];
            
            
            //建立模型
            for(NSDictionary *dic in array)
            {
                DiscountModel *model = [[DiscountModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                
                //NSLog(@"~~~~~~~~%@~~~~~~",model.title);
                
                
                //追加数据
                [self.dataArray addObject:model];
                
            }
            //追加完成后刷新数据
            [_tableView reloadData];
            
        }
        
    }];
}

//创建tableView
- (void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //隐藏分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //_tableView.separatorStyle = NO;
    [self.view addSubview:_tableView];
}

#pragma mark  tableView相关代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(!cell)
    {
        cell = [[DiscountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    //读取数据源
    DiscountModel *model = self.dataArray[indexPath.row];
    
    
    UIView *aView = [[UIView alloc]initWithFrame:cell.contentView.frame];
    aView.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = aView;

    
    
    [cell config:model];
    
    return  cell;
}

//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

//设置上面高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
//设置下面高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

//设置导航栏
- (void)createNav
{
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置导航背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"88_Nav.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DiscountDetailViewController *vc = [[DiscountDetailViewController alloc]init];
    DiscountModel *model = self.dataArray[indexPath.row];
    
    NSString *str = [NSString stringWithFormat:DISCOUNTDETAIL,model.zid];
    vc.UrlStr = str;
    vc.title = model.title;
    
    
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
