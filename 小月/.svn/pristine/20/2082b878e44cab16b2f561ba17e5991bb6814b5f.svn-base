//
//  SleepReController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/7/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SleepReController.h"
#import "SR-AppraisalRepView.h"
#import "SR-SelectExpertController.h"
#import "sleepDrawView.h"
#import "huXiZouShi.h"


@interface SleepReController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UISegmentedControl * segmentedControl;
@property(nonatomic,strong)UIScrollView *bgScroll;
@property(nonatomic,strong)UIScrollView *appraisalScroll;
@property(nonatomic,strong) UIScrollView *bgView ;
@property(nonatomic,strong) UIScrollView *bgView1 ;
@property(nonatomic,strong) UIView *sleepView;

@end

@implementation SleepReController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(5, 49, 80);
    self.timeArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.xinLvValueArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.huXiValueArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.sleepValueArray = [[NSMutableArray alloc]initWithCapacity:0];
    kind = 0;
    [self createNavBar];
    [self creatContent];
    [self createBottomLayer];
    [self createApptaisalView];
    [self requestDeviceRealTimeLog];
}

-(void)requestDeviceRealTimeLog
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:FIND_DEVICE_REALTIMELOG(danLi.token, @"5770db33bea010769c6c366f") Completion:^(NSDictionary *dict) {
        self.resourceDict = dict;
        NSLog(@"%@",dict);
        [self createKit];
    }];
}

-(void)requestBuildReport
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:BUILD_REPORT(@"NTc3MGY1NGNiZWEwYjA1YzMxMGJkYjBlfDE0NjcwMjA4MzYzODB8NmIxYWUwYWZkYTNkYzkzYzY1MGFiMmZiNGU0NmViNzQ=", @"577e477e29d03586b09c6ce8",@"2016-07-11") Completion:^(NSDictionary *dict) {
        self.resourceDict = dict;
        [self createDayData];
    }];
}

