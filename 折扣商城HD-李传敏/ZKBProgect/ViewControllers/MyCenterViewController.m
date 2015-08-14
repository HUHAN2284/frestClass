//
//  MyCenterViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "MyCenterViewController.h"
#import "ChaWuLiuViewController.h"
#import "GouWuCheViewController.h"
#import "ChaDingDanViewController.h"
#import "ShouCangViewController.h"

#import "GuanyuViewController.h"

#import "UMFeedback.h"

@interface MyCenterViewController ()<UIAlertViewDelegate>

@end

@implementation MyCenterViewController

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
    
    [self makeUI];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    //隐藏原生导航栏
    self.navigationController.navigationBarHidden= YES;
    
}
-(void)viewDidDisappear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden= NO;
}
- (void)makeUI
{
    //导航
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"88_Nav.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor brownColor]}];
    
    //设置背景
    UIImageView *bgImageView = [ZCControl createImageViewFrame:CGRectMake(0, 110, WIDTH, HEIGHT) imageName:@"ditu.png"];
    [self.view addSubview:bgImageView];
    
    //个人中心图片
    UIImageView *touImageView =[ZCControl createImageViewFrame:CGRectMake(0, 0, WIDTH, 110) imageName:[NSString stringWithFormat:@"geren.png"]];
    
    [self.view addSubview:touImageView];
    
    UILabel *wodetaobaoLabel = [ZCControl createLabelWithFrame:CGRectMake(10, 10, WIDTH-20, 15) font:15 text:@"我的淘宝"];
    wodetaobaoLabel.textColor = [UIColor grayColor];
    
    [bgImageView addSubview:wodetaobaoLabel];
    
    NSArray *imageArray = @[@"1.png",@"2.png",@"3.png",@"4.png"];
    //循环创建4个button
    for(int i=0;i<4;i++)
    {
        UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(10+i*(WIDTH-20)/4, 30, (WIDTH-20)/4, 70) title:nil imageName:nil bgImageName:nil target:self method:@selector(buttonClick:)];
        button.tag = 200+i;
        
        //设置图片
        [button setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [bgImageView addSubview:button];
    }
    
    NSArray *array1 = @[@"fankui.png",@"gengxin.png",@"guanyu.png"];
    
    
    for(int i=0;i<3;i++)
    {
        UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(10, 120+i*WIDTH/7, WIDTH-20,WIDTH/7) title:nil imageName:nil bgImageName:nil target:self method:@selector(buttonClick:)];
        button.tag = 400+i;
        
        [button setBackgroundImage:[UIImage imageNamed:array1[i]] forState:UIControlStateNormal];
        
        [bgImageView addSubview:button];
        
    }
    
}

- (void)buttonClick:(UIButton*)button
{
    switch (button.tag-200) {
            
        case 0:
        {//查物流
            
            ChaWuLiuViewController *vc = [[ChaWuLiuViewController alloc]init];
            vc.title = @"查询物流";
            vc.urlStr = @"http://h5.m.taobao.com/awp/mtb/olist.htm?sta=5";
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
        {//购物车
            GouWuCheViewController *vc = [[GouWuCheViewController alloc]init];
            vc.title = @"购物车";
            vc.urlStr =@"http://h5.m.taobao.com/awp/base/cart.htm?pds=gotocart%23h%23mytb";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {//查订单
            ChaDingDanViewController *vc = [[ChaDingDanViewController alloc]init];
            vc.title = @"我的订单";
            
            vc.urlStr =@"http://h5.m.taobao.com/awp/mtb/olist.htm?sta=4";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {//收藏
            ShouCangViewController *vc = [[ShouCangViewController alloc]init];
            vc.title = @"我的收藏";
            vc.urlStr =@"http://h5.m.taobao.com/fav/index.htm";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 200:
        {//用户反馈
            
            //反馈界面 使用友盟的反馈插件
            
            [UMFeedback showFeedback:self withAppkey:@"54d479e6fd98c58b9c00052d"];
            
            
        }
            break;
        case 201:
        {
            //检查更新
            
            UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"版本更新" message:@"您已经是最新版本" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [al show];
            
            
            
        }
            break;
        case 202:
        {//关于
            
            GuanyuViewController *vc = [[GuanyuViewController alloc]init];
            vc.title = @"关于";
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
            break;
            
        default:
            break;
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
