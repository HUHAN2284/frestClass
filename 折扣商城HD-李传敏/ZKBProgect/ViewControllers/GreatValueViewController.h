//
//  GreatValueViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import "YRSideViewController.h"
@interface GreatValueViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView1;
    UITableView *_tableView2;
    
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSString *UrlStr;

@property (nonatomic,strong)MainTabBarController *main;

//- (void)createRefresh;



@end
