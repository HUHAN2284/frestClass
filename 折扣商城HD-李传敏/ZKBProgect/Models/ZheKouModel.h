//
//  ZheKouModel.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-24.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZheKouModel : NSObject

@property(nonatomic,strong)NSString *deal_num;
@property(nonatomic,strong)NSString*discount;
@property(nonatomic,strong)NSString*now_price;
@property(nonatomic,strong)NSString*num_iid;
@property(nonatomic,strong)NSString*origin_price;
@property(nonatomic,strong)NSString *pic_url;
@property(nonatomic,strong)NSString *title;

//限时里面的
@property(nonatomic)NSNumber *status;

@end
