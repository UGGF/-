//
//  SelectAdressTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/19.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SelectAdressTableViewCell.h"

@implementation SelectAdressTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createSubView];
}

- (void)createSubView{
    _tickedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tickedBtn.frame = CGRectMake(10, 40, 20, 20);
    _tickedBtn.backgroundColor = TEXTTINTCOLOR;
    [_tickedBtn setTitle:@"" forState:UIControlStateNormal];
    _tickedBtn.selected = YES;
    _tickedBtn.layer.cornerRadius = 10;
    _tickedBtn.clipsToBounds = YES;
    _tickedBtn.adjustsImageWhenHighlighted = NO;
//    [_tickedBtn addTarget:self action:@selector(tickedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_tickedBtn];
    
    NSArray *array = @[@"收货人",@"手机号",@"收货地址"];
    for (int i = 0; i < 3; i++) {
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(40, 5+i*18, 60, 20)];
        _lab.textColor = TEXTCOLOR;
        _lab.text = array[i];
        _lab.font = [UIFont systemFontOfSize:14];
        _lab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_lab];
    }
    
    NSArray *detailArr = @[@"王三",@"15888122479",@"浙江省宁波市江东区中山东路455号东海曙光大厦20楼B1"];
    for (int i = 0; i < 3; i++) {
        _detailLab = [[UILabel alloc]initWithFrame:CGRectMake(110, 5+i*18, 200, 20)];
        _detailLab.textColor = TEXTCOLOR;
        _detailLab.text = detailArr[i];
        _detailLab.font = [UIFont systemFontOfSize:14];
        _detailLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_detailLab];
        if (i == 2) {
            [_detailLab removeFromSuperview];
            _detailLab = [[UILabel alloc]initWithFrame:CGRectMake(110, 5+2*18, 200, 40)];
            _detailLab.numberOfLines = 0;
            _detailLab.text = detailArr[2];
            _detailLab.textColor = TEXTCOLOR;
            _detailLab.font = [UIFont systemFontOfSize:14];
            _detailLab.textAlignment = NSTextAlignmentLeft;
            [self addSubview:_detailLab];
        }
    }
    
    _defaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _defaultBtn.frame = CGRectMake(WIDTH-70, 5, 60, 20);
    _defaultBtn.clipsToBounds = YES;
    _defaultBtn.adjustsImageWhenHighlighted = NO;
    _defaultBtn.selected = YES;
    [_defaultBtn setTitle:@"[设为默认]" forState:UIControlStateNormal];
    [_defaultBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    _defaultBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//    [_defaultBtn addTarget:self action:@selector(defaultBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_defaultBtn];
    
    _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.frame = CGRectMake(WIDTH-50, 25, 30, 20);
    _editBtn.adjustsImageWhenHighlighted = NO;
    [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    _editBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//    [editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_editBtn];

    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 98, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self addSubview:line];






}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
