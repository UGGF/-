//
//  changePSWVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/5.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "changePSWVC.h"
#import <CommonCrypto/CommonDigest.h>

@interface changePSWVC ()

@end

@implementation changePSWVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self createKit];
}

-(void)createKit
{
    self.view.backgroundColor = BGCOLOR;
    
    self.oldPSWTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, WIDTH - 20, 40)];
    self.oldPSWTF.placeholder = @"    请输入原密码";
    self.oldPSWTF.textColor = TEXTCOLOR;
    self.oldPSWTF.backgroundColor = [UIColor whiteColor];
    self.oldPSWTF.font = [UIFont systemFontOfSize:16];
    self.oldPSWTF.layer.cornerRadius = 3;
    self.oldPSWTF.clipsToBounds = YES;
    self.oldPSWTF.delegate = self;
    [self.view addSubview:self.oldPSWTF];
    
    self.PSWTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 150, WIDTH - 20, 40)];
    self.PSWTF.placeholder = @"    请输入新密码(6-11位数字或者字母)";
    self.PSWTF.textColor = TEXTCOLOR;
    self.PSWTF.backgroundColor = [UIColor whiteColor];
    self.PSWTF.font = [UIFont systemFontOfSize:16];
    self.PSWTF.layer.cornerRadius = 3;
    self.PSWTF.clipsToBounds = YES;
    self.PSWTF.delegate = self;
    [self.view addSubview:self.PSWTF];
    
    self.restPSWTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 200, WIDTH - 20, 40)];
    self.restPSWTF.placeholder = @"    请再次输入新密码";
    self.restPSWTF.textColor = TEXTCOLOR;
    self.restPSWTF.backgroundColor = [UIColor whiteColor];
    self.restPSWTF.font = [UIFont systemFontOfSize:16];
    self.restPSWTF.layer.cornerRadius = 3;
    self.restPSWTF.clipsToBounds = YES;
    [self.view addSubview:self.restPSWTF];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(10, 290, WIDTH - 20, 40);
    sureButton.layer.cornerRadius = 3;
    sureButton.clipsToBounds = YES;
    sureButton.backgroundColor = [UIColor whiteColor];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:RGBCOLOR(36, 33, 29) forState:UIControlStateNormal];
    sureButton.backgroundColor = GREENCOLOR;
    sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureButton];
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

-(BOOL)checkPassWord:(NSString *)str
{
    NSLog(@"这是什么鬼？");
    //***获取字符串
    
    //    NSString *str=tf.text;
    //***调用关键方法，获得bool值，yes或者no：
    BOOL ok= [self isIncludeSpecialCharact:self.PSWTF.text];
    if (ok==YES) {
        NSLog(@"包含有特殊字符");
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString(@"您的密码中应不包含特殊字符", nil) delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }else{
        NSLog(@"不包含特殊字符");
        return YES;
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


-(void)sureButtonClick
{
    [self.view endEditing:YES];
    if ([self checkPassWord:self.PSWTF.text]) {
        if (self.PSWTF.text.length < 6 || self.PSWTF.text.length > 16)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"密码应为6~16位,区分大小写" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }else
        {
            
            if ([self.PSWTF.text isEqualToString:self.restPSWTF.text]) {
                NSString *str =[self md5:self.PSWTF.text];
                NSString *str1 = [self md5:str];
                //-substringWithRange: //按照所给出的位置，长度，任意地从字符串中截取子串
                NSString *string2 = [str1 substringWithRange:NSMakeRange(8, 16)];
                
                NSString *str2 = [self md5:self.oldPSWTF.text];
                NSString *str3 = [self md5:str2];
                NSString *string5 = [str3 substringWithRange:NSMakeRange(8, 16)];
//                session *danli = [session getInstance];
//                [ZYHTTPRequest requestLogionedChangePSWForResult:danli.userId :string5 :string2 Completion:^(NSDictionary *dict) {
//                    NSNumber *status = [dict objectForKey:@"status"];
//                    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
//                    NSString *str = [numberFormatter stringFromNumber:status];
//                    
//                    if ([str isEqualToString:@"1"]) {
//                        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString(@"密码修改成功！", nil) delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//                        [alert show];
//                    }else if ([str isEqualToString:@"2"])
//                    {
//                        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"温馨提示", nil) message:NSLocalizedString([dict objectForKey:@"message"], nil) delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//                        [alert show];
//                    }
//                    
//                }];
                
            }else
            {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"两次输入密码不一致，请重新输入" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                [alertView show];
                self.restPSWTF.text = @"";
            }
        }
    }

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
    title.text = @"修改密码";
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
