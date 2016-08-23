//
//  MailBindingViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MailBindingViewController.h"
#import "SendMailViewController.h"

@interface MailBindingViewController ()

@property(nonatomic,strong)UITextField *Tf;

@property(nonatomic,strong)UITextField *testCode;
@end

@implementation MailBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatTextField];
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



#pragma mark - textfield 验证
- (void)creatTextField{
    self.Tf = [[UITextField alloc]initWithFrame:CGRectMake(20, 90, WIDTH-40, 40)];
    self.Tf.placeholder = @"请输入邮箱";
    self.Tf.layer.borderWidth = 2;
    self.Tf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.Tf.leftViewMode = UITextFieldViewModeAlways;
    self.Tf.layer.borderColor = SLIVERYCOLOR.CGColor;
    self.Tf.layer.cornerRadius = 3;
    self.Tf.layer.masksToBounds = YES;
    self.Tf.textColor = TEXTCOLOR;
    self.Tf.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.Tf];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 140, WIDTH-30, 30)];
    lab.text = @"绑定邮箱可以保障您的账户安全，当您的手机无法接收验证码时，可通过此处绑定的邮箱重新绑定手机.";
    lab.textColor = TEXTTINTCOLOR;
    lab.numberOfLines = 0;
    lab.font = [UIFont systemFontOfSize:12];
    //    lab.textAlignment = NSTextAlignmentCenter;
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
    
    UIButton *mailBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 185, WIDTH-40, 40)];
    mailBtn.backgroundColor = CAOGREENCOLOR;
    [mailBtn setTitle:@"发送验证邮件" forState:UIControlStateNormal];
    [mailBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    mailBtn.layer.cornerRadius = 3;
    mailBtn.clipsToBounds = YES;
    mailBtn.adjustsImageWhenHighlighted = NO;
    [mailBtn addTarget:self action:@selector(mailBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mailBtn];
}


- (void)requestData{
    if ([self.Tf.text isEqualToString:@""]) {
        ALERTVIEW(@"请输入邮箱")
    }

    session *danli = [session getInstance];
    [ZYHTTPRequest request:MAILSEND_URL(danli.token, self.Tf.text) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        int stat = [[dict objectForKey:@"code"] intValue];
        if (stat == 200) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入邮箱验证码" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = @"请输入邮箱验证码";
            }];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.testCode = alert.textFields.firstObject;
                [ZYHTTPRequest request:MAILBINDING_URL(danli.token, self.testCode.text) Completion:^(NSDictionary *dict) {
                    int stat = [[dict objectForKey:@"code"] intValue];
                    if (stat == 200) {
                        NSLog(@"%@",dict);
                        [self.navigationController popViewControllerAnimated:YES];
                        
                        
                    }
                }];
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];

        }
        
        
    }];
}


- (void)mailBtnClick{

    [self requestData];
    
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
