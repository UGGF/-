//
//  groupCell.m
//  moonletScience
//
//  Created by 苏 on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "groupCell.h"

@implementation groupCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

            //
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 5, 30, 30)];
                imageView.layer.cornerRadius = 15;
                imageView.clipsToBounds = YES;
                imageView.image = [UIImage imageNamed:@"fenzu"];
                [self addSubview:imageView];
                
                self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                self.deleteBtn.frame = CGRectMake(0, 0, WIDTH / 2, 40);
                [self addSubview:self.deleteBtn];
        
                self.groupNameLB = [[UILabel alloc]initWithFrame:CGRectMake(70, 10 , WIDTH - 70, 20)];
                self.groupNameLB.font = [UIFont systemFontOfSize:16];
                [self addSubview:self.groupNameLB];
        
                UIImageView *setImage = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 80, 10 , 30, 20)];
                setImage.image = [UIImage imageNamed:@"fenzu_1"];
                [self addSubview:setImage];
        
        
                self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                self.editBtn.frame = CGRectMake(WIDTH / 2, 0, WIDTH / 2,40 );
                [self addSubview:self.editBtn];
        
               UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39, WIDTH, 1)];
                lineView.backgroundColor = GRAYCOLOR;
                [self addSubview:lineView];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
