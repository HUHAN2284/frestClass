//
//  DetailHotViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-2-1.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHotViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView1;
    UITableView *_tableView2;
}

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSString *UrlStr;

@property(nonatomic,strong)NSString *num;

@property(nonatomic,strong)NSArray*array1;

@end
