//
//  ChaozhijiukuaijiuModel.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-22.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChaozhijiukuaijiuModel : NSObject

@property(nonatomic,strong)NSString *deal_num;
@property(nonatomic)NSNumber *is_onsale;

@property(nonatomic,strong)NSString *title;
@property(nonatomic)NSNumber *discount;

@property(nonatomic,strong)NSString *num_iid;

@property(nonatomic)NSNumber *now_price;
@property(nonatomic)NSNumber *origin_price;
@property(nonatomic,strong)NSString *pic_url;
@property(nonatomic)NSNumber *total_love_number;

@end
