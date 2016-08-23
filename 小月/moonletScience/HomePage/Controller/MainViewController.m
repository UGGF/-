//
//  MainViewController.m
//  moonletScience
//
//  Created by 苏 on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "loginVC.h"
#import "changePSWVC.h"
#import "PersonInfoViewController.h"
#import "BlackListViewController.h"
#import "linkManVC.h"
#import "sleepDrawView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationController.navigationBar.hidden = YES;
    [self createKit];
//    [self createCiccle];
}

-(void)viewWillAppear:(BOOL)animated
{
}


- (void)createCiccle{
    int wid = 200;
    int hei = wid;

    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2-100, HEIGHT/2-100, wid, hei)];
    cicView.layer.cornerRadius = 100 ;
    cicView.clipsToBounds = YES;
    cicView.backgroundColor = [UIColor clearColor];
    cicView.layer.borderWidth = 3;
    cicView.layer.borderColor = WHITECOLOR.CGColor;
    cicView.layer.masksToBounds =YES;
    [self.view addSubview:cicView];

    
    /**
     未检测到数据
     */
    
//    UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(wid/2-15, hei/2-37,30, 30)];
//    [imaInfoView setImage:[UIImage imageNamed:@"gantanhao"]];
//    imaInfoView.layer.cornerRadius = 15;
//    imaInfoView.clipsToBounds = YES;
//    [cicView addSubview:imaInfoView];
//    
//    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(0, hei/2-10, wid, 50)];
//    numLab.text = @"未检测到数据";
//    numLab.textColor = WHITECOLOR;
//    numLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
//    numLab.textAlignment = NSTextAlignmentCenter;
//    [cicView addSubview:numLab];
//    
//    UILabel *errorLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(numLab.frame)-10, wid, 20)];
//    errorLab.text = @"设备故障或对方未入睡";
//    errorLab.textColor = WHITECOLOR;
//    errorLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
//    errorLab.textAlignment = NSTextAlignmentCenter;
//    [cicView addSubview:errorLab];
    

    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(wid/2-30, 20, 60, 50)];
    numLab.text = @"91";
    numLab.textColor = WHITECOLOR;
    numLab.font = [UIFont systemFontOfSize:50];
    numLab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:numLab];
    
    NSArray *PLArr = @[@"优质",@"良好",@"中等",@"较差",@"极差"];
    UILabel *PLLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numLab.frame), CGRectGetMaxY(numLab.frame)-25, 40, 20)];
    PLLab.text = @"优质";
    PLLab.textColor = WHITECOLOR;
    PLLab.font = [UIFont systemFontOfSize:16];
    PLLab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:PLLab];
    
    NSString *str = @"99";
    UILabel *beatLab = [[UILabel alloc]initWithFrame:CGRectMake(0, hei/2-25, wid, 20)];
    beatLab.text = [NSString stringWithFormat:@"击败了全球%@%%的人",str];
    beatLab.textColor = WHITECOLOR;
    beatLab.font = [UIFont systemFontOfSize:16];
    beatLab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:beatLab];
    
    NSArray *colorArr = @[RGBCOLOR(155, 199, 8),RGBCOLOR(17, 141, 226),RGBCOLOR(255, 231, 10),RGBCOLOR(233, 109, 7),RGBCOLOR(220, 0, 10)];
    UIView *colorView = [[UIView alloc]initWithFrame:CGRectMake(0, hei/2, wid, hei/2)];
    colorView.clipsToBounds = YES;
    colorView.backgroundColor = RGBCOLOR(155, 199, 8);
    [cicView addSubview:colorView];
    
    /**
     笑脸旁边的警示字样
     */
    
