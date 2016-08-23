//
//  TestMailViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "TestMailViewController.h"
#import "SendMailViewController.h"

@interface TestMailViewController ()

@end

@implementation TestMailViewController

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
    UITextField *Tf = [[UITextField alloc]initWithFrame:CGRectMake(20, 90, WIDTH-40, 40)];
    Tf.placeholder = @"请输入验证邮箱";
    Tf.layer.borderWidth = 2;
    Tf.layer.borderColor = SLIVERYCOLOR.CGColor;
    Tf.layer.cornerRadius = 3;
    Tf.layer.masksToBounds = YES;
    UIView *left = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    Tf.leftView = left;
    Tf.leftViewMode = UITextFieldViewModeAlways;
    Tf.textColor = TEXTCOLOR;
    Tf.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:Tf];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIButton *mailBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 170, WIDTH-40, 40)];
    mailBtn.backgroundColor = CAOGREENCOLOR;
    [mailBtn setTitle:@"发送验证邮件" forState:UIControlStateNormal];
    [mailBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    mailBtn.layer.cornerRadius = 3;
    mailBtn.clipsToBounds = YES;
    mailBtn.adjustsImageWhenHighlighted = NO;
    [mailBtn addTarget:self action:@selector(mailBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mailBtn];
    
    UILabel *botLab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT-70, WIDTH, 20)];
    botLab.numberOfLines = 0;
    botLab.textColor = TEXTTINTCOLOR;
    botLab.font = [UIFont systemFontOfSize:12];
    botLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:botLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"如无法自助完成，请至反馈申诉提交诉求内容"];
    NSRange range1 = [[botString string]rangeOfString:@"反馈申诉"];
    [botString addAttribute:NSForegroundColorAttributeName value:CAOGREENCOLOR range:range1];
    botLab.attributedText = botString;
}

- (void)mailBtnClick{
    SendMailViewController *send = [[SendMailViewController alloc]init];
    [self.navigationController pushViewController:send animated:YES];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
