//
//  findPSWVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "findPSWVC.h"
#import "restPSWVC.h"

@interface findPSWVC ()

@end

@implementation findPSWVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createNavBar];
    [self createKit];
}

-(void)createKit
{
    self.view.backgroundColor = BGCOLOR;
    
    self.phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, WIDTH - 20, 40)];
    self.phoneTF.placeholder = @"    请输入手机号码";
    self.phoneTF.textColor = TEXTCOLOR;
    self.phoneTF.backgroundColor = [UIColor whiteColor];
    self.phoneTF.font = [UIFont systemFontOfSize:16];
    self.phoneTF.layer.cornerRadius = 3;
    self.phoneTF.clipsToBounds = YES;
    self.phoneTF.delegate = self;
    self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.phoneTF];
    self.identifyingTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 150, WIDTH - 135, 40)];
    self.identifyingTF.placeholder = @"    请输入验证码";
    self.identifyingTF.textColor = TEXTCOLOR;
    self.identifyingTF.backgroundColor = [UIColor whiteColor];
    self.identifyingTF.font = [UIFont systemFontOfSize:16];
    self.identifyingTF.layer.cornerRadius = 3;
    self.identifyingTF.clipsToBounds = YES;
    self.identifyingTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.identifyingTF];
    
    UIButton *identifyingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    identifyingBtn.frame = CGRectMake(WIDTH - 120, 150, 110, 40);
    identifyingBtn.layer.cornerRadius = 3;
    identifyingBtn.clipsToBounds = YES;
    [identifyingBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    identifyingBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [identifyingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [identifyingBtn addTarget:self action:@selector(identifyingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    identifyingBtn.backgroundColor = GREENCOLOR;
    [self.view addSubview:identifyingBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(10, 240, WIDTH - 20, 40);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.layer.cornerRadius = 3;
    nextBtn.clipsToBounds = YES;
    nextBtn.backgroundColor = GREENCOLOR;
    [self.view addSubview:nextBtn];
}

-(void)identifyingBtnClick
{
    NSLog(@"获取验证码");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    self.identifingBg = [[UIView alloc]initWithFrame:CGRectMake(WIDTH - 120, 150, 110, 40)];
    self.identifingBg.layer.cornerRadius = 3;
    self.identifingBg.clipsToBounds = YES;
    self.identifingBg.backgroundColor = RGBCOLOR(95, 165, 50);
    [self.view addSubview:self.identifingBg];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 110, 40)];
    self.timeLabel.text = @"倒计时(60s)";
    self.timeLabel.textColor = [UIColor whiteColor];
    self.timeLabel.font = [UIFont systemFontOfSize:16];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.identifingBg addSubview:self.timeLabel];
    
    time = 0;
}

-(void)changeTime
{
    time ++;
    int value = 60 - time;
    if (value >= 0) {
        self.timeLabel.text = [NSString stringWithFormat:@"倒计时(%ds)",value];
    }else
    {
        [self.timer invalidate];
        [self.identifingBg removeFromSuperview];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
        [self checkTel:self.phoneTF.text];
}

- (BOOL)checkTel:(NSString *)str

{
    
    if ([str length] == 0) {
        
        ALERTVIEW(@"手机号码不能为空");
        
        
        return NO;
        
    }
    
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    NSString *regex = @"^((13[0-9])|(17[0-9])|(147)|(15[^4,\\D])|(18[0,1,5-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        return NO;
        
    }
    
    
    
    return YES;
    
}


-(void)nextBtnClick
{
    restPSWVC *restPSW = [[restPSWVC alloc]init];
    [self.navigationController pushViewController:restPSW animated:YES];
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    
    statusBarView.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:statusBarView];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    navBar.image = [UIImage imageNamed:@"navbg.png"];
    [self.view addSubview:navBar];
    navBar.backgroundColor = [UIColor clearColor];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"找回密码";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:fanHuiBtn];
    
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
