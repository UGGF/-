//
//  moonLetTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/5.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "moonLetTableViewCell.h"

@implementation moonLetTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createCellControl];
}

- (void)createCellControl{
    _myImage = [[UIView alloc]init];
    _myImage.layer.cornerRadius = 3;
    _myImage.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_myImage];
    
    //头像
    _myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _myBtn.adjustsImageWhenHighlighted = NO;
    _myBtn.layer.cornerRadius = 20;
    _myBtn.clipsToBounds = YES;
    [_myImage addSubview:_myBtn];
    
    self.headerImage = [[UIImageView alloc]init];
    self.headerImage.layer.cornerRadius = 20;
    self.headerImage.clipsToBounds = YES;
    [_myImage addSubview:self.headerImage];
    
    //时间
    _timeLab = [[UILabel alloc]init];
    _timeLab.font = [UIFont systemFontOfSize:13];
    _timeLab.textColor = TEXTTINTCOLOR;
    [_myImage addSubview:_timeLab];
    
    //主题
    _titleLab = [[UILabel alloc]init];
    _titleLab.font = [UIFont systemFontOfSize:16];
    _titleLab.textColor =  TEXTCOLOR;
    [_myImage addSubview:_titleLab];
    
    _signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _signBtn.layer.borderColor = BGCOLOR.CGColor;
    _signBtn.layer.borderWidth = 1;
    _signBtn.layer.cornerRadius = 3;
    [_signBtn setTitleColor:BGCOLOR forState:UIControlStateNormal];
    _signBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_myImage addSubview:_signBtn];
    
  
//
        //文章内容
        _contentLab = [[UILabel alloc]init];
        _contentLab.font = [UIFont systemFontOfSize:14];
        _contentLab.textColor = TEXTTINTCOLOR;
    _contentLab.hidden = YES;
        //    _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLab.numberOfLines = 0;
        [_myImage addSubview:_contentLab];
   
    self.imaV = [[UIImageView alloc]init];
    self.imaV.image = [UIImage imageNamed:@"weibo"];
    self.imaV.frame = CGRectMake(10+50+10, 15+15+5, 40, 40);
    self.imaV.hidden = YES;
    [_myImage addSubview:self.imaV];
    
    self.imaV1 = [[UIImageView alloc]init];
    self.imaV1.image = [UIImage imageNamed:@"weibo"];
    self.imaV1.frame = CGRectMake(10+50+10+50, 15+15+5, 40, 40);
    self.imaV1.hidden = YES;
    [_myImage addSubview:self.imaV1];
    
    self.imaV2 = [[UIImageView alloc]init];
    self.imaV2.image = [UIImage imageNamed:@"weibo"];
    self.imaV2.frame = CGRectMake(10+50+10+100, 15+15+5, 40, 40);
    self.imaV2.hidden = YES;
    [_myImage addSubview:self.imaV2];
    
    self.imaV3 = [[UIImageView alloc]init];
    self.imaV3.image = [UIImage imageNamed:@"weibo"];
    self.imaV3.frame = CGRectMake(10+50+10+150, 15+15+5, 40, 40);
    self.imaV3.hidden = YES;
    [_myImage addSubview:self.imaV3];

   
    
    _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _collectBtn.frame = CGRectMake(16+50+10, 86, 85, 14);
    [self.collectBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shouchang" ofType:@"png"]] forState:UIControlStateNormal];
    [self.collectBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shoucang" ofType:@"png"]] forState:UIControlStateSelected];
    CGSize titleSize = self.collectBtn.titleLabel.bounds.size;
    [self.collectBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width - 2, 0,-titleSize.width + 2)];
    [self.collectBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    self.collectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_collectBtn];
    
//    _collectLab = [[UILabel alloc]initWithFrame:CGRectMake(75+15+5 ,86, 70, 14)];
//    _collectLab.textColor = TEXTTINTCOLOR;
//    [_collectLab setFont:[UIFont systemFontOfSize:13]];
//    [self.contentView addSubview:_collectLab];
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _praiseBtn.frame = CGRectMake(75+15+5+30+40, 86, 85, 14);
    [self.praiseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"meizan" ofType:@"png"]] forState:UIControlStateNormal];
    [self.praiseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zan" ofType:@"png"]] forState:UIControlStateSelected];
    CGSize titleSize1 = self.collectBtn.titleLabel.bounds.size;
    [self.praiseBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize1.width - 2, 0,-titleSize1.width + 2)];
    [self.praiseBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    self.praiseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_praiseBtn];
    
    //评论图标
   _reviewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _reviewBtn.frame = CGRectMake(WIDTH-50, 86, 15, 14);
    [_reviewBtn setBackgroundImage:[UIImage imageNamed:@"pinglun.png"] forState:UIControlStateNormal];
    //[moonletBtn setBackgroundColor:[UIColor redColor]];
    [self.contentView addSubview:_reviewBtn];
    
    //评论数字
    _reviewNumLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-30, 86, 30, 14)];
    _reviewNumLab.textColor = TEXTTINTCOLOR;
    [_reviewNumLab setFont:[UIFont systemFontOfSize:13]];
    [self.contentView addSubview:_reviewNumLab];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _myImage.frame = CGRectMake(5, 5, WIDTH-6, self.frame.size.height-5);
    _timeLab.frame = CGRectMake(13, 23+55, 55, 20);
    _myBtn.frame = CGRectMake(5, 0, 60, 105);
    self.headerImage.frame = CGRectMake(15, 20, 40, 40);
    _titleLab.frame = CGRectMake(10+50+10, 15,WIDTH-75-60, 15);
    _signBtn.frame = CGRectMake(WIDTH-70, 14,60, 15);
    _contentLab.frame = CGRectMake(10+50+10, 15+15, WIDTH-75-20, 50);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
