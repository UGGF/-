//
//  ArticleDetailCell.m
//  moonletScience
//
//  Created by 苏 on 16/7/15.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ArticleDetailCell.h"

@implementation ArticleDetailCell

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
        
        self.nickNameLB = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, WIDTH - 190, 20)];
        self.nickNameLB.textAlignment = NSTextAlignmentLeft;
        self.nickNameLB.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.nickNameLB];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 120, 10, 110, 20)];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.textColor = TEXTGRAYCOLOR;
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.timeLabel];
        
        self.commentLB = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, WIDTH - 70, 0 )];
        self.commentLB.textColor = TEXTCOLOR;
        self.commentLB.numberOfLines = 0;
        self.commentLB.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.commentLB];
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.lineView.backgroundColor = LINECOLOR;
        [self addSubview:self.lineView];
               
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
