//
//  IdentifyTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "IdentifyTableViewCell.h"

@implementation IdentifyTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _propertyLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH/2, HEIGHT/10)];
    _propertyLab.textColor = TEXTCOLOR;
    _propertyLab.font = [UIFont systemFontOfSize:15];
    _propertyLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_propertyLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/10-2, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
