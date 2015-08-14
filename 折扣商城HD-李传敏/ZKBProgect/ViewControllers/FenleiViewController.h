//
//  FenleiViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-29.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import "YRSideViewController.h"
#import "GreatValueViewController.h"
@interface FenleiViewController : UIViewController
@property(nonatomic,strong)NSMutableArray *dataArray;


@property(nonatomic,strong)NSMutableArray *dataArray1;


@property(nonatomic,strong)NSMutableArray *dataArray2;

@property (nonatomic,strong)MainTabBarController *main;

//@property(nonatomic,strong)GreatValueViewController *gvc;
//

@property(nonatomic,copy)NSString *str;
//@property(nonatomic,copy)NSString *name;


@end
