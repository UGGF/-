//
//  MySettingTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MySettingTableViewCell.h"

@implementation MySettingTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _myLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH, 50)];
    _myLable.textColor = TEXTCOLOR;
    _myLable.textAlignment = NSTextAlignmentLeft;
    _myLable.font = [UIFont systemFontOfSize:16];
    [self addSubview:_myLable];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 48, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
