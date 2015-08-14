//
//  XianshiCell.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-25.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZheKouModel.h"
@interface XianshiCell : UITableViewCell
{
    //图片
    UIImageView *iconImageView;
    //名称
    UILabel *titleLabel;
    //折扣和现价
    UILabel *discountLabel;

    //原价
    UILabel *originPriceLabel;

    
    //购买人数
    UILabel *dealLabel;
    
    //横线
    UIImageView *hengxianView;
    
    
}
- (void)configModel:(ZheKouModel *)model;

@end
