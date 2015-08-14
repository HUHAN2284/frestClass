//
//  DiscountCell.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscountModel.h"
@interface DiscountCell : UITableViewCell
{
    //图片
    UIImageView *iconImageView;
    //名称
    UILabel *titleLabel;
    //点
    UIImageView *dianImageView;
    
    
}
-(void)config:(DiscountModel *)model;

@end
