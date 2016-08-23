//
//  registerVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "registerVC.h"
#import "headerImage.h"
#import <CommonCrypto/CommonDigest.h>

@interface registerVC ()

@end

@implementation registerVC

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
    
    self.passWordTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 150, WIDTH - 20, 40)];
    self.passWordTF.placeholder = @"    请设置密码(6-11位数字或者字母)";
    self.passWordTF.textColor = TEXTCOLOR;
    self.passWordTF.backgroundColor = [UIColor whiteColor];
    self.passWordTF.font = [UIFont systemFontOfSize:16];
    self.passWordTF.layer.cornerRadius = 3;
    self.passWordTF.clipsToBounds = YES;
    self.passWordTF.delegate = self;
    [self.view addSubview:self.passWordTF];
    
    self.identifyingTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 200, WIDTH - 140, 40)];
    self.identifyingTF.placeholder = @"    请输入验证码";
    self.identifyingTF.textColor = TEXTCOLOR;
    self.identifyingTF.backgroundColor = [UIColor whiteColor];
    self.identifyingTF.font = [UIFont systemFontOfSize:16];
    self.identifyingTF.layer.cornerRadius = 3;
    self.identifyingTF.clipsToBounds = YES;
    self.identifyingTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.identifyingTF];
    
    UIButton *identifyingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    identifyingBtn.frame = CGRectMake(WIDTH - 120, 200, 110, 40);
    identifyingBtn.layer.cornerRadius = 3;
    identifyingBtn.clipsToBounds = YES;
    [identifyingBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    identifyingBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [identifyingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [identifyingBtn addTarget:self action:@selector(identifyingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    identifyingBtn.backgroundColor = GREENCOLOR;
    [self.view addSubview:identifyingBtn];
    
    UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.frame = CGRectMake(10, 250, 20, 20);
    chooseBtn.selected = NO;
    [chooseBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [chooseBtn setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    chooseBtn.backgroundColor = [UIColor whiteColor];
    chooseBtn.layer.cornerRadius = 10;
    chooseBtn.clipsToBounds = YES;
    [chooseBtn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseBtn];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 250, 115, 20)];
    textLabel.text = @"我已经阅读并同意";
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:textLabel];
    
    UILabel *xieYitLabel = [[UILabel alloc]initWithFrame:CGRectMake(40 + 115, 250, 115, 20)];
    xieYitLabel.text = @"用户使用协议";
    xieYitLabel.font = [UIFont systemFontOfSize:14];
    xieYitLabel.textAlignment = NSTextAlignmentLeft;
    xieYitLabel.textColor = GREENCOLOR;
    [self.view addSubview:xieYitLabel];

    UIButton *xieYiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    xieYiBtn.frame = CGRectMake(40, 240, WIDTH - 50 , 40);
    [xieYiBtn addTarget:self action:@selector(xieYiBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:xieYiBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(10, 310, WIDTH - 20, 40);
    [registerBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.layer.cornerRadius = 3;
    registerBtn.clipsToBounds = YES;
    registerBtn.backgroundColor = GREENCOLOR;
    [self.view addSubview:registerBtn];
}

-(void)registerBtnClick
{
    NSLog(@"注册啦");
    headerImage *header = [[headerImage alloc]init];
    [self.navigationController pushViewController:header animated:YES];
    NSString *str =[self md5:self.passWordTF.text];
    NSString *str1 = [self md5:str];
    //-substringWithRange: //按照所给出的位置，长度，任意地从字符串中截取子串
    NSString *string2 = [str1 substringWithRange:NSMakeRange(8, 16)];
    
//    [ZYHTTPRequest requestRegisterForResult:_phoneTF.text :string2 :_yanZhengMa.text :_referrerTF.text Completion:^(NSDictionary *dict) {
//        _yanZhengMaDict = dict;
//        NSNumber *status = [_yanZhengMaDict objectForKey:@"status"];
//        NSLog(@"%@",[dict objectForKey:@"message"]);
//        NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
//        NSString *str = [numberFormatter stringFromNumber:status];
//        
//        if ([str isEqualToString:@"2"]) {
//            [ZYHTTPRequest requestLogoinForResult:_phoneTF.text :string2 Completion:^(NSDictionary *dict) {
//                
//                NSNumber *status = [dict objectForKey:@"status"];
//                
//                NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
//                NSString *str = [numberFormatter stringFromNumber:status];
//                if ([str isEqualToString:@"1"]) {
//                    //建立文件管理
//                    //           NSFileManager *fm = [NSFileManager defaultManager];
//                    
//                    //找到Documents文件所在的路径
//                    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//                    
//                    //取得第一个Documents文件夹的路径
//                    NSString *filePath = [path objectAtIndex:0];
//                    
//                    //把TestPlist文件加入
//                    NSString *plistPath = [filePath stringByAppendingPathComponent:@"test.plist"];
//                    NSLog(@"%@",plistPath);
//                    //开始创建文件
//                    //           [fm createFileAtPath:plistPath contents:nil attributes:nil];
//                    
//                    //删除文件
//                    //           [fm removeItemAtPath:plistPath error:nil];
//                    
//                    //           在写入数据之前，需要把要写入的数据先写入一个字典中，创建一个dictionary：
//                    
//                    //创建一个字典
//                    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[[dict objectForKey:@"buyerList"] objectForKey:@"id"],@"id",[[dict objectForKey:@"buyerList"] objectForKey:@"loginName"],@"loginName",[[dict objectForKey:@"buyerList"] objectForKey:@"loginPass"],@"loginPass",nil];
//                    //把数据写入plist文件
//                    
//                    [dic writeToFile:plistPath atomically:YES];
//                    
//                    //读取plist文件，首先需要把plist文件读取到字典中
//                    
//                    NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:plistPath];
//                    
//                    //打印数据
//                    session *danli = [session getInstance];
//                    
//                    danli.userId = [[dict objectForKey:@"buyerList"] objectForKey:@"id"];
//                    danli.userName = [[dict objectForKey:@"buyerList"] objectForKey:@"name"];
//                    danli.userJf = [[dict objectForKey:@"buyerList"] objectForKey:@"jf"];
//                    danli.userMoney = [[dict objectForKey:@"buyerList"] objectForKey:@"money"];
//                    danli.headerPic = [[dict objectForKey:@"buyerList"] objectForKey:@"headPic"];
//                    danli.isLogoin = YES;
//                    
//                    NSLog(@"key1 is %@",[dic2 valueForKey:@"loginName"]);
//                    
//                    NSLog(@"dic is %@",dic2);
//                    
//                    
//                    [self.navigationController popToRootViewControllerAnimated:YES];
//                    
//                }else if ([str isEqualToString:@"0"])
//                {
//                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString([dict objectForKey:@"message"], nil) delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//                    [alert show];
//                }else if ([str isEqualToString:@"2"])
//                {
//                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString([dict objectForKey:@"message"], nil) delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//                    [alert show];
//                }
//                else if ([str isEqualToString:@"3"])
//                {
//                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString([dict objectForKey:@"message"], nil) delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//                    [alert show];
//                }
//                
//            }];
//        }
//    }];

}

-(void)xieYiBtnClick
{
    NSLog(@"阅读协议了");
}

-(void)identifyingBtnClick
{
     NSLog(@"获取验证码");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    
    self.identifingBg = [[UIView alloc]initWithFrame:CGRectMake(WIDTH - 120, 200, 110, 40)];
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
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if ([textField.text isEqualToString:self.phoneTF.text]) {
        [self checkTel:self.phoneTF.text];
    }
    else if ([textField.text isEqualToString:self.passWordTF.text])
    {
        if (_passWordTF.text.length < 6 || self.passWordTF.text.length > 16)
        {
            UIAlertController *_alertView = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"密码应为6~16位,区分大小写" preferredStyle:UIAlertControllerStyleAlert];
            [_alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:_alertView animated:YES completion:nil];
        }else
        {
            [self checkPassWord:_passWordTF.text];
        }
    }
}

-(void)checkPassWord:(NSString *)str
{
    
    //***获取字符串
    
    //    NSString *str=tf.text;
    //***调用关键方法，获得bool值，yes或者no：
    BOOL ok= [self isIncludeSpecialCharact:_passWordTF.text];
    if (ok==YES) {
        NSLog(@"包含有特殊字符");
    
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的密码中应不包含特殊字符" preferredStyle:UIAlertControllerStyleAlert];
        [alertCon addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertCon animated:YES completion:nil];
        
        
    }else{
        NSLog(@"不包含特殊字符");
    }
    
}

//***关键方法

-(BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

- (BOOL)checkTel:(NSString *)str

{
    
    if ([str length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"手机号码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
        
    }
    
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,1,5-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        return NO;
        
    }
    
    
    
    return YES;
    
}


-(void)chooseBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
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
    title.text = @"注册";
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
