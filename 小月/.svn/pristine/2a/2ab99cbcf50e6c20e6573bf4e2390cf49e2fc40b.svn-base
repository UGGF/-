//
//  SR-AppraisalRepView.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/7/15.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SR-AppraisalRepView.h"

@implementation SR_AppraisalRepView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createContentView];
        [self createDataView];
    }
    return self;
}

- (void)createContentView{
    UILabel *repoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 40)];
    repoLab.numberOfLines = 0;
    repoLab.text = @"seeleep小月睡眠评估系统\n以下报告鉴于当日的睡眠数据得出";
    repoLab.textColor = TEXTCOLOR;
    repoLab.font = [UIFont systemFontOfSize:16];
    repoLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:repoLab];
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:repoLab.text];
    NSRange range = [[att string] rangeOfString:@"seeleep小月睡眠评估系统"];
    NSRange range1 = [[att string] rangeOfString:@"当日"];
    [att addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range];
    [att addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range1];
    repoLab.attributedText = att;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 58  , WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self addSubview:line];
    
    //数据采集相关
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 20)];
    cicView.backgroundColor = [UIColor whiteColor];;
    [self addSubview:cicView];
    
    NSString *dataStr = @"2016.04.18";
    UILabel *contLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0 , WIDTH/2+40, HEIGHT/13-3-2)];
    contLab.text = [NSString stringWithFormat:@"数据采集日期: %@",dataStr];
    contLab.textColor = TEXTCOLOR;
    contLab.font = [UIFont systemFontOfSize:15];
    contLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:contLab];
    
    NSString *sleStr = @"睡眠";
    UILabel *claLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-120, 0 , 100, HEIGHT/13-3-2)];
    claLab.text = [NSString stringWithFormat:@"类目:%@",sleStr];
    claLab.textColor = TEXTCOLOR;
    claLab.font = [UIFont systemFontOfSize:15];
    claLab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:claLab];
    
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0,  HEIGHT/9 + 3 + HEIGHT/13 - 3 -2 -3, WIDTH, 3)];
    line1.backgroundColor = LINECOLOR;
    [self addSubview:line1];
    
}

- (void)createDataView{
    UIView *dataView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/9 + HEIGHT/12 , WIDTH, HEIGHT- (70 + HEIGHT/9 + HEIGHT/12 + HEIGHT/7))];
    dataView.backgroundColor = [UIColor whiteColor];;
    [self addSubview:dataView];
    
    //数据来源
    UILabel *contLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0 , 90, HEIGHT/15)];
    contLab.text = @"数据来源";
    contLab.textColor = TEXTCOLOR;
    contLab.font = [UIFont systemFontOfSize:14];
    contLab.textAlignment = NSTextAlignmentLeft;
    [dataView addSubview:contLab];
    
    UILabel *testLab = [[UILabel alloc]initWithFrame:CGRectMake(110, 0 , 90, HEIGHT/15)];
    testLab.text = @"睡眠监测";
    testLab.textColor = TEXTCOLOR;
    testLab.font = [UIFont systemFontOfSize:14];
    testLab.textAlignment = NSTextAlignmentLeft;
    [dataView addSubview:testLab];
    
    //检测难度
    UILabel *monitorLab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT/15-10 , 90, HEIGHT/15)];
    monitorLab.text = @"监测维度";
    monitorLab.textColor = TEXTCOLOR;
    monitorLab.font = [UIFont systemFontOfSize:14];
    monitorLab.textAlignment = NSTextAlignmentLeft;
    [dataView addSubview:monitorLab];
    
    UILabel *conLab = [[UILabel alloc]init];
    conLab.numberOfLines = 0;
    conLab.text = @"睡眠总时长、入睡时间、深睡总时长、浅睡总时长、REM总时长、清醒次数、体动次数、心率、呼吸率、睡眠环境的温度、湿度、噪音、光照";
    conLab.font = [UIFont systemFontOfSize:14];
    CGSize textsize = [self sizeWithText:conLab.text font:conLab.font maxSize:CGSizeMake(WIDTH-110-10, MAXFLOAT)];
    conLab.frame = CGRectMake(110, HEIGHT/11.5-10, textsize.width, textsize.height);
    conLab.textColor = TEXTCOLOR;
    [dataView addSubview:conLab];
    
    //系统建议
    UILabel *sysLab = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(conLab.frame) , 90, HEIGHT/15)];
    sysLab.text = @"系统建议";
    sysLab.textColor = TEXTCOLOR;
    sysLab.font = [UIFont systemFontOfSize:14];
    sysLab.textAlignment = NSTextAlignmentLeft;
    [dataView addSubview:sysLab];
    
    UILabel *sugLab = [[UILabel alloc]initWithFrame:CGRectMake(110, CGRectGetMaxY(conLab.frame), WIDTH-120, HEIGHT/15)];
    sugLab.text = @"每天睡眠充足,寿命可达100岁";
    sugLab.textColor = REDCOLOR;
    sugLab.font = [UIFont systemFontOfSize:14];
    sugLab.textAlignment = NSTextAlignmentLeft;
    [dataView addSubview:sugLab];
    
    //本报告仅供参考
    UILabel *refLab = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(sugLab.frame)-10 , WIDTH/2, HEIGHT/15)];
    refLab.text = @"本报告仅供参考";
    refLab.textColor = TEXTCOLOR;
    refLab.font = [UIFont systemFontOfSize:14];
    refLab.textAlignment = NSTextAlignmentLeft;
    [dataView addSubview:refLab];
    
    UILabel *repoLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, CGRectGetMaxY(sugLab.frame)-10 , WIDTH/2-20, HEIGHT/15)];
    repoLab.text = @"报告:seeleep";
    repoLab.textColor = TEXTCOLOR;
    repoLab.font = [UIFont systemFontOfSize:14];
    repoLab.textAlignment = NSTextAlignmentRight;
    [dataView addSubview:repoLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(repoLab.frame)-2, WIDTH-30, 2)];
    line.backgroundColor = LINECOLOR;
    [dataView addSubview:line];
    
    //专家建议

    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(repoLab.frame) , WIDTH, HEIGHT- (70 + HEIGHT/9 + HEIGHT/12 + HEIGHT/7)-CGRectGetMaxY(repoLab.frame))];
    bgView.backgroundColor = WHITECOLOR;
    [dataView addSubview:bgView];
    
    // 请专家诊断按钮
    self.diagnoseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.diagnoseBtn.frame = CGRectMake(WIDTH/2-50, bgView.frame.size.height/2, 100, 30);
    self.diagnoseBtn.backgroundColor = CAOGREENCOLOR;
    self.diagnoseBtn.layer.cornerRadius = 3;
    self.diagnoseBtn.adjustsImageWhenHighlighted = NO;
    [self.diagnoseBtn setTitle:@"请专家诊断" forState:UIControlStateNormal];
    [self.diagnoseBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    self.diagnoseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:self.diagnoseBtn];

