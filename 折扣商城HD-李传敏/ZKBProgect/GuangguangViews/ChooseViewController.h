//
//  ChooseViewController.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-27.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView1;
    UITableView *_tableView2;
    
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSString *UrlStr;


@end
