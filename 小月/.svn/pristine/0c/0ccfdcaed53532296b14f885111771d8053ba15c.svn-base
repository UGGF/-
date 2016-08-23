//
//  AddFriendTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/10.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "AddFriendTableViewCell.h"

@implementation AddFriendTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/3, 20)];
    _detailLabel.textColor = TEXTCOLOR;
    _detailLabel.textAlignment = NSTextAlignmentLeft;
    _detailLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_detailLabel];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 38, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self addSubview:line];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
