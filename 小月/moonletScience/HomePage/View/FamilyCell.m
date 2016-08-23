//
//  FamilyCell.m
//  moonletScience
//
//  Created by 苏 on 16/8/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "FamilyCell.h"

@implementation FamilyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.deleteImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        self.deleteImgView.layer.cornerRadius = 15;
        self.deleteImgView.clipsToBounds = YES;
        self.deleteImgView.image = [UIImage imageNamed:@"fenzu"];
        self.deleteImgView.hidden = YES;
        [self addSubview:self.deleteImgView];
        
        self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, 5, 40, 40)];
        self.headerImage.layer.cornerRadius = 20;
        self.headerImage.clipsToBounds = YES;
        [self addSubview:self.headerImage];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, WIDTH - 110, 20)];
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.textColor = TEXTCOLOR;
        [self addSubview:self.nameLabel];
        
        self.relationLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 25 , WIDTH - 110, 20)];
        self.relationLabel.font = [UIFont systemFontOfSize:16];
        self.relationLabel.textAlignment = NSTextAlignmentLeft;
        self.relationLabel.textColor = TEXTCOLOR;
        [self addSubview:self.relationLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
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
