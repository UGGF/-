//
//  ShopCarTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/20.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ShopCarTableViewCell.h"

@implementation ShopCarTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createView];
}



- (void)createView{
    
    _imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 120, 80)];
    _imaInfoView.layer.cornerRadius = 3;
    _imaInfoView.clipsToBounds = YES;
    [self addSubview:_imaInfoView];
    
    _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 15, 100, 20)];
    _nameLab.textColor = BGCOLOR;
    _nameLab.font = [UIFont systemFontOfSize:15];
    _nameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_nameLab];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+60+10, 15, 100, 20)];
    _lab.textColor = TEXTCOLOR;
    _lab.font = [UIFont systemFontOfSize:15];
    _lab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_lab];
    
    _moonLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 15+30, 50, 20)];
    _moonLab.textColor = TEXTCOLOR;
    _moonLab.font = [UIFont systemFontOfSize:12];
    _moonLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_moonLab];
    
    _sizeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10, 15+30, 50, 20)];
    _sizeLab.textColor = CAOGREENCOLOR;
    _sizeLab.font = [UIFont systemFontOfSize:12];
    _sizeLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_sizeLab];
    
    _editionLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10+50, 15+30, 50, 20)];
    _editionLab.textColor = CAOGREENCOLOR;
    _editionLab.font = [UIFont systemFontOfSize:12];
    _editionLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_editionLab];
    
    _typeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 15+30+20, 100, 20)];
    _typeLab.textColor = CAOGREENCOLOR;
    _typeLab.font = [UIFont systemFontOfSize:12];
    _typeLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_typeLab];
    
    _colorLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+10, 15+30+20, 100, 20)];
    _colorLab.textColor = CAOGREENCOLOR;
    _colorLab.font = [UIFont systemFontOfSize:12];
    _colorLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_colorLab];
    
    _signLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 15+30+20+20+5, 100, 20)];
    _signLab.textColor = REDCOLOR;
    _signLab.font = [UIFont systemFontOfSize:12];
    _signLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_signLab];
    
    _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+10, 15+30+20+20+5, 100, 20)];
    _priceLab.textColor = REDCOLOR;
    _priceLab.font = [UIFont systemFontOfSize:12];
    _priceLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_priceLab];
    
    _signNumLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+30, 15+30+20+20+5, 100, 20)];
    _signNumLab.textColor = REDCOLOR;
    _signNumLab.font = [UIFont systemFontOfSize:12];
    _signNumLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_signNumLab];
    
    _numLab = [[UILabel alloc]initWithFrame:CGRectMake(25+120+10+100+30, 15+30+20+20+5, 100, 20)];
    _numLab.textColor = REDCOLOR;
    _numLab.font = [UIFont systemFontOfSize:12];
    _numLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_numLab];
    
    
        
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.frame = CGRectMake(15, 95, 30, 20);
    _deleteBtn.clipsToBounds = YES;
    _deleteBtn.adjustsImageWhenHighlighted = NO;
    [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteBtn setTitleColor:REDCOLOR forState:UIControlStateNormal];
    _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_deleteBtn];

    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 118, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self addSubview:line];

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