//    UILabel *warnLeftLab = [[UILabel alloc]initWithFrame:CGRectMake(wid/2-10-40, hei/2+2, 40, 20)];
//    warnLeftLab.text = @"黄色";
//    warnLeftLab.textColor = WHITECOLOR;
//    warnLeftLab.font = [UIFont systemFontOfSize:16];
//    warnLeftLab.textAlignment = NSTextAlignmentCenter;
//    [cicView addSubview:warnLeftLab];
//
//    UILabel *warnRightLab = [[UILabel alloc]initWithFrame:CGRectMake(wid/2+10, hei/2+2, 40, 20)];
//    warnRightLab.text = @"警示";
//    warnRightLab.textColor = WHITECOLOR;
//    warnRightLab.font = [UIFont systemFontOfSize:16];
//    warnRightLab.textAlignment = NSTextAlignmentCenter;
//    [cicView addSubview:warnRightLab];
    
    NSArray *imaArr = @[@"xiaolian",@"kulian"];
    UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(wid/2-10, hei/2+2, 20, 20)];
    [imaInfoView setImage:[UIImage imageNamed:@"xiaolian"]];
    imaInfoView.layer.cornerRadius = 10;
    imaInfoView.clipsToBounds = YES;
    [cicView addSubview:imaInfoView];

    NSArray *goodArr = @[@"哎哟不错 继续保持",@"睡质尚可 加油努力",@"注意睡质 适当运动",@"睡质较差 安全隐患",@"睡质警示 声明警示"];
    UILabel *goodLab = [[UILabel alloc]initWithFrame:CGRectMake(0, hei/2+22, wid, 20)];
    goodLab.text = @"哎哟不错 继续保持";
    goodLab.textColor = WHITECOLOR;
    goodLab.font = [UIFont systemFontOfSize:12];
    goodLab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:goodLab];
    
    UILabel *detailLab = [[UILabel alloc]initWithFrame:CGRectMake(0, hei/2+45, wid, 20)];
    detailLab.text = @"详情 >>";
    detailLab.textColor = WHITECOLOR;
    detailLab.font = [UIFont systemFontOfSize:16];
    detailLab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:detailLab];
    
    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(0, 0, wid, hei);
    unBindBtn.backgroundColor = [UIColor clearColor];
    unBindBtn.layer.cornerRadius = hei/2;
    unBindBtn.clipsToBounds = YES;
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [cicView addSubview:unBindBtn];

    
}





-(void)createKit
{
    NSLog(@"222222222222");
    session *danli = [session getInstance];
    NSLog(@"%@",danli.headerPic);
    self.view.backgroundColor = BGCOLOR;
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    bgImageView.image = [UIImage imageNamed:@"index-bg"];
    [self.view addSubview:bgImageView];
    
    UIImageView *headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(8, 30, 40, 40)];
    [headerImage setImageWithURL:[NSURL URLWithString:danli.headerPic] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
    headerImage.layer.cornerRadius = 20;
    headerImage.clipsToBounds = YES;
    [self.view addSubview:headerImage];
    

    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerBtn.frame = CGRectMake(10, 30, 50, 50);
//    [headerBtn setBackgroundImage:[UIImage imageNamed:@"touxiang_yuan"] forState:UIControlStateNormal];
    [headerBtn addTarget:self action:@selector(headerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headerBtn];

    UIImageView *zhiQinImage = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 20, 30, 5, 30)];
    zhiQinImage.image = [UIImage imageNamed:@""];
    [self.view addSubview:zhiQinImage];

    UIButton *zhiQinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zhiQinBtn.frame = CGRectMake(WIDTH - 50, 30, 40, 40);
    zhiQinBtn.layer.cornerRadius = 3;
    zhiQinBtn.clipsToBounds = YES;
    [zhiQinBtn addTarget:self action:@selector(zhiQinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhiQinBtn];

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, WIDTH, 20)];
    titleLabel.text = @"睡眠报告";
    titleLabel.textColor = WHITECOLOR;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];

    UIButton *linkManBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    linkManBtn.frame = CGRectMake(WIDTH - 60, HEIGHT - 60, 50, 50);
    [linkManBtn addTarget:self action:@selector(linkManBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [linkManBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"contact_menu" ofType:@"png"]] forState:UIControlStateNormal];
    [linkManBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 0, 0)];
//    linkManBtn.layer.cornerRadius = 20;
//    linkManBtn.clipsToBounds = YES;
    [self.view addSubview:linkManBtn];

//    NSArray *chengHuArray = @[@"爸爸",@"妈妈",@"姐姐",@"弟弟",@"妹妹"];
//    NSArray *chengHuArray = @[@"爸爸",@"妈妈",@"姐姐",@"弟弟"];
//    NSArray *chengHuArray = @[@"爸爸",@"妈妈",@"姐姐"];
    NSArray *chengHuArray = @[@"爸爸",@"妈妈"];
