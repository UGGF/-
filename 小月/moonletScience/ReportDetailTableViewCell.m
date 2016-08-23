//
//  ReportDetailTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ReportDetailTableViewCell.h"

@implementation ReportDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
    _reportLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH-40, (HEIGHT-70)/4/3 )];
    _reportLab.textAlignment = NSTextAlignmentLeft;
    _reportLab.textColor = TEXTCOLOR;
    _reportLab.font = [UIFont systemFontOfSize:15];
    [self addSubview:_reportLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20,(HEIGHT-70)/3/4-2, WIDTH-40, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
