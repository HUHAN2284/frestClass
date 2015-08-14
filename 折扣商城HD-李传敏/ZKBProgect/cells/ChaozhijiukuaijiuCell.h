//
//  ChaozhijiukuaijiuCell.h
//  ZKBProgect
//
//  Created by qianfeng on 15-1-22.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChaozhijiukuaijiuModel.h"
#import "ZheKouModel.h"
#import "ChooseModel.h"
#import "FashionModel.h"
@interface ChaozhijiukuaijiuCell : UITableViewCell
{
    //背景图片
    UIImageView *bgImageView;
    //图片
    UIImageView *iconImageView;
    //名称，折扣
    UILabel *titleLabel;

    //现价
    UILabel *nowPriceLabel;
    //原价
    UIImageView *originPriceView;
    
    UILabel *originPriceLabel;

    //喜欢
    UILabel *loveNumberLabel;
    
}

- (void)configModel:(ChaozhijiukuaijiuModel *)model;
-(void)configModel1:(ZheKouModel *)model;
-(void)configModel2:(ChooseModel *)model;
-(void)configModel3:(ChooseModel *)model;
@end