-(void)createDayData
{
    self.bgView1 = [[UIScrollView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT*0.88 - 45)];
    self.bgView1.backgroundColor = [UIColor clearColor];
    self.bgView1.showsVerticalScrollIndicator = NO;
    self.bgView1.showsHorizontalScrollIndicator = NO;
    [self.bgScroll addSubview:self.bgView1];
    
    NSArray *wornArray = [self.resourceDict objectForKey:@"waningMsgs"];
    for (int i = 0; i < wornArray.count; i++) {
        UILabel *wornLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * i, WIDTH - 20, 20)];
        wornLabel.textAlignment = NSTextAlignmentLeft;
        wornLabel.textColor = REDCOLOR;
        wornLabel.font = [UIFont systemFontOfSize:14];
        wornLabel.text = [NSString stringWithFormat:@"%@",wornArray[i]];
        [self.bgView1 addSubview:wornLabel];
    }
    
    UIFont  *font = [UIFont systemFontOfSize:12];
    CGSize size = [[NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"sleepTimeMsg"]] sizeWithFont:font constrainedToSize:CGSizeMake(WIDTH - 20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    
    UILabel *sleepTimeMsg = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count+ 5, WIDTH - 20, size.height)];
    sleepTimeMsg.textAlignment = NSTextAlignmentLeft;
    sleepTimeMsg.textColor = WHITECOLOR;
    sleepTimeMsg.numberOfLines = 0;
    sleepTimeMsg.font = [UIFont systemFontOfSize:12];
    sleepTimeMsg.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"sleepTimeMsg"]];
    [self.bgView1 addSubview:sleepTimeMsg];
    
    UILabel *sleepLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + 5 + size.height + 10, WIDTH - 20, 20)];
    int timeValue = [[self.resourceDict objectForKey:@"sleepDuration"] intValue];
   NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"睡眠时长:%dh%dmin",timeValue / 60,timeValue % 60]];
    NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"min"].location + 3 );
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"min"].location);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"h"].location + 1);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"h"].location);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 1);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
    [sleepLabel setAttributedText:noteStr] ;
    sleepLabel.font = [UIFont systemFontOfSize:16];
    [self.bgView1 addSubview:sleepLabel];
    
    UILabel *mindLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + 5 + size.height + 10, WIDTH, 20)];
    mindLabel.text = @"呼吸心率体动打鼾为均值";
    mindLabel.font = [UIFont systemFontOfSize:12];
    mindLabel.textColor = WHITECOLOR;
    mindLabel.textAlignment = NSTextAlignmentRight;
    [self.bgView1 addSubview:mindLabel];
    
    for (int i = 0; i < 2; i++) {
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + 5 + size.height + 10 + 20 + 10 + 110 * i, WIDTH - 20, 1)];
        lineView.backgroundColor = LINECOLOR;
        [self.bgView1 addSubview:lineView];
    }
    
    NSArray *nameArray = @[@"呼吸",@"心率",@"体动",@"打鼾"];
    NSArray *imageArray = @[@"huxi",@"xinlv",@"tidong",@"dahan"];
    NSArray *detailArray = @[@"次/min",@"BPM",@"次",@"次/min"];
    NSArray *keyArray = @[@"breath",@"heart",@"cmov",@"snore"];
    for (int i = 0; i < 4; i++) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake( 10 + (WIDTH - 20) / 4 * i, 20 * wornArray.count + 5 + size.height + 10 + 20 + 10 + 10, (WIDTH - 20) / 4, 20)];
        nameLabel.textColor = WHITECOLOR;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = nameArray[i];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [self.bgView1 addSubview:nameLabel];
        
        UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake(10 + (WIDTH - 20)/ 8 - 20 + (WIDTH - 20 ) / 4 * i, 20 * wornArray.count + 5 + size.height + 10 + 20 + 10 + 10 + 20 + 5, 40, 40)];
        images.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@green",imageArray[i]]];
        [self.bgView1 addSubview:images];
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake( 10 + (WIDTH - 20) / 4 * i, 20 * wornArray.count + 5 + size.height + 10 + 20 + 10 + 10 + 20 + 5 + 40 + 5, (WIDTH - 20) / 4, 20)];
        detailLabel.textColor = WHITECOLOR;
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.text = [NSString stringWithFormat:@"%@%@",[self.resourceDict objectForKey:keyArray[i]],detailArray[i]];
        detailLabel.font = [UIFont systemFontOfSize:14];
        [self.bgView1 addSubview:detailLabel];
    }
    
    for (int i = 0; i < 3; i++) {
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10 + (WIDTH - 20) / 4 * (i + 1), 20 * wornArray.count + 5 + size.height + 10 + 20 + 10 + 10, 1, 90)];
        lineView.backgroundColor = LINECOLOR;
        [self.bgView1 addSubview:lineView];
    }
    
    UILabel *dataAnalysis = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 180, WIDTH - 20, 20)];
    noteStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"数据剖析:%@分",[self.resourceDict objectForKey:@"score"]]];
     redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"分"].location + 1 );
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location+ 1);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
    [dataAnalysis setAttributedText:noteStr] ;
    dataAnalysis.textAlignment = NSTextAlignmentLeft;
    dataAnalysis.font = [UIFont systemFontOfSize:16];
    [self.bgView1 addSubview:dataAnalysis];
    
    UILabel *wornLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 180, WIDTH - 20, 20)];
    wornLB.textAlignment = NSTextAlignmentRight;
    wornLB.textColor = WHITECOLOR;
    wornLB.font = [UIFont systemFontOfSize:12];
    wornLB.text = @"满分值为100分";
    [self.bgView1 addSubview:wornLB];
    
    UIView *cuLineView = [[UIView alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 205, WIDTH - 20, 3)];
    cuLineView.backgroundColor = WHITECOLOR;
    [self.bgView1 addSubview:cuLineView];
    
    NSArray *detailsArray = @[@"睡眠指标",@"记录值",@"参考值",@"评估结果"];
    NSArray *namesArray = @[@"睡眠时长",@"入睡时间",@"深睡时长",@"浅睡时长",@"mov"];
    NSArray *jiLuArray = @[@"h",@"min",@"h",@"h",@"h",@"h"];
    NSArray *canKaoArray = @[@"8",@"<30",@">41.3%",@"<33.7%",@"≤20%"];
    NSArray *detailKeyArray = @[@"sleepDurationValue",@"fallAsleepDurationValue",@"deepSleepDurationValue",@"lightSleepDurationValue",@"movDurationValue"];
    NSArray *resultKeyArray = @[@"sleepDurationMsg",@"fallAsleepDurationMsg",@"deepSleepDurationMsg",@"lightSleepDurationMsg",@"movDurationMsg"];
    for (int i = 0; i < 5; i++) {
        if (i < 4) {
            UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake( 10 + (WIDTH - 20) / 4 * i, 20 * wornArray.count + size.height + 215, (WIDTH - 20) / 4, 20)];
            detailLabel.textColor = WHITECOLOR;
            detailLabel.textAlignment = NSTextAlignmentCenter;
            detailLabel.text = [NSString stringWithFormat:@"%@",detailsArray[i]];
            detailLabel.font = [UIFont systemFontOfSize:14];
            [self.bgView1 addSubview:detailLabel];
        }
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 244+ 40 * i, WIDTH - 20, 1)];
        lineView.backgroundColor = LINECOLOR;
        [self.bgView1 addSubview:lineView];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 255 + 40 * i, (WIDTH - 20) / 4, 20)];
        nameLabel.textColor = WHITECOLOR;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = [NSString stringWithFormat:@"%@",namesArray[i]];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [self.bgView1 addSubview:nameLabel];
        
        UILabel *jiLuLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 + (WIDTH - 20) / 4, 20 * wornArray.count + size.height + 255 + 40 * i, (WIDTH - 20) / 4, 20)];
        jiLuLabel.textColor = WHITECOLOR;
        jiLuLabel.textAlignment = NSTextAlignmentCenter;
        jiLuLabel.text = [NSString stringWithFormat:@"%@%@",[self.resourceDict objectForKey:detailKeyArray[i]],jiLuArray[i]];
        jiLuLabel.font = [UIFont systemFontOfSize:14];
        [self.bgView1 addSubview:jiLuLabel];
        
        UILabel *canKaoLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 + (WIDTH - 20) / 2, 20 * wornArray.count + size.height + 255 + 40 * i, (WIDTH - 20) / 4, 20)];
        canKaoLabel.textColor = WHITECOLOR;
        canKaoLabel.textAlignment = NSTextAlignmentCenter;
        canKaoLabel.text = [NSString stringWithFormat:@"%@",canKaoArray[i]];
        canKaoLabel.font = [UIFont systemFontOfSize:14];
        [self.bgView1 addSubview:canKaoLabel];
        
        UILabel *resuilLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 + (WIDTH - 20) / 4 * 3, 20 * wornArray.count + size.height + 255 + 40 * i, (WIDTH - 20) / 4, 20)];
        resuilLabel.textColor = WHITECOLOR;
        resuilLabel.textAlignment = NSTextAlignmentCenter;
        resuilLabel.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:resultKeyArray[i]]];
        resuilLabel.font = [UIFont systemFontOfSize:14];
        [self.bgView1 addSubview:resuilLabel];
    }
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 244+ 40 * detailKeyArray.count, WIDTH - 20, 1)];
    lineView.backgroundColor = LINECOLOR;
    [self.bgView1 addSubview:lineView];
    
    UILabel *dataDate = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 * wornArray.count + size.height + 244+ 40 * detailKeyArray.count + 20, WIDTH - 20, 20)];
    dataDate.textColor = WHITECOLOR;
    dataDate.textAlignment = NSTextAlignmentLeft;
    dataDate.font = [UIFont systemFontOfSize:11];
    noteStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"温度及噪音为均值mov为体动数据采集时间:20:00--12:00"]];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"--"].location + 7 );
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
    redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location+ 1);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
    [dataDate setAttributedText:noteStr] ;
    [self.bgView1 addSubview:dataDate];
    
    UIView *tuBGView = [[UIView alloc]initWithFrame:CGRectMake(0, 20 * wornArray.count + size.height + 244+ 40 * detailKeyArray.count + 20 + 80, WIDTH,  HEIGHT * 1.5)];
    tuBGView.backgroundColor = [UIColor clearColor];
    [self.bgView1 addSubview:tuBGView];
    
    UILabel *xinLvLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, WIDTH - 20, 20)];
    xinLvLabel.text = @"心率走势图";
    xinLvLabel.textAlignment = NSTextAlignmentLeft;
    xinLvLabel.textColor = WHITECOLOR;
    xinLvLabel.font = [UIFont systemFontOfSize:16];
    [tuBGView addSubview:xinLvLabel];
    
    UIView *xinLvLineView = [[UIView alloc]initWithFrame:CGRectMake(10, 30, WIDTH - 20, 2)];
    xinLvLineView.backgroundColor = LINECOLOR;
    [tuBGView addSubview:xinLvLineView];
    
    NSArray *valueArray = @[@"90+",@"80",@"70",@"60",@"50",@"40-"];
    
    for (int i = 0; i < valueArray.count; i++) {
        UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 52 + 30 * i, 30, 20)];
        valueLabel.textColor = WHITECOLOR;
        valueLabel.textAlignment = NSTextAlignmentLeft;
        valueLabel.font = [UIFont systemFontOfSize:14];
        valueLabel.text = valueArray[i];
        [tuBGView addSubview:valueLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(40, 61 + 30 * i, WIDTH - 50, 1)];
        lineView.backgroundColor = LINECOLOR;
        [tuBGView addSubview:lineView];
    }
    
    UIView *xinLvDown = [[UIView alloc]initWithFrame:CGRectMake(10, 60 + 30 * valueArray.count, WIDTH - 20, 2)];
    xinLvDown.backgroundColor = LINECOLOR;
    [tuBGView addSubview:xinLvDown];
    
    [self.timeArray removeAllObjects];
    [self.xinLvValueArray removeAllObjects];
    NSArray *dataArray = [self.resourceDict objectForKey:@"heartTimeLog"];
    xinLvX = 0;
    for (NSDictionary *dict in dataArray) {
        NSString *timeStr = [[[[dict objectForKey:@"time"] componentsSeparatedByString:@"T"] objectAtIndex:1] substringToIndex:5];
        [self.timeArray addObject:timeStr];
        
        static int i = 0;
        i = 210 - (([[dict objectForKey:@"value"] intValue] - 40) * 3 + 30);
        CGPoint point = CGPointMake(xinLvX, i);
        NSValue *pointValue = [NSValue valueWithCGPoint:point];
        [self.xinLvValueArray addObject:pointValue];
//        i = 210 - ((65 - 40) * 3 + 30);
//        point = CGPointMake(x, i);
//        pointValue = [NSValue valueWithCGPoint:point];
//        [self.xinLvValueArray addObject:pointValue];
        xinLvX = xinLvX + 2;
    }
    
    UIScrollView *xinLvBG = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 0, WIDTH - 50,30 * (valueArray.count + 2 ) + 30)];
    xinLvBG.backgroundColor = [UIColor clearColor];
    [tuBGView addSubview:xinLvBG];
    
    [xinLvBG setContentSize:CGSizeMake(2 * self.xinLvValueArray.count , 30 * (valueArray.count + 2))];
    
    sleepDrawView *sleepDraw = [[sleepDrawView alloc]initWithFrame:CGRectMake(0, 32, 2 * self.xinLvValueArray.count, 30 * (valueArray.count + 2))];
    sleepDraw.backgroundColor = [UIColor clearColor];
    sleepDraw.linesArray = self.xinLvValueArray;
    [xinLvBG addSubview:sleepDraw];
    
    for (int i = 0; i <= self.timeArray.count / 20 + 1; i++) {
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(( 2 * self.timeArray.count / (self.timeArray.count / 20 + 1)) * i , 30 * (valueArray.count + 2 ) + 2, 2 * self.timeArray.count / (self.timeArray.count / 20 + 1), 20)];
        timeLabel.textColor = WHITECOLOR;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:10];
        if (i <= self.timeArray.count / 20) {
            timeLabel.text = self.timeArray[i * 20];
        }else
        {
            timeLabel.text = [self.timeArray objectAtIndex:self.timeArray.count - 1];
        }
        [xinLvBG addSubview:timeLabel];
    }
    
    UILabel *huXiLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 30 * (valueArray.count + 2 ) + 30 + 10, WIDTH - 20, 20)];
    huXiLabel.text = @"呼吸走势图";
    huXiLabel.textAlignment = NSTextAlignmentLeft;
    huXiLabel.textColor = WHITECOLOR;
    huXiLabel.font = [UIFont systemFontOfSize:16];
    [tuBGView addSubview:huXiLabel];
    
    UIView *huXiLine = [[UIView alloc]initWithFrame:CGRectMake(10,  30 * (valueArray.count + 2 ) + 30 + 10 + 30, WIDTH - 20, 2)];
    huXiLine.backgroundColor = LINECOLOR;
    [tuBGView addSubview:huXiLine];
    
    NSArray *huXiVale = @[@"30+",@"25",@"20",@"15",@"10",@"5-"];
    
    for (int i = 0; i < huXiVale.count; i++) {
        UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 30 * (huXiVale.count + 2 ) + 30 + 10 + 30 + 20 + 30 * i, 30, 20)];
        valueLabel.textColor = WHITECOLOR;
        valueLabel.textAlignment = NSTextAlignmentLeft;
        valueLabel.font = [UIFont systemFontOfSize:14];
        valueLabel.text = huXiVale[i];
        [tuBGView addSubview:valueLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(40, 30 * (huXiVale.count + 2 ) + 30 + 10 + 30 + 30 + 30 * i, WIDTH - 50, 1)];
        lineView.backgroundColor = LINECOLOR;
        [tuBGView addSubview:lineView];
    }
    
    UIView *huXiDown = [[UIView alloc]initWithFrame:CGRectMake(10, 30 * (valueArray.count + 2 ) + 30 + 10 + 30 + 30 * huXiVale.count + 30, WIDTH - 20, 2)];
    huXiDown.backgroundColor = LINECOLOR;
    [tuBGView addSubview:huXiDown];
    
    
    [self.timeArray removeAllObjects];
    [self.huXiValueArray removeAllObjects];
    dataArray = [self.resourceDict objectForKey:@"breathTimeLog"];
    huXiX = 0;
    for (NSDictionary *dict in dataArray) {
        NSString *timeStr = [[[[dict objectForKey:@"time"] componentsSeparatedByString:@"T"] objectAtIndex:1] substringToIndex:5];
        [self.timeArray addObject:timeStr];
        static int i = 0;
        i = 210 - (([[dict objectForKey:@"value"] intValue] - 5) * 6 + 30);
        CGPoint point = CGPointMake(huXiX, i);
        NSValue *pointValue = [NSValue valueWithCGPoint:point];
        [self.huXiValueArray addObject:pointValue];
        //        i = 210 - ((65 - 40) * 3 + 30);
        //        point = CGPointMake(x, i);
        //        pointValue = [NSValue valueWithCGPoint:point];
        //        [self.xinLvValueArray addObject:pointValue];
        huXiX = huXiX + 2;
    }

    UIScrollView *huXiBG = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 30 * (valueArray.count + 2 ) + 30 + 10 + 30, WIDTH - 50,30 * huXiVale.count + 60)];
    huXiBG.backgroundColor = [UIColor clearColor];
    [tuBGView addSubview:huXiBG];
    
    [huXiBG setContentSize:CGSizeMake(2 * self.huXiValueArray.count , 30 * huXiVale.count + 30 )];
    
    huXiZouShi *huXisleepDraw = [[huXiZouShi alloc]initWithFrame:CGRectMake(0, 0, 2 * self.huXiValueArray.count, 30 * (huXiVale.count + 2))];
    huXisleepDraw.backgroundColor = [UIColor clearColor];
    huXisleepDraw.linesArray = self.huXiValueArray;
    [huXiBG addSubview:huXisleepDraw];
    
    for (int i = 0; i <= self.timeArray.count / 20 + 1; i++) {
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(( 2 * self.timeArray.count / (self.timeArray.count / 20 + 1)) * i , 30 * huXiVale.count + 30 + 2, 2 * self.timeArray.count / (self.timeArray.count / 20 + 1), 20)];
        timeLabel.textColor = WHITECOLOR;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:10];
        if (i <= self.timeArray.count / 20) {
            timeLabel.text = self.timeArray[i * 20];
        }else
        {
            timeLabel.text = [self.timeArray objectAtIndex:self.timeArray.count - 1];
        }
        [huXiBG addSubview:timeLabel];
    }
    
    UILabel *sleepLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 30 * (valueArray.count + 2 ) + 30 + 10 + 30 + huXiVale.count * 30 + 60 + 10, WIDTH - 20, 20)];
    sleepLB.text = @"睡眠深度图";
    sleepLB.textAlignment = NSTextAlignmentLeft;
    sleepLB.textColor = WHITECOLOR;
    sleepLB.font = [UIFont systemFontOfSize:16];
    [tuBGView addSubview:sleepLB];
    
    UIView *sleepLineView = [[UIView alloc]initWithFrame:CGRectMake(10,30 * (valueArray.count + 2 ) + 30 + 10 + 30 + huXiVale.count * 30 + 60 + 10 + 30, WIDTH - 20, 2)];
    sleepLineView.backgroundColor = LINECOLOR;
    [tuBGView addSubview:sleepLineView];
    
    NSArray *sleepValueArray = @[@"深睡",@"浅睡",@"mov",@"静卧",@"清醒"];
    
    for (int i = 0; i < sleepValueArray.count; i++) {
        UILabel *sleepValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 30 * (valueArray.count + 2 ) + 30 + 20 + 30 + sleepValueArray.count * 30 + 60 + 20 + 30 + 30 + 30 * i, 30, 20)];
        sleepValueLabel.textColor = WHITECOLOR;
        sleepValueLabel.textAlignment = NSTextAlignmentLeft;
        sleepValueLabel.font = [UIFont systemFontOfSize:14];
        sleepValueLabel.text = sleepValueArray[i];
        [tuBGView addSubview:sleepValueLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(40, 30 * (valueArray.count + 2 ) + 30 + 20 + 30 + sleepValueArray.count * 30 + 60 + 30 + 30 + 30 + 30 * i, WIDTH - 50, 1)];
        lineView.backgroundColor = LINECOLOR;
        [tuBGView addSubview:lineView];
    }
    
    UIView *sleepDown = [[UIView alloc]initWithFrame:CGRectMake(10, 30 * (valueArray.count + 2 ) + 30 + 20 + 30 + sleepValueArray.count * 30 + 60 + 30 + 30 + 30 + 30 * sleepValueArray.count, WIDTH - 20, 2)];
    sleepDown.backgroundColor = LINECOLOR;
    [tuBGView addSubview:sleepDown];
    
    [self.timeArray removeAllObjects];
    [self.sleepValueArray removeAllObjects];
    dataArray = [self.resourceDict objectForKey:@"sleepTimeLog"];
    sleepX = 0;
    for (NSDictionary *dict in dataArray) {
        NSString *timeStr = [[[[dict objectForKey:@"time"] componentsSeparatedByString:@"T"] objectAtIndex:1] substringToIndex:5];
        [self.timeArray addObject:timeStr];
        static int i = 0;
        if ([[dict objectForKey:@"sleepStatus"] isEqualToString:@"repose"]) {
            i = 120;
        }else if ([[dict objectForKey:@"sleepStatus"] isEqualToString:@"mov"])
        {
            i = 90;
        }else if ([[dict objectForKey:@"sleepStatus"] isEqualToString:@"shallowSleep"])
        {
            i = 60;
        }else if ([[dict objectForKey:@"sleepStatus"] isEqualToString:@"wake"])
        {
            i = 175;
        }else if ([[dict objectForKey:@"sleepStatus"] isEqualToString:@"deepSleep"])
        {
            i = 30;
        }
        CGPoint point = CGPointMake(sleepX, i);
        NSValue *pointValue = [NSValue valueWithCGPoint:point];
        [self.sleepValueArray addObject:pointValue];
        //        i = 210 - ((65 - 40) * 3 + 30);
        //        point = CGPointMake(x, i);
        //        pointValue = [NSValue valueWithCGPoint:point];
        //        [self.xinLvValueArray addObject:pointValue];
        sleepX = sleepX + 3;
    }
    
    UIScrollView *sleepBG = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 30 * (valueArray.count + 2 ) + 30 + 10 + 30 + huXiVale.count * 30 + 60 + 10 + 30, WIDTH - 50,30 * sleepValueArray.count + 60)];
    sleepBG.backgroundColor = [UIColor clearColor];
    [tuBGView addSubview:sleepBG];
    
    [sleepBG setContentSize:CGSizeMake(3 * self.sleepValueArray.count , 30 * sleepValueArray.count + 30 )];
    
    huXiZouShi *deepSleepDraw = [[huXiZouShi alloc]initWithFrame:CGRectMake(0, 0, 3 * self.huXiValueArray.count, 30 * (huXiVale.count + 2))];
    deepSleepDraw.backgroundColor = [UIColor clearColor];
    deepSleepDraw.linesArray = self.sleepValueArray;
    [sleepBG addSubview:deepSleepDraw];
    
    for (int i = 0; i <= self.timeArray.count / 20 + 1; i++) {
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(( 3 * self.timeArray.count / (self.timeArray.count / 20 + 1)) * i , 190, 3 * self.timeArray.count / (self.timeArray.count / 20 + 1), 20)];
        timeLabel.textColor = WHITECOLOR;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:10];
        if (i <= self.timeArray.count / 20) {
            timeLabel.text = self.timeArray[i * 20];
        }else
        {
            timeLabel.text = [self.timeArray objectAtIndex:self.timeArray.count - 1];
        }
        [sleepBG addSubview:timeLabel];
    }
    
    
    
     [self.bgView1 setContentSize:CGSizeMake(WIDTH , 230 * (valueArray.count + 2 ) + 30 + 10 + 30 + 30 * huXiVale.count + 30 + HEIGHT)];
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    //状态栏设置
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    statusBarView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"睡眠报告";
    title.textColor = WHITECOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
    //发布按钮
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(WIDTH-50, 13, 20, 20);
    //writeBtn.backgroundColor = [UIColor redColor];
    [writeBtn setImage:[UIImage imageNamed:@"fatie.png"] forState:UIControlStateNormal];
    //[writeBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 35, 35)];
    [writeBtn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:writeBtn];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - content内容
