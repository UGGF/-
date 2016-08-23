//
//  BaseDataTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "BaseDataTableViewCell.h"

@implementation BaseDataTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 40, 20)];
        self.nameLabel.textColor = TEXTCOLOR;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.nameLabel];
        
        self.detailLB = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, WIDTH - 50 - 30, 20)];
        self.detailLB.textColor = RGBCOLOR(51, 51, 51);
        self.detailLB.font = [UIFont systemFontOfSize:16];
        self.detailLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.detailLB];
        
        self.phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, WIDTH - 50 - 30, 20)];
        self.phoneTF.textColor = RGBCOLOR(51, 51, 51);
        self.phoneTF.font = [UIFont systemFontOfSize:16];
        self.phoneTF.hidden = YES;
        self.phoneTF.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.phoneTF];
        
        self.ageTF = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, WIDTH - 50 - 30, 20)];
        self.ageTF.textColor = RGBCOLOR(51, 51, 51);
        self.ageTF.font = [UIFont systemFontOfSize:16];
        self.ageTF.hidden = YES;
        self.ageTF.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.ageTF];
        
        self.addressLabel = [[BBFlashCtntLabel alloc]initWithFrame:CGRectMake(50, 10, WIDTH - 50 - 30, 20)];
        self.addressLabel.textColor = RGBCOLOR(51, 51, 51);
        self.addressLabel.font = [UIFont systemFontOfSize:16];
        self.addressLabel.hidden = YES;
        [self addSubview:self.addressLabel];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