//    NSArray *chengHuArray = @[@"爸爸"];
//    NSArray *chengHuArray = @[];

    
    if (chengHuArray.count > 0) {
        self.picWhith = 60 - (chengHuArray.count - 1) * 5;
        
        self.headerBG = [[UIView alloc]initWithFrame:CGRectMake((WIDTH - self.picWhith * chengHuArray.count - 3 * (chengHuArray.count - 1)) / 2 - 1, 109, self.picWhith + 2, self.picWhith + 2)];
        self.headerBG.backgroundColor = [UIColor whiteColor];
        self.headerBG.hidden = YES;
        [self.view addSubview:self.headerBG];

        
        for (int i = 0; i < chengHuArray.count; i++) {
            UIImageView *personImage = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH- self.picWhith * chengHuArray.count - 3 * (chengHuArray.count - 1)) / 2 + (self.picWhith + 2) * i, 110, self.picWhith, self.picWhith)];
            [personImage setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"touxiang_fang"]];
            personImage.userInteractionEnabled = YES;
            [self.view addSubview:personImage];
            
            UIButton *personBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            personBtn.frame = CGRectMake((WIDTH- self.picWhith * chengHuArray.count - 3 * (chengHuArray.count - 1)) / 2 + (self.picWhith + 2) * i , 110, self.picWhith , self.picWhith);
            personBtn.tag = 1314 + i;
            personBtn.layer.cornerRadius = 3;
            personBtn.clipsToBounds = YES;
            [personBtn addTarget:self action:@selector(personBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:personBtn];
            
            UILabel *namedLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.picWhith, 20)];
            namedLabel.text = chengHuArray[i];
            namedLabel.textColor= WHITECOLOR;
            namedLabel.textAlignment = NSTextAlignmentCenter;
            namedLabel.font = [UIFont systemFontOfSize:16];
            CGPoint point = personImage.center;
            point.y = point.y + self.picWhith / 2 + 15;
            namedLabel.center = point;
            [self.view addSubview:namedLabel];
            
        }
        
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSLog(@"dateString:%@",dateString);
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110 + self.picWhith + 30, WIDTH, 20)];
        timeLabel.text = dateString;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:16];
        timeLabel.textColor = WHITECOLOR;
        [self.view addSubview:timeLabel];
        
        
        UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110 + self.picWhith + 30 + 60, WIDTH, 20)];
        firstLabel.text = @"";
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:@"宁波排名:100"];
        NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 4);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 1);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
        [firstLabel setAttributedText:noteStr] ;
        firstLabel.textAlignment = NSTextAlignmentCenter;
        firstLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:firstLabel];
        
        UILabel *secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110 + self.picWhith + 30 + 85, WIDTH, 20)];
        secondLabel.text = @"";
        noteStr = [[NSMutableAttributedString alloc] initWithString:@"全国排名:100000"];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 7);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 1);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
        [secondLabel setAttributedText:noteStr] ;
        secondLabel.textAlignment = NSTextAlignmentCenter;
        secondLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:secondLabel];
        
        UILabel *thirdLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110 + self.picWhith + 30 + 110, WIDTH, 20)];
        noteStr = [[NSMutableAttributedString alloc] initWithString:@"系统预测寿命可达200岁"];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"岁"].location + 1);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"岁"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"达"].location + 1);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
        [thirdLabel setAttributedText:noteStr] ;
        thirdLabel.textAlignment = NSTextAlignmentCenter;
        thirdLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:thirdLabel];
        
        UILabel *fourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110 + self.picWhith + 30 + 35, WIDTH, 20)];
        fourceLabel.textAlignment = NSTextAlignmentCenter;
        noteStr = [[NSMutableAttributedString alloc] initWithString:@"睡眠质量:优质"];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 3);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location + 1);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:redRange];
        [fourceLabel setAttributedText:noteStr] ;
        fourceLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:fourceLabel];
        
    }else
    {
        
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSLog(@"dateString:%@",dateString);
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110, WIDTH, 20)];
        timeLabel.text = dateString;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:16];
        timeLabel.textColor = WHITECOLOR;
        [self.view addSubview:timeLabel];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 140, WIDTH - 20, 40);
        button.tag = 1;
        [button setTitle:@"亲!您未设置亲情榜哦>>" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = 3;
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.clipsToBounds = YES;
        [button addTarget:self action:@selector(zhiQinBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UILabel *moonlenLB = [[UILabel alloc]initWithFrame:CGRectMake(8, HEIGHT - 80, WIDTH, 30)];
        moonlenLB.textColor = WHITECOLOR;
        moonlenLB.text = @"小月智能枕";
        moonlenLB.textAlignment = NSTextAlignmentLeft;
        moonlenLB.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:moonlenLB];
        
        UILabel *healthLB = [[UILabel alloc]initWithFrame:CGRectMake(8, HEIGHT - 50, 100, 20)];
        healthLB.textColor = WHITECOLOR;
        healthLB.text = @"为您健康睡眠";
        healthLB.textAlignment = NSTextAlignmentLeft;
        healthLB.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:healthLB];
        
        UILabel *scienceLB = [[UILabel alloc]initWithFrame:CGRectMake(8, HEIGHT - 30, 100, 20)];
        scienceLB.textColor = WHITECOLOR;
        scienceLB.text = @"提供科学护航";
        scienceLB.textAlignment = NSTextAlignmentLeft;
        scienceLB.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:scienceLB];
        
        UILabel *boultLB = [[UILabel alloc]initWithFrame:CGRectMake(108, HEIGHT - 40, 100, 20)];
        boultLB.textColor = WHITECOLOR;
        boultLB.text = @">>";
        boultLB.textAlignment = NSTextAlignmentLeft;
        boultLB.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:boultLB];
        
        
    }
    
   

