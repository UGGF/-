//
//  SendMailViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SendMailViewController.h"

@interface SendMailViewController ()
{
    int _time;
}
@property(nonatomic,strong)UILabel *tempLable;
@end

@implementation SendMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =WHITECOLOR;
    [self createNavBar];
    [self creatContentView];
    [self creatInMail];
}

//** 下面状态栏修改的进阶版 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"邮箱验证";
    title.textColor = TEXTCOLOR;
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
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - contentView
- (void)creatContentView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UILabel *sendLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-100, 70+20,200, 40)];
    sendLab.text = @"验证邮件已发送";
    sendLab.font = [UIFont systemFontOfSize:18];
    sendLab.textColor = TEXTCOLOR;
    sendLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:sendLab];
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(20, 70+70, WIDTH-40, 120)];
    contentView.backgroundColor = TEXTTINTCOLOR;
    contentView.alpha = 0.5;
    [self.view addSubview:contentView];
    
    UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH-40,120)];
    contentLab.textAlignment = NSTextAlignmentCenter;
//    contentLab.backgroundColor = REDCOLOR;
    contentLab.textColor = TEXTCOLOR;
    contentLab.text = @"验证邮件已发送至你的邮箱\n\n点击邮箱中的链接完成操作\n验证邮件24小时内有效\n请尽快验证！";
    contentLab.numberOfLines = 0;
    contentLab.font = [UIFont systemFontOfSize:12];
    [contentView addSubview:contentLab];
    
    UILabel *UrlLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, WIDTH-40,20)];
    UrlLab.textAlignment = NSTextAlignmentCenter;
//    UrlLab.backgroundColor = REDCOLOR;
    UrlLab.textColor = REDCOLOR;
    UrlLab.text = @"zhuge_mo@qq.com";
    UrlLab.numberOfLines = 0;
    UrlLab.font = [UIFont systemFontOfSize:12];
    [contentView addSubview:UrlLab];
    
    UILabel *mLab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT-70 ,WIDTH, 20)];
    mLab.textColor = TEXTTINTCOLOR;
    mLab.font = [UIFont systemFontOfSize:10];
    mLab.text = @"如无法自助完成，请至反馈申诉提交诉求内容";
    [self.view addSubview:mLab];
    
    UIButton *mBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mBtn.frame = CGRectMake(120, HEIGHT-70, 40, 20);
    [mBtn setTitle:@"反馈申诉" forState:UIControlStateNormal];
    [mBtn setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
    mBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    //    [mBtn addTarget:self action:@selector(mBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mBtn];

}


#pragma mark - 进入邮箱按钮

- (void)creatInMail{
    UIButton *ImBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ImBtn.frame = CGRectMake(25, 280, WIDTH/2-25, 30);
    ImBtn.backgroundColor = GREENCOLOR;
    [ImBtn setTitle:@"立即进入邮箱" forState:UIControlStateNormal];
    [ImBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    ImBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    //    [mBtn addTarget:self action:@selector(mBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ImBtn];
   
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    _time = 0;
    
    _tempLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, 285, WIDTH/2-20,20)];
    _tempLable.textAlignment = NSTextAlignmentCenter;
    //    UrlLab.backgroundColor = REDCOLOR;
    _tempLable.textColor = TEXTTINTCOLOR;
    _tempLable.text = @"已发送 60s后重新发送";
    _tempLable.numberOfLines = 0;
    _tempLable.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:_tempLable];
    
}

- (void)timeChange{
    _time++;
    int value = 60 - _time;
    if (value >= 0) {
        _tempLable.text = [NSString stringWithFormat:@"已发送 %ds后重新发送",value];
    }else{
        [_tempLable removeFromSuperview];
        [_timer invalidate];
        UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        unBindBtn.frame = CGRectMake(WIDTH/2+10, 285, 100, 20);
        unBindBtn.backgroundColor = WHITECOLOR;
        unBindBtn.layer.cornerRadius = 3;
        unBindBtn.clipsToBounds = YES;
        unBindBtn.adjustsImageWhenHighlighted = NO;
        [unBindBtn setTitle:@"重新发送验证邮件" forState:UIControlStateNormal];
        [unBindBtn setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
        unBindBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [unBindBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:unBindBtn];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2+17, 303, 88, 1)];
        line.backgroundColor = CAOGREENCOLOR;
        [self.view addSubview:line];
    
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
