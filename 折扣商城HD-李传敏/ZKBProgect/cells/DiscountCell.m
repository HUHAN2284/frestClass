//
//  DiscountCell.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-19.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "DiscountCell.h"
#import "UIImageView+WebCache.h"

@implementation DiscountCell

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
    //添加图片
    iconImageView = [ZCControl createImageViewFrame:CGRectMake(10, 10,300, 100) imageName:nil];
    [self.contentView addSubview:iconImageView];
    
    
    //点
    dianImageView = [ZCControl createImageViewFrame:CGRectMake(0, 74,300,26) imageName:@"dian.png"];
    [iconImageView addSubview:dianImageView];
    
    //标题
    titleLabel = [ZCControl createLabelWithFrame:CGRectMake(25,5, 200, 15) font:15 text:nil];
    
    titleLabel.textColor = [UIColor purpleColor];
    [dianImageView addSubview:titleLabel];

    
    
}
-(void)config:(DiscountModel *)model
{
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iphoneimg]];
    titleLabel.text = model.title;
    
    
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