//    
//    UILabel *expLab = [[UILabel alloc]initWithFrame:CGRectMake(20, -3 , WIDTH/2-10, HEIGHT/15)];
//    expLab.text = @"专家建议";
//    expLab.textColor = TEXTCOLOR;
//    expLab.font = [UIFont systemFontOfSize:14];
//    [bgView addSubview:expLab];
//
//    UITextView *message = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(expLab.frame) -5, WIDTH-40, HEIGHT- (70 + HEIGHT/9 + HEIGHT/12 + HEIGHT/7)-CGRectGetMaxY(repoLab.frame)-HEIGHT/15)];
//    message.textColor = REDCOLOR;
//    message.font = [UIFont fontWithName:@"Arial" size:14];
//    message.layer.borderWidth = 1.2;
//    message.layer.borderColor = LINECOLOR.CGColor;
//    message.layer.masksToBounds = YES;
//    message.editable = NO;
//    message.text = @"一周来深睡眠平均时长达8h/天,建议保持充足睡眠,适当运动,多吃冬虫夏草,有问题欢迎致电18888888888";
//    [bgView addSubview:message];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dataView.frame), WIDTH, 1)];
    line2.backgroundColor = LINECOLOR;
    [self addSubview:line2];
    
    
    
    UIView *cicAdView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dataView.frame)+5, WIDTH, (HEIGHT/7-10))];
    cicAdView.backgroundColor = WHITECOLOR;
    [self addSubview:cicAdView];
    
    UIView *imaView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, (HEIGHT/7-10-20), (HEIGHT/7-10-20))];
    imaView.layer.cornerRadius =  (HEIGHT/7-10-20)/2;
    imaView.clipsToBounds = YES;
    imaView.backgroundColor = WHITECOLOR;
    imaView.layer.borderWidth = 1;
    imaView.layer.borderColor = TEXTTINTCOLOR.CGColor;
    imaView.layer.masksToBounds =YES;
    [cicAdView addSubview:imaView];
    
    UILabel *adverLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imaView.frame) + 10, (HEIGHT/7-10)/2-10 , WIDTH-(HEIGHT/7-10-20) - 20, 20)];
    adverLab.text = @"关联广告:链接到医院或产品购物页";
    adverLab.textColor = TEXTCOLOR;
    adverLab.font = [UIFont systemFontOfSize:14];
    [cicAdView addSubview:adverLab];

}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}





@end
