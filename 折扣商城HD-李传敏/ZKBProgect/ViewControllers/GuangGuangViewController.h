//
//  GuangGuangViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuangGuangViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView1;
    UITableView *_tableView2;

}
@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)NSString *UrlStr;

@end
