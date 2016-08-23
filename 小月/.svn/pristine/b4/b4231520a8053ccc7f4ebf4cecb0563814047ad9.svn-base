//
//  OpenReportTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "OpenReportTableViewCell.h"

@implementation OpenReportTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}



- (void)createKit{
    self.OpenSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.OpenSelectBtn.frame = CGRectMake(20, 15, 20, 20);
    self.OpenSelectBtn.layer.cornerRadius = 10;
    self.OpenSelectBtn.clipsToBounds = YES;
    self.OpenSelectBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    self.OpenSelectBtn.layer.borderWidth = 1;
    self.OpenSelectBtn.layer.masksToBounds = YES;
    self.OpenSelectBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:self.OpenSelectBtn];
    
    self.OpenImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.OpenImageBtn.frame = CGRectMake(60, 5,40, 40);
    self.OpenImageBtn.layer.cornerRadius = 20;
    self.OpenImageBtn.clipsToBounds = YES;
    self.OpenImageBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    [self addSubview:self.OpenImageBtn];
    
    self.OpenNameLab = [[UILabel alloc]initWithFrame:CGRectMake(40+80, 5, WIDTH/2, 20)];
    self.OpenNameLab.textColor = TEXTCOLOR;
    self.OpenNameLab.font = [UIFont systemFontOfSize:16];
    self.OpenNameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.OpenNameLab];
    
    self.OpenSignLab = [[UILabel alloc]initWithFrame:CGRectMake(40+80, 25, WIDTH/2, 20)];
    self.OpenSignLab .textColor = TEXTTINTCOLOR;
    self.OpenSignLab .font = [UIFont systemFontOfSize:14];
    self.OpenSignLab .textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.OpenSignLab ];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 48, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
