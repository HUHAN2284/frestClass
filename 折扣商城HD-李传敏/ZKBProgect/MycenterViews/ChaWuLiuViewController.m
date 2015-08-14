//
//  ChaWuLiuViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-24.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "ChaWuLiuViewController.h"

@interface ChaWuLiuViewController ()

@end

@implementation ChaWuLiuViewController

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
      
    UIWebView *webView1 = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-49)];

    [webView1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
    webView1.scalesPageToFit = YES;
    [self.view addSubview:webView1];

    // Do any additional setup after loading the view.
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
