//
//  FashionModel.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-29.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FashionModel : NSObject

@property(nonatomic)NSNumber *discount;
@property(nonatomic,strong)NSString *item_id;
@property(nonatomic,strong)NSString *pic_path;
@property(nonatomic)NSNumber *price;
@property(nonatomic)NSNumber*price_with_rate;
@property(nonatomic)NSString *sold;
@property(nonatomic,strong)NSString*title;

@end
