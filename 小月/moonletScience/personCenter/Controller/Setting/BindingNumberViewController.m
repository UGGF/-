//
//  BindingNumberViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "BindingNumberViewController.h"
#import "BindingAccountViewController.h"
#import <CommonCrypto/CommonDigest.h>


@interface BindingNumberViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    NSTimer *_timer;
}
@end

@implementation BindingNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatTextfieldView];
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
    title.text = @"绑定手机号";
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
    
    //完成按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-50, 15, 40, 20);
    [saveBtn setTitle:@"完成" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    saveBtn.clipsToBounds = YES;
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)creatTextfieldView{
    UIView *numView = [[UIView alloc]initWithFrame:CGRectMake(20, 20+70, WIDTH-40, 40)];
    numView.backgroundColor = WHITECOLOR;
    numView.layer.borderWidth = 2;
    numView.layer.borderColor = SLIVERYCOLOR.CGColor;
    numView.layer.masksToBounds =YES;
    [self.view addSubview:numView];

    
    _phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, WIDTH-60, 40)];
    _phoneTF.placeholder = @"请输入手机号";
    _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTF.delegate = self;
    _phoneTF.font = [UIFont systemFontOfSize:15];
    [numView addSubview:_phoneTF];
    
    //
    UIView *PwdView = [[UIView alloc]initWithFrame:CGRectMake(20,45+ 20+70, WIDTH-40, 40)];
    PwdView.backgroundColor = WHITECOLOR;
    PwdView.layer.borderWidth = 2;
    PwdView.layer.borderColor = SLIVERYCOLOR.CGColor;
    PwdView.layer.masksToBounds =YES;
    [self.view addSubview:PwdView];
    
   _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, WIDTH-60, 40)];
    _passwordTF.placeholder = @"请设置密码(6-11位数字或者字母)";
    _passwordTF.delegate = self;
    _passwordTF.secureTextEntry = YES;
    _passwordTF.font = [UIFont systemFontOfSize:15];
    [PwdView addSubview:_passwordTF];
    
    //
    UIView *checkView = [[UIView alloc]initWithFrame:CGRectMake(20,45+ 20+70+45, WIDTH/2+30-40, 40)];
    checkView.backgroundColor = WHITECOLOR;
    checkView.layer.borderWidth = 2;
    checkView.layer.borderColor = SLIVERYCOLOR.CGColor;
    checkView.layer.masksToBounds =YES;
    [self.view addSubview:checkView];
    
    _identifyingTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, WIDTH/2+30-60, 40)];
    _identifyingTF.placeholder = @"输入验证码";
    _identifyingTF.keyboardType = UIKeyboardTypeNumberPad;
    _identifyingTF.delegate = self;
    _identifyingTF.layer.masksToBounds = YES;
    _identifyingTF.keyboardType = UIKeyboardTypeNumberPad;
    _identifyingTF.font = [UIFont systemFontOfSize:15];
    [checkView addSubview:_identifyingTF];
    
//    UITapGestureRecognizer *tap6= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//    [self.view addGestureRecognizer:tap6];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH/2+30-40+20+5, 5+40+65+70, WIDTH/2-35, 40);
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    btn.backgroundColor = CAOGREENCOLOR;
    btn.layer.cornerRadius = 3;
    btn.clipsToBounds = YES;
    [btn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 5+40+65+70+40+15, WIDTH-30, 30)];
    lab.text = @"绑定手机可以保障您的账户安全，当您忘记登录密码时，可通过此处绑定的手机号找回密码。";
    lab.textColor = TEXTTINTCOLOR;
    lab.numberOfLines = 0;
    lab.font = [UIFont systemFontOfSize:12];
    //    lab.textAlignment = NSTextAlignmentCenter;
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];

}
//- (void)tapClick:(UIGestureRecognizer *)sender{
//    if (sender.numberOfTouches == 1) {
//        [_passwordTF resignFirstResponder];
//        [_phoneTF resignFirstResponder];
//        [_identifyingTF resignFirstResponder];
//    }
//}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)btnClick{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    _myview = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2+30-40+20+5, +45+65+70, WIDTH/2-35, 40)];
    _myview.backgroundColor = CAOGREENCOLOR;
    _myview.layer.cornerRadius = 3;
    _myview.clipsToBounds = YES;
    [self.view addSubview:_myview];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2-35, 40)];
    _lab.font = [UIFont systemFontOfSize:15];
    _lab.text = @"已发至手机(60s)";
    _lab.layer.cornerRadius = 3;
    _lab.clipsToBounds = YES;
    _lab.textColor = WHITECOLOR;
    _lab.textAlignment = NSTextAlignmentCenter;
    [_myview addSubview:_lab];
    
    time = 0;
    
}

- (void)changeTime{
    time++;
    int value = 60 - time;
    if (value >= 0) {
        self.lab.text = [NSString stringWithFormat:@"已发至手机(%ds)",value];
    }else{
        [self.timer invalidate];
        [self.myview removeFromSuperview];
    }
    
}

//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    if ([string isEqualToString:@""] && range.length > 0) {
//        return YES;
//    }else{
//        if (textField.text.length - range.length + string.length >11 ) {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"超出可输入最大长度" message:nil preferredStyle:UIAlertControllerStyleAlert];
//            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
//            [self presentViewController:alert animated:true completion:nil];
//            return NO;
//        }else{
//            return YES;
//        }
//    }
//}
//

- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:_phoneTF.text]) {
        [self checkTel:_phoneTF.text];
    }else if ([textField.text isEqualToString:_passwordTF.text]){
        [self checkPassWord:_passwordTF.text];
    }
}


- (BOOL)checkTel:(NSString *)str{
    if ([str length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"手机号码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    
    //正则表达式
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,1,5-9])|(17[6-8]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号码" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
       
        return NO;
    }
    return YES;
}

- (BOOL)checkPassWord:(NSString *)str{
    if (_passwordTF.text.length < 6 || _passwordTF.text.length > 16) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"密码应为6-16位，区分大小写" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound) {
        
        return NO;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString(@"您的密码中应不包含特殊字符", nil) preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
    return YES;
}



//[self checkTel:_phoneTF.text] == YES

- (void)saveBtnClick{
    if ( [self checkTel:_phoneTF.text] == YES && [self checkPassWord: _passwordTF.text] == NO) {
        
        UIView *bindView = [[UIView alloc]initWithFrame:CGRectMake(20, 10+70, WIDTH-40, 40)];
        bindView.backgroundColor = TEXTCOLOR;
        bindView.alpha = 0.7;
        [self.view addSubview:bindView];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH-40, 40)];
        lab.text = @"绑定成功!";
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = WHITECOLOR;
        [bindView addSubview:lab];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(yanchi) userInfo:nil repeats:NO];
        
        }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的格式有误" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    
    }
    
}

- (void)yanchi{
    NSLog(@"注册啦");
    [_timer invalidate];
    BindingAccountViewController *bind = [[BindingAccountViewController alloc]init];
    [self.navigationController pushViewController:bind animated:YES];
    NSString *str =[self md5:self.passwordTF.text];
    NSString *str1 = [self md5:str];
    //-substringWithRange: //按照所给出的位置，长度，任意地从字符串中截取子串
    NSString *string2 = [str1 substringWithRange:NSMakeRange(8, 16)];

    
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
