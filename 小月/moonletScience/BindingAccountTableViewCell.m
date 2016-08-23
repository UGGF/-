//
//  BindingAccountTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "BindingAccountTableViewCell.h"

@implementation BindingAccountTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.bindLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-200, 15, 170, 20)];
    //bindLable.backgroundColor = BGCOLOR;
    self.bindLab.font = [UIFont systemFontOfSize:15];
    self.bindLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.bindLab];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
