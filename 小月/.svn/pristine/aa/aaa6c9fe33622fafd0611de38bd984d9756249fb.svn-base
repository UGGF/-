//
//  ReportReasonTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ReportReasonTableViewCell.h"

@implementation ReportReasonTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}


- (void)createKit{
    _myLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH, 40)];
    _myLab.textColor = TEXTCOLOR;
    _myLab.textAlignment = NSTextAlignmentLeft;
    _myLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:_myLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, 38, WIDTH-40, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
