//
//  GuangguangCell.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-20.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "GuangguangCell.h"
#import "UIImageView+WebCache.h"
@implementation GuangguangCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeUI];
        
    }
    return self;
}

- (void)makeUI
{
    //设置图片
    iconImageView = [ZCControl createImageViewFrame:CGRectMake(8, 8, 70, 80) imageName:nil];
    [self.contentView addSubview:iconImageView];
    //商品名称
    titleLabel = [ZCControl createLabelWithFrame:CGRectMake(8, 90, 60, 20) font:10 text:nil];
    titleLabel.textColor = [UIColor purpleColor];
    titleLabel.textAlignment =NSTextAlignmentCenter;
    
    [self.contentView addSubview:titleLabel];
    //现价
//    nowPriceLabel = [ZCControl createLabelWithFrame:CGRectMake(90, 10, 60, 30) font:10 text:nil];
//    nowPriceLabel.textColor = [UIColor orangeColor];
//    [self.contentView addSubview:nowPriceLabel];

    //原价
//    originPriceLabel = [ZCControl createLabelWithFrame:CGRectMake(80, 50, 75, 25) font:10 text:nil];
//    
//    [self.contentView addSubview:originPriceLabel];

    //折扣
    
    bgdiscountView = [ZCControl createImageViewFrame:CGRectMake(100, 80, 45, 20) imageName:[NSString stringWithFormat:@"zhekoudi.png"]];
    [self.contentView addSubview:bgdiscountView];
    
    
    discountLabel = [ZCControl createLabelWithFrame:CGRectMake(3, 0, 40, 20) font:13 text:nil];
    discountLabel.textColor =[UIColor orangeColor];
    discountLabel.textAlignment = NSTextAlignmentCenter;
    [bgdiscountView addSubview:discountLabel];
    
}

- (void)configModel:(GuangguangModel *)model
{
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    titleLabel.text = model.title;
//    NSString *nowprice = [NSString stringWithFormat:@"现价%@元",model.now_price];
//    nowPriceLabel.text = nowprice;
    
    NSString *discount = [NSString stringWithFormat:@"%@折",model.discount];
    discountLabel.text=discount;
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
