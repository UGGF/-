//
//  ForbidGroupTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ForbidGroupTableViewCell.h"

@implementation ForbidGroupTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _deleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleBtn.frame = CGRectMake(20, 15, 18, 18);
    _deleBtn.layer.cornerRadius = 10;
    _deleBtn.clipsToBounds = YES;
    _deleBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:_deleBtn];

    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(60, 10, 30, 30)];
    _headImage.layer.cornerRadius = 15;
    _headImage.clipsToBounds = YES;
    [self addSubview:_headImage];
    
    _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(110, 5, WIDTH/2, 20)];
    _nameLab.textColor = TEXTCOLOR;
    _nameLab.textAlignment = NSTextAlignmentLeft;
    _nameLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:_nameLab];
    
    _signLab = [[UILabel alloc]initWithFrame:CGRectMake(110, 25, WIDTH/2, 20)];
    _signLab.textColor = TEXTTINTCOLOR;
    _signLab.textAlignment = NSTextAlignmentLeft;
    _signLab.font = [UIFont systemFontOfSize:14 ];
    [self addSubview:_signLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 48, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
