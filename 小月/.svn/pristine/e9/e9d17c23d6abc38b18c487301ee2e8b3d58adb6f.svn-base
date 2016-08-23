//
//  MyOrderTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/16.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MyOrderTableViewCell.h"

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createView];
}

- (void)createView{
    
    _imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(15, HEIGHT/48, 120, 80)];
    _imaInfoView.layer.cornerRadius = 3;
    _imaInfoView.clipsToBounds = YES;
    [self.contentView addSubview:_imaInfoView];
    
    _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, HEIGHT/48, 100, 20)];
    _nameLab.textColor = BGCOLOR;
    _nameLab.font = [UIFont systemFontOfSize:16];
    _nameLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_nameLab];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+60+10, HEIGHT/48, 100, 20)];
    _lab.textColor = TEXTCOLOR;
    _lab.font = [UIFont systemFontOfSize:16];
    _lab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_lab];
    
    _moonLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, HEIGHT/16, 50, 20)];
    _moonLab.textColor = TEXTCOLOR;
    _moonLab.font = [UIFont systemFontOfSize:13];
    _moonLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_moonLab];
    
    _sizeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10, HEIGHT/16, 50, 20)];
    _sizeLab.textColor = CAOGREENCOLOR;
    _sizeLab.font = [UIFont systemFontOfSize:13];
    _sizeLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_sizeLab];
    
    _editionLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10+50, HEIGHT/16, 50, 20)];
    _editionLab.textColor = CAOGREENCOLOR;
    _editionLab.font = [UIFont systemFontOfSize:13];
    _editionLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_editionLab];
    
    _typeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, HEIGHT*0.1, 120, 20)];
    _typeLab.textColor = CAOGREENCOLOR;
    _typeLab.font = [UIFont systemFontOfSize:13];
    _typeLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_typeLab];
    
    _colorLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+10, HEIGHT*0.1, 100, 20)];
    _colorLab.textColor = CAOGREENCOLOR;
    _colorLab.font = [UIFont systemFontOfSize:13];
    _colorLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_colorLab];
    
    _signLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, HEIGHT*0.15, 100, 20)];
    _signLab.textColor = REDCOLOR;
    _signLab.font = [UIFont systemFontOfSize:13];
    _signLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_signLab];
    
    _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+10, HEIGHT*0.15, 100, 20)];
    _priceLab.textColor = REDCOLOR;
    _priceLab.font = [UIFont systemFontOfSize:14];
    _priceLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_priceLab];
    
    _signNumLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+30, HEIGHT*0.15, 100, 20)];
    _signNumLab.textColor = REDCOLOR;
    _signNumLab.font = [UIFont systemFontOfSize:14];
    _signNumLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_signNumLab];
    
    _numLab = [[UILabel alloc]initWithFrame:CGRectMake(25+120+10+100+30, HEIGHT*0.15, 100, 20)];
    _numLab.textColor = REDCOLOR;
    _numLab.font = [UIFont systemFontOfSize:14];
    _numLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_numLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.2, WIDTH, 1)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.contentView addSubview:line];
    
    _timeLab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT*0.205, WIDTH/2-15, 20)];
    _timeLab.textColor = TEXTCOLOR;
    _timeLab.font = [UIFont systemFontOfSize:14];
    _timeLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_timeLab];

    _numTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20-60, HEIGHT*0.205, 70, 20)];
    _numTotalLab.textColor = REDCOLOR;
    _numTotalLab.font = [UIFont systemFontOfSize:14];
    _numTotalLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_numTotalLab];
    
    _priceTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20-60-40, HEIGHT*0.205, 40, 20)];
    _priceTotalLab.textColor = TEXTCOLOR;
    _priceTotalLab.font = [UIFont systemFontOfSize:14];
    _priceTotalLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_priceTotalLab];
    

    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.245, WIDTH, 5)];
    line1.backgroundColor = LINECOLOR;
    [self.contentView addSubview:line1];

    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
