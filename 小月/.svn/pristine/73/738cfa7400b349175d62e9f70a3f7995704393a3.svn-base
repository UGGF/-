//
//  InfoTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.InLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 20)];
        self.InLabel.textColor = TEXTCOLOR;
        self.InLabel.textAlignment = NSTextAlignmentLeft;
        self.InLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.InLabel];
        
        self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, WIDTH - 100, 20)];
        self.detailLabel.textColor = TEXTCOLOR;
        self.detailLabel.textAlignment = NSTextAlignmentRight;
        self.detailLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.detailLabel];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 39, WIDTH, 1)];
        line.backgroundColor = LINECOLOR;
        [self addSubview:line];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
