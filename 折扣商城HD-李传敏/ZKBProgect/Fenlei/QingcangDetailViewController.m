//
//  QingcangDetailViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-2-3.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "QingcangDetailViewController.h"

@interface QingcangDetailViewController ()

@end

@implementation QingcangDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNav];
    
    UIWebView *webView1 = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    
    [webView1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_UrlStr]]];
    webView1.scalesPageToFit = YES;
    
    [self.view addSubview:webView1];
    

    
    
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    
    //隐藏原生导航栏
    self.navigationController.navigationBarHidden= NO;
    
    //显示状态栏
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (void)createNav
{
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置导航背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"88_Nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0,0, 40, 40);
    
    [leftButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}

- (void)buttonClick
{
    //NSLog(@"返回");
    
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
