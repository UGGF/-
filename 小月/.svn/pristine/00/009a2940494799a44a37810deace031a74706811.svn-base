//
//  loginVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "loginVC.h"
#import "registerVC.h"
#import "findPSWVC.h"
#import "QuartzCore/QuartzCore.h"
#import <CommonCrypto/CommonDigest.h>

@interface loginVC ()

@end

@implementation loginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createKit];
    [self createNavBar];
    [self imageView];
    
}

-(void)createKit
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bgImageView = [[UIImageView alloc]init];
    bgImageView.image = [UIImage imageNamed:@"bg"];
    bgImageView.tag = 2016;
    [self.view addSubview:bgImageView];
    
    
    //禁用Autoresizing
    bgImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 3.添加约束
    /*
     lFormat : VFL语句
     options: 对齐方式
     metrics: VFL语句中用到的变量值
     views: VFL语句中用到的控件
     */
    NSString *vfl0 = @"H:|-0-[bgImageView]-0-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl0 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"bgImageView":bgImageView}];
    [self.view addConstraints:hCons];
    NSString *vfl1 = @"V:|-0-[bgImageView]-0-|";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"bgImageView":bgImageView}];
    [self.view addConstraints:vCons];
    
    UIImageView *logoImage = [[UIImageView alloc]init];
    logoImage.image = [UIImage imageNamed:@"xyicon"];
    [self.view addSubview:logoImage];
    
    
    
    logoImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    //设置宽度
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[logoImage(110)]" options:0 metrics:nil views:@{@"logoImage":logoImage}]];
    //设置居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logoImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    vfl1 = @"V:|-80-[logoImage(40)]-|";
    vCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"logoImage":logoImage}];
    [self.view addConstraints:vCons];
    
    self.phoneTF = [[UITextField alloc]init];
    self.phoneTF.backgroundColor = [UIColor whiteColor];
    self.phoneTF.placeholder = @" 手机号";
    self.phoneTF.layer.cornerRadius = 3;
    self.phoneTF.clipsToBounds = YES;
    self.phoneTF.delegate = self;
    self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTF.font = [UIFont systemFontOfSize:16];
    self.phoneTF.textColor = [UIColor blackColor];
    [self.view addSubview:self.phoneTF];
    
    _phoneTF.translatesAutoresizingMaskIntoConstraints = NO;
    vfl0 = @"H:|-10-[_phoneTF]-10-|";
    hCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl0 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"_phoneTF":_phoneTF}];
    [self.view addConstraints:hCons];
    vfl1 = @"V:|-145-[_phoneTF(40)]-|";
    vCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"_phoneTF":_phoneTF}];
    [self.view addConstraints:vCons];
    
    
    self.passWordTF = [[UITextField alloc]init];
    self.passWordTF.backgroundColor = [UIColor whiteColor];
    self.passWordTF.placeholder = @" 密  码";
    self.passWordTF.layer.cornerRadius = 3;
    self.passWordTF.secureTextEntry = YES;
    self.passWordTF.clipsToBounds = YES;
    self.passWordTF.delegate = self;
    self.passWordTF.font = [UIFont systemFontOfSize:16];
    self.passWordTF.textColor = [UIColor blackColor];
    [self.view addSubview:self.passWordTF];
    
    _passWordTF.translatesAutoresizingMaskIntoConstraints = NO;
    vfl0 = @"H:|-10-[_passWordTF]-10-|";
    hCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl0 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"_passWordTF":_passWordTF}];
    [self.view addConstraints:hCons];
    
    //2.2垂直方向的约束
    NSString *vVFL = @"V:|-145-[_phoneTF(40)]-10-[_passWordTF(==_phoneTF)]";
    vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"_phoneTF":_phoneTF, @"_passWordTF":_passWordTF}];
    [self.view addConstraints:vCons];
    NSLayoutConstraint *redLeftCon = [NSLayoutConstraint constraintWithItem:_passWordTF attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_phoneTF attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self.view addConstraint:redLeftCon];
    
    UIButton *losePSW = [UIButton buttonWithType:UIButtonTypeCustom];
        losePSW.frame = CGRectMake(WIDTH - 100 , 235, 100, 40);
    [losePSW setTitle:@"找回密码" forState:UIControlStateNormal];
    losePSW.titleLabel.font = [UIFont systemFontOfSize:16];
    losePSW.titleLabel.textAlignment = NSTextAlignmentRight;
    [losePSW setTitleColor:RGBCOLOR(96, 191, 243) forState:UIControlStateNormal];
    [losePSW addTarget:self action:@selector(losePSWClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:losePSW];
    
//    losePSW.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    //设置宽度
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[losePSW(100)]" options:0 metrics:nil views:@{@"losePSW":losePSW}]];
////    //设置居右
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:losePSW attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
//    
//    vfl1 = @"V:|-235-[losePSW(40)]-10-|";
//    vCons = [NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:NSLayoutFormatAlignAllBottom metrics:nil views:@{@"losePSW":losePSW}];
//    [self.view addConstraints:vCons];
    
    UIButton *logoinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logoinButton.frame = CGRectMake(10, 295, WIDTH - 20, 40);
    logoinButton.layer.cornerRadius = 3;
    logoinButton.clipsToBounds = YES;
    logoinButton.backgroundColor = [UIColor whiteColor];
    [logoinButton setTitle:@"登录" forState:UIControlStateNormal];
    [logoinButton setTitleColor:RGBCOLOR(36, 33, 29) forState:UIControlStateNormal];
    logoinButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [logoinButton addTarget:self action:@selector(logoinButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoinButton];
    
    NSArray *imageArray = @[@"QQ",@"Wchat",@"Sina"];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((WIDTH - 120) / 4 + ((WIDTH - 120) / 4 + 40)* i , HEIGHT - 100, 40, 40   );
        button.tag = 2016 + i;
        [button setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    //    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    testBtn.frame = CGRectMake(100, 90, 100, 100);
    //    [testBtn setTitle:@"截屏分享" forState:UIControlStateNormal];
    //    [testBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    //    testBtn.layer.cornerRadius = 3;
    //    testBtn.clipsToBounds = YES;
    //    testBtn.backgroundColor = [UIColor yellowColor];
    //    [testBtn addTarget:self action:@selector(testBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:testBtn];
    //
    //    self.shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 20,WIDTH, HEIGHT - 20)];
    //    self.shareView.backgroundColor = [UIColor purpleColor];
    //
    //    UILabel *testlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH, 100 )];
    //    testlabel.numberOfLines = 0;
    //    testlabel.textColor = TEXTCOLOR;
    //    testlabel.font = [UIFont systemFontOfSize:16];
    //    testlabel.text = @"耳机结婚呢搜房网很难得我都快我叫呢我飞快我看好你的覅户的菊花文档五谷不分 时间的覅圣诞节房产税的好处费你手机承诺扣菊花男差距和是豌豆荚    四点就覅是大货车副书记和塑胶的横幅接电话不聚会上半场举手";
    //    [self.shareView addSubview:testlabel];
    //
    //    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 110, 100, 100)];
    //    imageView.image = [UIImage imageNamed:@"touxiang_icon"];
    //    [self.shareView addSubview:imageView];
}

//- (UIImage *)createShareImage
//{
//    //    ShareModelView *shareView = [self createShareView];
//    UIGraphicsBeginImageContextWithOptions(self.shareView.frame.size, NO, 2);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [self.shareView.layer renderInContext: context];
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return theImage;
//}
//
//-(void)testBtnClick
//{
//    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//    bgView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:bgView];
//
//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 70, WIDTH , HEIGHT - 70)];
//    image.image = [self createShareImage];
//    image.backgroundColor = [UIColor redColor];
//    [self.view addSubview:image];
//}

-(void)imageView
{
    
    ////截屏保存经测试可行
    //    UIGraphicsBeginImageContext(self.view.bounds.size);
    //
    //    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //
    //    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    //
    //    UIGraphicsEndImageContext();
    //
    //    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
}

-(void)buttonClick:(UIButton *)sender
{
    switch (sender.tag - 2016) {
        case 0:
        {
            NSLog(@"QQ登录");
            break;
        }
        case 1:
        {
            NSLog(@"微信登录");
            break;
        }
        case 2:
        {
            NSLog(@"新浪微博登录");
            break;
        }
            
        default:
            break;
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

-(void)logoinButtonClick
{
    [self.view endEditing:YES];
    NSString *str =[self md5:self.passWordTF.text];
    NSString *str1 = [self md5:str];
    //-substringWithRange: //按照所给出的位置，长度，任意地从字符串中截取子串
    NSString *string2 = [str1 substringWithRange:NSMakeRange(8, 16)];
    
   
    [ZYHTTPRequest request:LOGIN_URL(self.phoneTF.text, string2) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        int stat = [[dict objectForKey:@"code"] intValue];
        if (stat == 200) {
            session *danli = [session getInstance];
            danli.userId = [dict objectForKey:@"userId"];
            danli.token = [dict objectForKey:@"token"];
            danli.isLogoin = YES;
//            danli.headerPic = [dict objectForKey:@"useInfo"];
            //            建立文件管理
            //           NSFileManager *fm = [NSFileManager defaultManager];
            
            //找到Documents文件所在的路径
            NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //取得第一个Documents文件夹的路径
            NSString *filePath = [path objectAtIndex:0];
            
            //把TestPlist文件加入
            NSString *plistPath = [filePath stringByAppendingPathComponent:@"test.plist"];
            NSLog(@"%@",plistPath);
            //开始创建文件
            //           [fm createFileAtPath:plistPath contents:nil attributes:nil];
            
            //删除文件
            //           [fm removeItemAtPath:plistPath error:nil];
            
            //           在写入数据之前，需要把要写入的数据先写入一个字典中，创建一个dictionary：
            
            //创建一个字典
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[dict objectForKey:@"userId"],@"id", self.phoneTF.text,@"loginName",string2,@"loginPass",nil];
            //把数据写入plist文件
            
            [dic writeToFile:plistPath atomically:YES];
            
            //读取plist文件，首先需要把plist文件读取到字典中
            
            NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:plistPath];
            
//            //打印数据
//            danli.userId = [dic objectForKey:@"id"];
//            danli.userName = [dic objectForKey:@"name"];
//            danli.isLogoin = YES;
            
            NSLog(@"key1 is %@",[dic2 valueForKey:@"loginName"]);
            
            NSLog(@"dic is %@",dic2);
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    }];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if ([textField.text isEqualToString:self.phoneTF.text]) {
        [self checkTel:self.phoneTF.text];
    }
    else if ([textField.text isEqualToString:self.passWordTF.text])
    {
        [self checkPassWord:self.passWordTF.text];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    return YES;
}

-(void)checkPassWord:(NSString *)str
{
    
    //***获取字符串
    
    //    NSString *str=tf.text;
    //***调用关键方法，获得bool值，yes或者no：
    BOOL ok= [self isIncludeSpecialCharact:_passWordTF.text];
    if (ok==YES) {
        NSLog(@"包含有特殊字符");
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString(@"您的密码中应不包含特殊字符", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
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


-(void)losePSWClick
{
    NSLog(@"找回密码");
    findPSWVC *findPSW = [[findPSWVC alloc]init];
    [self.navigationController pushViewController:findPSW animated:YES];
}

-(NSString *)filePath
{
    NSFileManager *m = [NSFileManager defaultManager];
    
    NSString* Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)[0];
    NSString *filePath = [Path stringByAppendingPathComponent:@"userInfo.plist"];
    
    if (![m fileExistsAtPath:filePath]) {
        [m createFileAtPath:filePath contents:nil attributes:nil];
    }
    return filePath;
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
    title.text = @"账号";
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
    
    UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 70, 15, 20, 20)];
    userImage.image = [UIImage imageNamed:@"zhuce_icon"];
    [navBar addSubview:userImage];
    
    UILabel *registerLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH - 50, 15, 40, 20)];
    registerLabel.text = @"注册";
    registerLabel.textColor = [UIColor whiteColor];
    registerLabel.textAlignment = NSTextAlignmentCenter;
    registerLabel.font = [UIFont systemFontOfSize:18];
    [navBar addSubview:registerLabel];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(WIDTH/ 2, 0, WIDTH / 2, 50);
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:registerBtn];
}

-(void)registerBtnClick
{
    registerVC *registerUser = [[registerVC alloc]init];
    [self.navigationController pushViewController:registerUser animated:YES];
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
