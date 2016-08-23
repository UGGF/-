//
//  DetailSleepReController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/7/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "DetailSleepReController.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailSleepReController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *BgScrollView;
@end

@implementation DetailSleepReController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(5, 49, 80);

    [self createNavBar];
    [self createContentView];
    [self createPropertyView];
    [self createSleepWeekView];
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    //状态栏设置
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    statusBarView.backgroundColor=[UIColor clearColor];
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

#pragma mark - 创建内容视图
- (void)createContentView{
    self.BgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT)];
    self.BgScrollView.scrollEnabled = YES;
    self.BgScrollView.delegate = self;
    self.BgScrollView.contentSize = CGSizeMake(0, 35+(WIDTH/2-40)+20 + 300 + 10 + 250 + 120);
    self.BgScrollView.showsHorizontalScrollIndicator = NO;
    self.BgScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.BgScrollView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, WIDTH, 20)];
    lab.text = @"《 205-10-12至10-19 》";
    lab.textColor = WHITECOLOR;
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    [self.BgScrollView addSubview:lab];
    
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(10, 35, WIDTH/2-50, WIDTH/2-50)];
    cicView.layer.cornerRadius = (WIDTH/2-50)/2 ;
    cicView.clipsToBounds = YES;
    cicView.layer.borderWidth = 4;
    cicView.layer.borderColor = WHITECOLOR.CGColor;
    cicView.layer.masksToBounds =YES;
    [self.BgScrollView addSubview:cicView];

    UILabel *typeLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2,35+(WIDTH/2-40)/5, WIDTH/2-30, 20)];
    typeLab.text = @"放类型图";
    typeLab.textColor = WHITECOLOR;
    typeLab.font = [UIFont systemFontOfSize:14];
    typeLab.textAlignment = NSTextAlignmentCenter;
    [self.BgScrollView addSubview:typeLab];
    
    UIButton *EvaluationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    EvaluationBtn.frame = CGRectMake(WIDTH/2, 35+( WIDTH/2-40)/3*2, WIDTH/2-30, 30);
    EvaluationBtn.backgroundColor = CAOGREENCOLOR;
    EvaluationBtn.layer.cornerRadius = 3;
    EvaluationBtn.adjustsImageWhenHighlighted = NO;
    [EvaluationBtn setTitle:@"评估报告" forState:UIControlStateNormal];
    [EvaluationBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    EvaluationBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [unBindBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.BgScrollView addSubview:EvaluationBtn];

}

- (void)createPropertyView{
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35+(WIDTH/2-40)+20, WIDTH-10, 300)];
    bgView.layer.cornerRadius = 2 ;
    bgView.backgroundColor = RGBCOLOR(6, 55, 86);
    [self.BgScrollView addSubview:bgView];

    UILabel *PropertyLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 20)];
    PropertyLab.text = @"参数分析";
    PropertyLab.textColor = WHITECOLOR;
    PropertyLab.font = [UIFont systemFontOfSize:16];
    PropertyLab.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:PropertyLab];
    
    NSArray *progArr = @[@"项目",@"睡时",@"心率",@"呼吸",@"体动",@"打鼾"];
    for (int i = 0; i < progArr.count; i++) {
        UILabel *progLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 50+ i*40, 30, 20)];
        progLab.text = progArr[i];
        progLab.textColor = WHITECOLOR;
        progLab.font = [UIFont systemFontOfSize:14];
        progLab.textAlignment = NSTextAlignmentLeft;
        [bgView addSubview:progLab];

    }
    
    NSArray *numArr = @[@"总和值",@"平均值",@"最高值",@"最低值"];
    for (int i = 0; i < numArr.count; i++) {
        UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(60 + i*(WIDTH*0.21), 50, 50, 20)];
        numLab.text = numArr[i];
        numLab.textColor = WHITECOLOR;
        numLab.font = [UIFont systemFontOfSize:14];
        numLab.textAlignment = NSTextAlignmentLeft;
        [bgView addSubview:numLab];
    }
    
    
    
    
    
    
    
    
    UIGraphicsBeginImageContext(PropertyLab.frame.size);   //开始画线
//    [bgView.image drawInRect:CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //设置线条终点形状
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:PropertyLab.bounds];
    [shapeLayer setPosition:PropertyLab.center];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0f] CGColor]];
    
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:1.0f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
      [NSNumber numberWithInt:1],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, -10, 20);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,20);
    
    // Setup the path
//    CGMutablePathRef path = CGPathCreateMutable();
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
//    CGPathMoveToPoint(path, NULL, 0, 10);
//    CGPathAddLineToPoint(path, NULL, WIDTH-60,10);
    
    CGPathMoveToPoint(path, NULL, -10, 60);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,60);
    
    CGPathMoveToPoint(path, NULL, -10, 100);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,100);
    
    CGPathMoveToPoint(path, NULL, -10, 140);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,140);
    
    CGPathMoveToPoint(path, NULL, -10, 180);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,180);
    
    CGPathMoveToPoint(path, NULL, -10, 220);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,220);
    
    CGPathMoveToPoint(path, NULL, -10, 260);
    CGPathAddLineToPoint(path, NULL, WIDTH-30,260);
    
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[PropertyLab layer] addSublayer:shapeLayer];
    
}


- (void)createSleepWeekView{
    UIImageView *weekView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35+(WIDTH/2-40)+20 + 300 + 10, WIDTH-10, 250)];
    weekView.layer.cornerRadius = 2 ;
    weekView.backgroundColor = RGBCOLOR(6, 55, 86);
    [self.BgScrollView addSubview:weekView];
    
    UILabel *weekLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, WIDTH/2, 20)];
    weekLab.text = @"周睡眠时长走势";
    weekLab.textColor = WHITECOLOR;
    weekLab.font = [UIFont systemFontOfSize:16];
    weekLab.textAlignment = NSTextAlignmentLeft;
    [weekView addSubview:weekLab];
    
    UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-50, 12, WIDTH/2+40, 20)];
    timeLab.text = @"数据采集:以个人睡眠时间为基准";
    timeLab.textColor = WHITECOLOR;
    timeLab.font = [UIFont systemFontOfSize:11];
    timeLab.textAlignment = NSTextAlignmentRight;
    [weekView addSubview:timeLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(5, 35, WIDTH-15, 1)];
    line.backgroundColor = SLIVERYCOLOR;
    line.alpha = 0.6;
    [weekView addSubview:line];
    
    NSArray *timeArr = @[@"10h+",@"8h",@"6h",@"4h",@"2h",@"0"];
    for (int i = 0; i < 6; i++) {
        UILabel *hLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 50 + i*30, 40, 20)];
        hLab.text = timeArr[i];
        hLab.textColor = WHITECOLOR;
        hLab.font = [UIFont systemFontOfSize:14];
        hLab.textAlignment = NSTextAlignmentCenter;
        [weekView addSubview:hLab];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(5+35, 60+i*30, WIDTH-15-40, 1)];
        line.backgroundColor = SLIVERYCOLOR;
        line.alpha = 0.6;
        [weekView addSubview:line];
    }
    
    NSArray *weekArr = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    for (int i = 0; i < 7; i++) {
        UILabel *zhouLab = [[UILabel alloc]initWithFrame:CGRectMake(40 + i*(WIDTH/8),65 + 150, 30, 20)];
        zhouLab.text = weekArr[i];
        zhouLab.textColor = WHITECOLOR;
        zhouLab.font = [UIFont systemFontOfSize:13];
        zhouLab.textAlignment = NSTextAlignmentCenter;
        [weekView addSubview:zhouLab];
    }

}





@end
