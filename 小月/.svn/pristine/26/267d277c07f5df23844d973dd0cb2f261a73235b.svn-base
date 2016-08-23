//
//  InfoRecordTableViewCell.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "InfoRecordTableViewCell.h"

@implementation InfoRecordTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.headerImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.headerImageView];
        
        //头像
        _myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_myBtn];
        
        self.signImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"expert_icon.png"]];
        self.signImageView.hidden = YES;
        [self.contentView addSubview:self.signImageView];
        
        //昵称
        _titLab = [[UILabel alloc]init];
        _titLab.font = [UIFont systemFontOfSize:16];
        _titLab.text = @"奥巴马得了颈椎病";
        _titLab.textColor =  TEXTCOLOR;
        self.titLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titLab];
        
        _contentLab = [[UILabel alloc]init];
        _contentLab.font = [UIFont systemFontOfSize:14];
        _contentLab.text = @"昨晚睡得很好，请专家团给点建议！--给你妹的建议，滚去睡觉!昨晚睡得很好，请专家团给点建议！--给你妹的建议，滚去睡觉!";
        _contentLab.textColor = TEXTCOLOR;
        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLab.numberOfLines = 0;
        [self.contentView addSubview:_contentLab];
        
        //收藏
        _moonletBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _moonletBtn.frame = CGRectMake(WIDTH - 100,9, 15, 14);
        [_moonletBtn setBackgroundImage:[UIImage imageNamed:@"shouchang.png"] forState:UIControlStateNormal];
        //[_moonletBtn setBackgroundColor:[UIColor redColor]];
        [self.contentView addSubview:_moonletBtn];
        
        _moonNunLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH -80,10,45, 14)];
        _moonNunLab.textColor = TEXTTINTCOLOR;
        [_moonNunLab setFont:[UIFont systemFontOfSize:10]];
        [self.contentView addSubview:_moonNunLab];
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.frame = CGRectMake(WIDTH - 30,10, 15, 14);
        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"share-icon.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_shareBtn];
        
        self.timeLab = [[UILabel alloc]init];
        self.timeLab.frame = CGRectMake(10, 200, 70, 20);
        self.timeLab.font = [UIFont systemFontOfSize:13];
        self.timeLab.textColor = TEXTTINTCOLOR;
        [self.contentView addSubview:self.timeLab];
        
        //点赞
        self.dianzanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.dianzanBtn.frame = CGRectMake(90, 200, 80, 20);
        [self.dianzanBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"meizan" ofType:@"png"]] forState:UIControlStateNormal];
        [self.dianzanBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zan" ofType:@"png"]] forState:UIControlStateSelected];
        CGSize titleSize1 = self.dianzanBtn.titleLabel.bounds.size;
        [self.dianzanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize1.width - 2, 0,-titleSize1.width + 2)];
        [self.dianzanBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
        self.dianzanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        self.dianzanBtn.selected = [[self.resourceDict objectForKey:@"liked"] boolValue];
//        [self.dianzanBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.dianzanBtn];
        
        //评论
        self.pinglunBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.pinglunBtn.frame = CGRectMake(180, 200, 80, 20);
        [self.pinglunBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pinglun" ofType:@"png"]] forState:UIControlStateNormal];
        titleSize1 = self.pinglunBtn.titleLabel.bounds.size;
        [self.pinglunBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize1.width - 2, 0,-titleSize1.width + 2)];
        [self.pinglunBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
        self.pinglunBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //    [pinglunBtn addTarget:self action:@selector(pinglunBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.pinglunBtn];
        
        self.reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.reportBtn.frame = CGRectMake(WIDTH-50, 200, 40, 20);
        [self.reportBtn setTitle:@"举报" forState:UIControlStateNormal];
        [self.reportBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
        self.reportBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.reportBtn addTarget:self action:@selector(reportBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.reportBtn];
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 230, WIDTH, 1)];
        self.lineView.backgroundColor = LINECOLOR;
        [self.contentView addSubview:self.lineView];
        
        
        
        
        self.articleImageOne = [[UIImageView alloc]init];
        self.articleImageOne.hidden = YES;
        [self.contentView addSubview:self.articleImageOne];
        
        self.articleImageTwo = [[UIImageView alloc]init];
        self.articleImageTwo.hidden = YES;
        [self.contentView addSubview:self.articleImageTwo];
        
        self.headerImageView.frame = CGRectMake(10, 10, 40, 40);
        _myBtn.frame = CGRectMake(10, 10, 40, 40);
        self.signImageView.frame = CGRectMake(40, 40,10, 10);
        _titLab.frame = CGRectMake(70,10,WIDTH - 80, 20);
        
        _contentLab.frame = CGRectMake(70,40, WIDTH - 80, 60);
    }
    return self;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
