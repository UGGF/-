//
//  CloseReportTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "CloseReportTableViewCell.h"

@implementation CloseReportTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}


- (void)createKit{
    self.CloseSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.CloseSelectBtn.frame = CGRectMake(20, 20, 20, 20);
    self.CloseSelectBtn.layer.cornerRadius = 10;
    self.CloseSelectBtn.clipsToBounds = YES;
    self.CloseSelectBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    self.CloseSelectBtn.layer.borderWidth = 1;
    self.CloseSelectBtn.layer.masksToBounds = YES;
    self.CloseSelectBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:self.CloseSelectBtn];
    
    self.CloseImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.CloseImageBtn.frame = CGRectMake(60, 10,40, 40);
    self.CloseImageBtn.layer.cornerRadius = 20;
    self.CloseImageBtn.clipsToBounds = YES;
    self.CloseImageBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    [self addSubview:self.CloseImageBtn];
    
    self.CloseNameLab = [[UILabel alloc]initWithFrame:CGRectMake(40+80, 10, WIDTH/2, 20)];
    self.CloseNameLab.textColor = TEXTCOLOR;
    self.CloseNameLab.font = [UIFont systemFontOfSize:15];
    self.CloseNameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.CloseNameLab];
    
    self.CloseSignLab = [[UILabel alloc]initWithFrame:CGRectMake(40+80, 30, WIDTH/2, 20)];
    self.CloseSignLab .textColor = TEXTTINTCOLOR;
    self.CloseSignLab .font = [UIFont systemFontOfSize:12];
    self.CloseSignLab .textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.CloseSignLab ];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, WIDTH, 1)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