- (void)creatContent{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    self.dateStr = [dateFormatter stringFromDate:currentDate];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 20)];
    self.timeLabel.textColor = WHITECOLOR;
    self.timeLabel.font = [UIFont systemFontOfSize:16];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.text = self.dateStr;
    [self.view addSubview:self.timeLabel];
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"实时数据",@"数据总览",@"评估报告",nil];
    //初始化UISegmentedControl
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    self.segmentedControl.frame = CGRectMake(30, 70 + 20 + 10, WIDTH-60, 30);
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.tintColor = [UIColor whiteColor];
   
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:16] ,NSFontAttributeName,nil];
    [self.segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:16] ,NSFontAttributeName,nil];
    [self.segmentedControl setTitleTextAttributes:dic1 forState:UIControlStateSelected];

    [self.segmentedControl addTarget:self action:@selector(segmentedClick:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmentedControl];
    
}

- (void)segmentedClick:(UISegmentedControl *)sender{
    NSInteger index = sender.selectedSegmentIndex;
    
    if (index) {
        NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        self.timeLabel.text = [dateFormatter stringFromDate:currentDate];
    }else
    {
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        self.timeLabel.text = [dateFormatter stringFromDate:currentDate];
    }
    self.dateStr = self.timeLabel.text;
    [self.bgView removeFromSuperview];
    [self.bgView1 removeFromSuperview];
    switch (index) {
        case 0:
        {
            [self requestDeviceRealTimeLog];
            self.bgScroll.contentOffset = CGPointMake(0, 0);

        }
            break;
        case 1:
        {
            [self requestBuildReport];
            self.bgScroll.contentOffset = CGPointMake(WIDTH, 0);
        }
            break;
        case 2:
        {
            self.bgScroll.contentOffset = CGPointMake(WIDTH * 2, 0);
            
        }
            break;
    }
       
    
  
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [UIView animateWithDuration:1 animations:^{
        if ([scrollView isEqual:self.bgScroll]) {
            self.segmentedControl.selectedSegmentIndex = (scrollView.contentOffset.x + (WIDTH - 20 ) * 0.5 ) / (WIDTH - 20);
        }
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//     self.bgScroll.contentOffset = CGPointMake(WIDTH * self.segmentedControl.selectedSegmentIndex, 0);
    if (kind == self.segmentedControl.selectedSegmentIndex) {
        
    }else
    {
        if (self.segmentedControl.selectedSegmentIndex) {
            NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];//获取当前时间，日期
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            self.timeLabel.text = [dateFormatter stringFromDate:currentDate];
        }else
        {
            NSDate *currentDate = [NSDate date];//获取当前时间，日期
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            self.timeLabel.text = [dateFormatter stringFromDate:currentDate];
        }
        self.dateStr = self.timeLabel.text;
        [self.bgView removeFromSuperview];
        [self.bgView1 removeFromSuperview];
        
        NSLog(@"%d---%d",self.segmentedControl.selectedSegmentIndex,kind);
        kind = self.segmentedControl.selectedSegmentIndex;
        NSLog(@"%d---%d",self.segmentedControl.selectedSegmentIndex,kind);
    NSLog(@"%ld",(long)self.segmentedControl.selectedSegmentIndex);
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            [self requestDeviceRealTimeLog];
            break;
        }
        case 1:
        {
            [self requestBuildReport];
            break;
        }
        case 2:
        {
            ;
            break;
        }
            
        default:
            break;
    }
    }
}


