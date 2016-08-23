//
//  TradeTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "TradeTableViewCell.h"

@implementation TradeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createCellControl];
}


- (void)createCellControl{
    _textLable = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 80, 20)];
    _textLable.textColor = TEXTCOLOR;
    _textLable.font = [UIFont systemFontOfSize:13];
    [self addSubview:_textLable];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, 48, WIDTH-40, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
    
//    _GouBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _GouBtn.frame = CGRectMake(WIDTH-40, 15, 20, 20);
//    _GouBtn.layer.cornerRadius = 10;
//    _GouBtn.clipsToBounds = YES;
//    _GouBtn.backgroundColor = TEXTTINTCOLOR;
//    [self addSubview:_GouBtn];

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
