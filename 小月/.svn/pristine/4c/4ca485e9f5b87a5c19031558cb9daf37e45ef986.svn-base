//
//  LookPermissonTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "LookPermissonTableViewCell.h"

@implementation LookPermissonTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _lookLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH/2, 30)];
    _lookLab.font = [UIFont systemFontOfSize:13];
    _lookLab.textColor = BLACKTEXTCOLOR;
    _lookLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_lookLab];

    _onSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-20-50, 10, 10, 10)];
    [_onSwitch setOn:NO animated:YES];
    [self addSubview:_onSwitch];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0,48, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self addSubview:line];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure_ the view for the selected state
}

@end
