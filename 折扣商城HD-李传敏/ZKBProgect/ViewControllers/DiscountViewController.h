//
//  DiscountViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscountViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
}

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,copy)NSString*UrlStr;

@end
