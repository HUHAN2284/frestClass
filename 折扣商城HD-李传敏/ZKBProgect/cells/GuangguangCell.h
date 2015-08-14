//
//  GuangguangCell.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-20.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuangguangModel.h"
@interface GuangguangCell : UITableViewCell
{
    //图片
    UIImageView *iconImageView;
    //名称
    UILabel *titleLabel;
    //折扣
    UILabel *discountLabel;
    //现价
    UILabel *nowPriceLabel;
    //原价
    UILabel *originPriceLabel;
    
    UIImageView *bgdiscountView;
    

}

- (void)configModel:(GuangguangModel *)model;

@end
