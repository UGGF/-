//
//  AgreeFriendTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/12.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "AgreeFriendTableViewCell.h"

@implementation AgreeFriendTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _groupLab = [[UILabel alloc]initWithFrame:CGRectMake(20,0, WIDTH/2, 40)];
    _groupLab.textColor = TEXTCOLOR;
    _groupLab.textAlignment = NSTextAlignmentLeft;
    _groupLab.font = [UIFont systemFontOfSize:15];
    [self addSubview:_groupLab];
 
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 38, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