//    NSArray *titleArray = @[@"登陆注册",@"小月论坛",@"修改密码",@"黑名单库",@"个人信息"];
//    self.view.backgroundColor = [UIColor whiteColor];
//    for (int i = 0; i < titleArray.count; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(WIDTH - 100, 250 + 50 * i, 100, 50  );
//        button.tag = 1 + i;
//        button.backgroundColor = [UIColor redColor];
//        [button setTitle:titleArray[i] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button];
//    }



//    UIView *blueView = [[UIView alloc] init];
//    blueView.backgroundColor = [UIColor blueColor];
//
//    blueView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:blueView];
//
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    redView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:redView];
//
//    //2.添加约束
//    //2.1水平方向的约束
//    NSString *hVFL = @"H:|-30-[blueView]-30-[redView(==blueView)]-30-|";
//    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop metrics:nil views:@{@"blueView":blueView, @"redView":redView}];
//    [self.view addConstraints:hCons];
//
//    //2.2垂直方向的约束
//    NSString *vVFL = @"V:[blueView(50)]-30-[redView(==blueView)]-30-|";
//    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"blueView":blueView}];
//    [self.view addConstraints:vCons];
//
//    UIView *blueView = [[UIView alloc] init];
//    blueView.backgroundColor = [UIColor blueColor];
//    blueView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:blueView];
//
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    redView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:redView];
//
//    //2.添加约束
//    //2.1水平方向的约束
//    NSString *hVFL = @"H:|-30-[blueView]-30-|";
//    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:@{@"blueView":blueView}];
//    [self.view addConstraints:hCons];
//
//    //2.2垂直方向的约束
//    NSString *vVFL = @"V:|-300-[blueView(50)]-30-[redView(==blueView)]";
//    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"blueView":blueView, @"redView":redView}];
//    [self.view addConstraints:vCons];
//    NSLayoutConstraint *redLeftCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
//    [self.view addConstraint:redLeftCon];
    
//    sleepDrawView *sleepDraw = [[sleepDrawView alloc]initWithFrame:CGRectMake(0, 300, WIDTH / 2, 150)];
//    sleepDraw.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:sleepDraw];
    
}

-(void)zhiQinBtnClick
{
    NSLog(@"设置至亲榜");
}

-(void)personBtnClick:(UIButton *)sender
{
    self.headerBG.hidden = NO;
    self.headerBG.center = CGPointMake(sender.center.x, sender.center.y);
    NSLog(@"查看亲人报告");
}

-(void)linkManBtnClick
{
    linkManVC *linkman = [[linkManVC alloc]init];
    [self.navigationController pushViewController:linkman animated:YES];
}

-(void)buttonClick:(UIButton *)sender
{
    switch (sender.tag - 1) {
        case 0:
        {
            loginVC *login = [[loginVC alloc]init];
            [self.navigationController pushViewController:login animated:YES];
            break;
        }
        case 1:
        {
            break;
        }case 2:
        {
            changePSWVC *changePSW = [[changePSWVC alloc]init];
            [self.navigationController pushViewController:changePSW animated:YES];
            break;
        }
        case 3:
        {

            BlackListViewController *black = [[BlackListViewController alloc]init];
            [self.navigationController pushViewController:black animated:YES];
            break;
        }
        case 4:
        {
            PersonInfoViewController *per = [[PersonInfoViewController alloc]init];
            [self.navigationController pushViewController:per animated:YES];
            break;
        }
        default:
            break;
    }
}

-(void)headerBtnClick
{
    NSLog(@"跳转个人中心");
    session *danli = [session getInstance];
    
    if (danli.isLogoin) {
        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        if (tempAppDelegate.LeftSlideVC.closed)
        {
            [tempAppDelegate.LeftSlideVC openLeftView];
        }
        else
        {
            [tempAppDelegate.LeftSlideVC closeLeftView];
        }

    }else
    {
        loginVC *login = [[loginVC alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