- (void)createBottomLayer{
    self.bgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70 + 20 + 10 + 30 + 10, WIDTH, HEIGHT - 70 - 20 - 10 - 30 - 10)];
    self.bgScroll.pagingEnabled= YES;
    self.bgScroll.delegate = self;
    self.bgScroll.bounces = NO;
    self.bgScroll.showsVerticalScrollIndicator = NO;
    self.bgScroll.showsHorizontalScrollIndicator = NO;
    self.bgScroll.contentSize = CGSizeMake(WIDTH*3, 0);
    [self.view addSubview:self.bgScroll];
    
    
}

-(void)createKit
{
    self.bgView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80 + (WIDTH - 50)/ 3 * 4 + 80)];
    self.bgView.backgroundColor = [UIColor clearColor];
    self.bgView.showsVerticalScrollIndicator = NO;
    self.bgView.showsHorizontalScrollIndicator = NO;
    [self.bgScroll addSubview:self.bgView];
    
    [self.bgScroll setContentSize:CGSizeMake(WIDTH * 3, HEIGHT - 70 - 70)];
    NSArray *imageArray = @[@"zhentouzhuangtai",@"shebeidianliang",@"huanjingzaoyin.png",@"huanjingwendu",@"shidu.png",@"guangzhao"];
    NSArray *detailArray = @[@"设备状态:",@"设备电量:",@"环境噪音:",@"环境温度:",@"环境湿度:",@"环境光照:"];
    NSArray *detailKeyArray = @[@"status",@"power",@"ns",@"tp",@"hu",@"lt"];
    for (int i = 0; i < 6; i++) {
        int x = WIDTH / 6 - 20 + WIDTH / 3 * (i % 3) ;
        int y = 40 * (i / 3);
        
        UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 40, 15)];
        images.image = [UIImage imageNamed:imageArray[i]];
        [self.bgScroll addSubview:images];
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 3 * (i % 3),15 + y, WIDTH / 3, 20)];
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.textColor = WHITECOLOR;
        detailLabel.font = [UIFont systemFontOfSize:14];
        [self.bgScroll addSubview:detailLabel];
        
        if (i == 0) {
            if ([[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[0]] isEqualToString:@"idle"]) {
                NSString *str = @"催睡";
                detailLabel.text = [NSString stringWithFormat:@"%@%@",detailArray[0],str];
            }else if ([[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[0]] isEqualToString:@"wake"]) {
                NSString *str = @"催睡";
                detailLabel.text = [NSString stringWithFormat:@"%@%@",detailArray[0],str];
            }else if ([[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[0]] isEqualToString:@"sleep"]) {
                NSString *str = @"叫醒";
                detailLabel.text = [NSString stringWithFormat:@"%@%@",detailArray[0],str];
            }
            else if ([[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[0]] isEqualToString:@"sensorOffline"]) {
                NSString *str = @"失联";
                detailLabel.text = [NSString stringWithFormat:@"%@%@",detailArray[0],str];
            }
            else if ([[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[0]] isEqualToString:@"unknown"]) {
                NSString *str = @"异常";
                detailLabel.text = [NSString stringWithFormat:@"%@%@",detailArray[0],str];
            }

            
        }else if (i == 1)
        {
             detailLabel.text = [NSString stringWithFormat:@"%@%@%%",detailArray[i],[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[1]]];
        }else
        {
            detailLabel.text = [NSString stringWithFormat:@"%@%@",detailArray[i],[[[self.resourceDict objectForKey:@"data"] objectAtIndex:0] objectForKey:detailKeyArray[i]]];
        }
        
    }
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(20, 80, (WIDTH-50)/3, (WIDTH - 50)/ 3)];
    leftView.layer.cornerRadius =  1;
    leftView.clipsToBounds = YES;
    leftView.layer.borderWidth = 1;
    leftView.layer.borderColor = WHITECOLOR.CGColor;
    leftView.layer.masksToBounds =YES;
    [self.bgView addSubview:leftView];
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(20+(WIDTH-50)/3+10,80 , (WIDTH-50)/3*2, (WIDTH - 50)/ 3)];
    rightView.layer.cornerRadius =  1;
    rightView.clipsToBounds = YES;
    rightView.layer.borderWidth = 1;
    rightView.layer.borderColor = WHITECOLOR.CGColor;
    rightView.layer.masksToBounds =YES;
    [self.bgView addSubview:rightView];
    
    UIView *leftView1 = [[UIView alloc]initWithFrame:CGRectMake(20, 80 + (WIDTH - 50)/ 3 + 10, (WIDTH-50)/3, (WIDTH - 50)/ 3)];
    leftView1.layer.cornerRadius =  1;
    leftView1.clipsToBounds = YES;
    leftView1.layer.borderWidth = 1;
    leftView1.layer.borderColor = WHITECOLOR.CGColor;
    leftView1.layer.masksToBounds =YES;
    [self.bgView addSubview:leftView1];
    
    UIView *rightView1 = [[UIView alloc]initWithFrame:CGRectMake(20+(WIDTH-50)/3+10, 80 + (WIDTH - 50)/ 3 + 10, (WIDTH-50)/3*2, (WIDTH - 50)/ 3)];
    rightView1.layer.cornerRadius =  1;
    rightView1.clipsToBounds = YES;
    rightView1.layer.borderWidth = 1;
    rightView1.layer.borderColor = WHITECOLOR.CGColor;
    rightView1.layer.masksToBounds =YES;
    [self.bgView addSubview:rightView1];
    
    UIView *leftView2 = [[UIView alloc]initWithFrame:CGRectMake(20, 80 + (WIDTH - 50)/ 3 * 2 + 20, (WIDTH-50)/3, (WIDTH - 50)/ 3)];
    leftView2.layer.cornerRadius =  1;
    leftView2.clipsToBounds = YES;
    leftView2.layer.borderWidth = 1;
    leftView2.layer.borderColor = WHITECOLOR.CGColor;
    leftView2.layer.masksToBounds =YES;
    [self.bgView addSubview:leftView2];
    
    UIView *rightView2 = [[UIView alloc]initWithFrame:CGRectMake(20+(WIDTH-50)/3+10, 80 + (WIDTH - 50)/ 3 * 2 + 20, (WIDTH-50)/3*2, (WIDTH - 50)/ 3)];
    rightView2.layer.cornerRadius =  1;
    rightView2.clipsToBounds = YES;
    rightView2.layer.borderWidth = 1;
    rightView2.layer.borderColor = WHITECOLOR.CGColor;
    rightView2.layer.masksToBounds =YES;
    [self.bgView addSubview:rightView2];
    
    UIView *leftView3 = [[UIView alloc]initWithFrame:CGRectMake(20, 80 + (WIDTH - 50)/ 3 * 3 + 30, (WIDTH-50)/3, (WIDTH - 50)/ 3)];
    leftView3.layer.cornerRadius =  1;
    leftView3.clipsToBounds = YES;
    leftView3.layer.borderWidth = 1;
    leftView3.layer.borderColor = WHITECOLOR.CGColor;
    leftView3.layer.masksToBounds =YES;
    [self.bgView addSubview:leftView3];
    
    UIView *rightView3 = [[UIView alloc]initWithFrame:CGRectMake(20+(WIDTH-50)/3+10, 80 + (WIDTH - 50)/ 3 * 3 + 30, (WIDTH-50)/3*2, (WIDTH - 50)/ 3)];
    rightView3.layer.cornerRadius =  1;
    rightView3.clipsToBounds = YES;
    rightView3.layer.borderWidth = 1;
    rightView3.layer.borderColor = WHITECOLOR.CGColor;
    rightView3.layer.masksToBounds =YES;
    [self.bgView addSubview:rightView3];
    
    [self.bgView setContentSize:CGSizeMake(WIDTH, 80 + (WIDTH - 50)/ 3 * 4 + 80 )];
}



#pragma mark - 评估报告
- (void)createApptaisalView{
    self.appraisalScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(WIDTH * 2,  0, WIDTH, 80 + (WIDTH - 50)/ 3 * 4 + 80)];
    self.appraisalScroll.scrollEnabled= YES;
    self.appraisalScroll.delegate = self;
    self.appraisalScroll.bounces = NO;
    self.appraisalScroll.showsVerticalScrollIndicator = NO;
    self.appraisalScroll.showsHorizontalScrollIndicator = NO;
    self.appraisalScroll.contentSize = CGSizeMake(0, HEIGHT);
    [self.bgScroll addSubview:self.appraisalScroll];
    
    SR_AppraisalRepView *sr = [[SR_AppraisalRepView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    sr.backgroundColor = WHITECOLOR;
    sr.resourceDict = self.resourceDict;
    [sr.diagnoseBtn addTarget:self action:@selector(diagnoseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.appraisalScroll addSubview:sr];
    
}

- (void)diagnoseBtnClick{
    SR_SelectExpertController *sele = [[SR_SelectExpertController alloc]init];
    [self.navigationController pushViewController:sele animated:YES];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
