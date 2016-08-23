//
//  noticeMessageTBCell.m
//  moonletScience
//
//  Created by 苏 on 16/7/30.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "noticeMessageTBCell.h"

@implementation noticeMessageTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        self.headerImage.layer.cornerRadius = 20;
        self.headerImage.clipsToBounds = YES;
        [self addSubview:self.headerImage];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, WIDTH / 2, 20)];
        self.nameLabel.textColor = TEXTCOLOR;
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.nameLabel];
        
        self.detailsLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, WIDTH - 70, 20)];
        self.detailsLabel.textAlignment = NSTextAlignmentLeft;
        self.detailsLabel.textColor = TEXTGRAYCOLOR;
        self.detailsLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.detailsLabel];
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2, 10, WIDTH / 2 - 10, 20)];
        self.timeLabel.textColor = TEXTGRAYCOLOR;
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.timeLabel];
        
        self.friendsImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        [self addSubview:self.friendsImage];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 69, WIDTH, 1)];
        lineView.backgroundColor = LINECOLOR;
        [self addSubview:lineView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
