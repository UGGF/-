//
//  SetUserTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SetUserTableViewCell.h"

@implementation SetUserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createKit];
}

- (void)createKit{
//    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    selectBtn.frame = CGRectMake(20, 20, 20, 20);
//    selectBtn.layer.cornerRadius = 10;
//    selectBtn.clipsToBounds = YES;
//    selectBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
//    selectBtn.layer.borderWidth = 1;
//    selectBtn.layer.masksToBounds = YES;
//    selectBtn.adjustsImageWhenHighlighted = NO;
//    [self addSubview:selectBtn];

    self.imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.imageBtn.frame = CGRectMake(20, 10,40, 40);
    self.imageBtn.layer.cornerRadius = 20;
    self.imageBtn.clipsToBounds = YES;
    self.imageBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    [self addSubview:self.imageBtn];
    
   self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, WIDTH/2, 20)];
    self.nameLab.textColor = TEXTCOLOR;
    self.nameLab.font = [UIFont systemFontOfSize:15];
    self.nameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.nameLab];
    
    self.signLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 30, WIDTH/2, 20)];
    self.signLab .textColor = TEXTTINTCOLOR;
    self.signLab .font = [UIFont systemFontOfSize:12];
    self.signLab .textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.signLab ];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, WIDTH, 1)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
