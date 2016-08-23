//
//  SR-SelectExpertCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/7/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SR-SelectExpertCell.h"

@implementation SR_SelectExpertCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(30, HEIGHT/9-1, WIDTH-20, 1)];
        line.backgroundColor = LINECOLOR;
        [self addSubview:line];
        
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.textColor = TEXTCOLOR;
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        self.detailTextLabel.textColor = TEXTTINTCOLOR;
        
        
        self.seleCellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.seleCellBtn.layer.cornerRadius = 10;
        self.seleCellBtn.layer.borderColor = LINECOLOR.CGColor;
        self.seleCellBtn.layer.borderWidth = 1.0;
        self.seleCellBtn.layer.masksToBounds = YES;
        self.seleCellBtn.adjustsImageWhenHighlighted = NO;
        [self.contentView addSubview:self.seleCellBtn];

        
    }
    return  self;
}


- (void)layoutSubviews{
    self.imageView.frame = CGRectMake(30, (HEIGHT/9-40)/2, 40, 40);
    self.textLabel.frame = CGRectMake(80, HEIGHT/9/2-20, 80, 20);
    self.detailTextLabel.frame = CGRectMake(80, HEIGHT/9/2, 40, 20);
    self.seleCellBtn.frame = CGRectMake(WIDTH-40, (HEIGHT/9-20)/2, 20, 20);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
