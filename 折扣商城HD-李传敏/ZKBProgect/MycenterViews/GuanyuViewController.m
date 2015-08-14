//
//  GuanyuViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-2-5.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "GuanyuViewController.h"

@interface GuanyuViewController ()

@end

@implementation GuanyuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self createNav];
    
    [self makeUI];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)makeUI
{
    
    UIImageView *bgImageView = [ZCControl createImageViewFrame:CGRectMake(0, 0, WIDTH, HEIGHT) imageName:@"ditu.png"];
    [self.view addSubview:bgImageView];
    
    UIImageView *tubiaoImageView = [ZCControl createImageViewFrame:CGRectMake(WIDTH/2-50, 40, 100, 100) imageName:@"1024*1024.png"];
    tubiaoImageView.layer.cornerRadius = 15;
    tubiaoImageView.layer.masksToBounds = YES;
    
    
    [bgImageView addSubview:tubiaoImageView];
    
    
    UILabel *titleLabel =[ZCControl createLabelWithFrame:CGRectMake(WIDTH/2-60, 150, 120, 20) font:15 text:@"折扣商城1.0版"];
    titleLabel.textColor = [UIColor grayColor];
    
    
    [bgImageView addSubview:titleLabel];
    
    
    UILabel *label = [ZCControl createLabelWithFrame:CGRectMake(WIDTH/2-100, 200, 200, 120) font:16 text:@"折扣商城汇集淘宝网最新最全的折扣商品,商城中商品种类齐全让你随时购物,每日限时秒杀等你去抢购,加入我们吧,折扣商城口袋里的白菜价"];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    
    [bgImageView addSubview:label];
    
    
    
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
