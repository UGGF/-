//
//  CommentPermissonTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "CommentPermissonTableViewCell.h"

@implementation CommentPermissonTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _forbidLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH, HEIGHT/14)];
    _forbidLab.textColor = TEXTCOLOR;
    _forbidLab.textAlignment = NSTextAlignmentLeft;
    _forbidLab.font = [UIFont systemFontOfSize:15];
    [self addSubview:_forbidLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/14-2, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
