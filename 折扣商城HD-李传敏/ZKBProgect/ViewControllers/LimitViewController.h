//
//  LimitViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LimitViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
}

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,copy)NSString *UrlStr;

@end
