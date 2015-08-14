//
//  DiscountDetailViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-24.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "DiscountDetailViewController.h"
#import "ChaozhijiukuaijiuCell.h"
#import "MJRefresh.h"
@interface DiscountDetailViewController ()
{
    MJRefreshHeaderView *header;
    //UITableView *_tableView;
}
@end

@implementation DiscountDetailViewController

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
    
    [self loadData];
    
    //[self createRefresh];

    //[header beginRefreshing];
    
    // Do any additional setup after loading the view.
}

-(void)createRefresh{
    //下拉刷新，上拉加载
    header = [MJRefreshHeaderView header];
    header.scrollView = _tableView1;
    header.beginRefreshingBlock = ^(MJRefreshBaseView*view){
        [self loadData];
    };
    
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


//加载数据
- (void)loadData
{
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:self.UrlStr Block:^(BOOL isSucceed, HttpRequestBlock *http) {
        if(isSucceed)
        {
            NSArray *array =http.dataDic[@"data"];
            self.dataArray = [NSMutableArray arrayWithCapacity:0];
            
            for(NSDictionary *dic in array)
            {
                ZheKouModel *model = [[ZheKouModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [self.dataArray addObject:model];
                
                [_tableView1 reloadData];
                [_tableView2 reloadData];
            }
            [header endRefreshing];
            
        }
    }];
}


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
        
        //设置点击cell后为白色
//        UIView *aView = [[UIView alloc]initWithFrame:cell2.contentView.frame];
//        aView.backgroundColor = [UIColor whiteColor];
//        cell2.selectedBackgroundView = aView;
        
         cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell2 configModel1:model];
        
        return cell2;
        
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
