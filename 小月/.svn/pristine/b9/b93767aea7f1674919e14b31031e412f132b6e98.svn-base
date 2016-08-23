//
//  myCareForCell.m
//  moonletScience
//
//  Created by 苏 on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "myCareForCell.h"

@implementation myCareForCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = GRAYCOLOR;
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(5, 3, WIDTH - 10, 60)];
        bgView.backgroundColor = WHITECOLOR;
        bgView.layer.cornerRadius = 3;
        bgView.clipsToBounds = YES;
        [self addSubview:bgView];
        
        self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        self.headerImage.image = [UIImage imageNamed:@"touxiang_yuan"];
        self.headerImage.layer.cornerRadius = 20;
        self.headerImage.clipsToBounds = YES;
        [bgView addSubview:self.headerImage];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, WIDTH / 2, 20)];
        self.nameLabel.text = @"妈妈";
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        self.nameLabel.textColor = TEXTCOLOR;
        [bgView addSubview:self.nameLabel];
        
        self.declareLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 30, WIDTH - 80, 20)];
        self.declareLabel.textAlignment = NSTextAlignmentLeft;
        self.declareLabel.font = [UIFont systemFontOfSize:14];
        [bgView addSubview:self.declareLabel];
        
        self.statImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 40, 10, 15, 15)];
        self.statImageView.image = [UIImage imageNamed:@"sun"];
        [bgView addSubview:self.statImageView];
        
        self.statLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH - 80, 10, 60, 20)];
        self.statLabel.text = @"[无设备]";
        self.statLabel.font = [UIFont systemFontOfSize:14];
        self.statLabel.hidden = YES;
        [bgView addSubview:self.statLabel];
        
        self.impowerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.impowerBtn setTitle:@"[未授权]" forState:UIControlStateNormal];
        [self.impowerBtn setTitleColor:RGBCOLOR(106, 195, 53) forState:UIControlStateNormal];
        self.impowerBtn.frame = CGRectMake(WIDTH - 80 , 10, 70, 60);
        self.impowerBtn.hidden = YES;
        [bgView addSubview:self.impowerBtn];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 59, WIDTH - 10, 1)];
        lineView.backgroundColor = LINECOLOR;
        [bgView addSubview:lineView];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
