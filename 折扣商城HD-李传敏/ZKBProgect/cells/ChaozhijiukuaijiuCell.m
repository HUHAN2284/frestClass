//
//  ChaozhijiukuaijiuCell.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-22.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "ChaozhijiukuaijiuCell.h"
#import "UIImageView+WebCache.h"

@implementation ChaozhijiukuaijiuCell

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
    //设置背景图片
    bgImageView = [ZCControl createImageViewFrame:CGRectMake(5, 0, WIDTH/2-10, 180) imageName:[NSString stringWithFormat:@"Heart.png"]];
    [self.contentView addSubview:bgImageView];
    
   //设置图片
    iconImageView = [ZCControl createImageViewFrame:CGRectMake(3, 2, WIDTH/2-16, 175-46) imageName:nil];
    [bgImageView addSubview:iconImageView];
    
    
    //设置标题
    titleLabel = [ZCControl createLabelWithFrame:CGRectMake(3,133, WIDTH/2-16,24) font:10 text:nil];
    titleLabel.numberOfLines = 0;
  
    [bgImageView addSubview:titleLabel];
    
    //现在价格
    nowPriceLabel = [ZCControl createLabelWithFrame:CGRectMake(6, 155, WIDTH/8, 20) font:14 text:nil];
    nowPriceLabel.textColor = [UIColor orangeColor];
    [bgImageView addSubview:nowPriceLabel];
    
    //原价
    originPriceView = [ZCControl createImageViewFrame:CGRectMake(6+WIDTH/8, 157, WIDTH/8+10, 18) imageName:[NSString stringWithFormat:@"hengxian.png"]];
    [bgImageView addSubview:originPriceView];
    
    originPriceLabel = [ZCControl createLabelWithFrame:CGRectMake(16+WIDTH/8, 157, WIDTH/8, 18) font:12 text:nil];
    [bgImageView addSubview:originPriceLabel];
    
    //喜欢
    
    loveNumberLabel = [ZCControl createLabelWithFrame:CGRectMake(WIDTH/8+84, 154, 30, 20) font:13 text:nil];
    loveNumberLabel.textColor = [UIColor orangeColor];
    loveNumberLabel.textAlignment = NSTextAlignmentLeft;
    [bgImageView addSubview:loveNumberLabel];
    
}

-(void)configModel1:(ZheKouModel *)model
{
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];

    
    
    
    NSString *title = [NSString stringWithFormat:@"[%@折]%@",model.discount,model.title];
    
    titleLabel.text = title;
    
    NSString *nowprice = [NSString stringWithFormat:@"￥%@",model.now_price];
    nowPriceLabel.text = nowprice;
    
    NSString *originprice = [NSString stringWithFormat:@"￥%@",model.origin_price];
    originPriceLabel.text = originprice;
    
    loveNumberLabel.text = model.deal_num;

}


- (void)configModel:(ChaozhijiukuaijiuModel *)model
{
    
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    NSString *title = [NSString stringWithFormat:@"[%@折]%@",[model.discount stringValue],model.title];
    
    titleLabel.text = title;
    
    NSString *nowprice = [NSString stringWithFormat:@"￥%@",[model.now_price stringValue]];
    nowPriceLabel.text = nowprice;
    
    NSString *originprice = [NSString stringWithFormat:@"￥%@",[model.origin_price stringValue]];
    originPriceLabel.text = originprice;
    
    loveNumberLabel.text = [model.total_love_number stringValue];
    
}

-(void)configModel2:(ChooseModel *)model
{
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    
    
    NSString *title = [NSString stringWithFormat:@"[%@折]%@",model.discount,model.title];
    
    titleLabel.text = title;
    
    NSString *nowprice = [NSString stringWithFormat:@"￥%@",model.now_price];
    nowPriceLabel.text = nowprice;
    
    NSString *originprice = [NSString stringWithFormat:@"￥%@",model.origin_price];
    originPriceLabel.text = originprice;
    
    loveNumberLabel.text = model.click;

}

-(void)configModel3:(FashionModel *)model
{
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_path]];
    
    
    NSString *title = [NSString stringWithFormat:@"[%@折]%@",model.discount,model.title];
    
    titleLabel.text = title;
    
    NSString *nowprice = [NSString stringWithFormat:@"￥%@",[model.price_with_rate stringValue]];
    nowPriceLabel.text = nowprice;
    
    NSString *originprice = [NSString stringWithFormat:@"￥%@",[model.price stringValue]];
    originPriceLabel.text = originprice;
    
    loveNumberLabel.text = model.sold;

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
