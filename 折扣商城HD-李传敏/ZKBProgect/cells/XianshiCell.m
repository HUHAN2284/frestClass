//
//  XianshiCell.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-25.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "XianshiCell.h"
#import "UIImageView+WebCache.h"
@implementation XianshiCell

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
    iconImageView = [ZCControl createImageViewFrame:CGRectMake(10, 10, 80, 80) imageName:nil];
    [self.contentView addSubview:iconImageView];
    
    titleLabel = [ZCControl createLabelWithFrame:CGRectMake(110, 20, WIDTH-110, 20) font:14 text:nil];
    titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:titleLabel];
    
       //折扣和现价
    discountLabel = [ZCControl createLabelWithFrame:CGRectMake(110, 50, WIDTH-110, 20) font:12 text:nil];
    discountLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:discountLabel];
    
    //原价
    originPriceLabel = [ZCControl createLabelWithFrame:CGRectMake(110, 80, 130, 15) font:10 text:nil];
    [self.contentView addSubview:originPriceLabel];
    
    //横线
    hengxianView = [ZCControl createImageViewFrame:CGRectMake(130, 80, 50, 15) imageName:[NSString stringWithFormat:@"hengxian.png"]];
    //[self.contentView addSubview:hengxianView];
    
    //购买人数
    dealLabel =[ZCControl createLabelWithFrame:CGRectMake(250, 80, 60, 15) font:11 text:nil];
    [self.contentView addSubview:dealLabel];
    
    
}

- (void)configModel:(ZheKouModel *)model
{
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    titleLabel.text = model.title;
    
    NSString *price = [NSString stringWithFormat:@"￥%@ (%@折)",model.now_price,model.discount];
    discountLabel.text = price;
    
    
    NSString *origin = [NSString stringWithFormat:@"原价:￥%@",model.origin_price];
    originPriceLabel.text = origin;
    
    NSString *deal = [NSString stringWithFormat:@"%@人已购买",model.deal_num];
    dealLabel.text = deal;
    
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
