//
//  MainTabBarController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "MainTabBarController.h"

#import "GreatValueViewController.h"
#import "GuangGuangViewController.h"
#import "DiscountViewController.h"
#import "LimitViewController.h"
#import "MyCenterViewController.h"

#import "FenleiViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

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
    
    [self createViewControllers];
    
    [self createTabBarItems];
    
    // Do any additional setup after loading the view.
}

- (void)createTabBarItems
{
    //NSArray *titleArray = @[@"超值",@"逛逛",@"折扣",@"限时",@"我的"];
    
    NSArray *selectImageArray = @[@"chaozhi-2.png",@"guangguang-2.png",@"zhekou-2.png",@"xianshi-2.png",@"wode-2.png"];
    
    NSArray *unSelectImageArray = @[@"chaozhi.png",@"guangguang.png",@"zhekou.png",@"xianshi.png",@"wode.png"];
    
    for(int i=0;i<self.tabBar.items.count;i++)
    {
        UITabBarItem *item = self.tabBar.items[i];
        //对图像进行处理
        UIImage *selectImage = [UIImage imageNamed:selectImageArray[i]];
        selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage *unSelectImage = [UIImage imageNamed:unSelectImageArray[i]];
        unSelectImage = [unSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        item = [item initWithTitle:nil image:unSelectImage selectedImage:selectImage];
        
        item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        
    }
    
    //设置背景色
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"heng.png"]];
    
    
    
    
    
}


- (void)createViewControllers
{
    
    //分类页面的侧滑
    
    
    FenleiViewController *fvc = [[FenleiViewController alloc]init];

    
    //超值
    GreatValueViewController *vc1 = [[GreatValueViewController alloc]init];
    vc1.title = @"超值购物";
    
    vc1.UrlStr = CHAOZHI;

   vc1.main = self;
    
    UINavigationController *nc1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    _sideViewController = [[YRSideViewController alloc]init];
    
    //UINavigationController *ffnc = [[UINavigationController alloc]initWithRootViewController:fvc];

    
    
    _sideViewController.leftViewController = fvc;
    _sideViewController.rootViewController = nc1;
    _sideViewController.leftViewShowWidth = 260;
    _sideViewController.needSwipeShowMenu = true;
    
    
    //逛逛
    GuangGuangViewController *vc2 = [[GuangGuangViewController alloc]init];
    vc2.title = @"逛一逛";
    vc2.UrlStr = GUANGGUANG;
    UINavigationController *nc2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    //折扣
    DiscountViewController *vc3 = [[DiscountViewController alloc]init];
    vc3.title = @"折扣店";
    
    vc3.UrlStr = DISCOUNT;
    
    UINavigationController *nc3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    //限时
    LimitViewController *vc4 = [[LimitViewController alloc]init];
    vc4.title = @"限时秒杀";
    vc4.UrlStr = XIANSHI;
    UINavigationController *nc4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    
    //我的
    MyCenterViewController *vc5 = [[MyCenterViewController alloc]init];
//    vc5.title = @"我的";
    UINavigationController *nc5 = [[UINavigationController alloc]initWithRootViewController:vc5];
    
    self.viewControllers = @[_sideViewController,nc2,nc3,nc4,nc5];
    
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
