//
//  ThirdChangePwdViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/22.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ThirdChangePwdViewController.h"
#import "BindingNumberViewController.h"

@interface ThirdChangePwdViewController ()

@end

@implementation ThirdChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createChangePwdView];
    [self createBgLineView];
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
    title.text = @"修改密码";
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
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 我是传说中的背景分割线
- (void)createBgLineView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
}


#pragma mark - 创建修改密码内容视图
- (void)createChangePwdView{
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(20, 130, WIDTH-40, 120)];
    cicView.layer.cornerRadius = 3 ;
    cicView.clipsToBounds = YES;
    cicView.backgroundColor = WHITECOLOR;
    cicView.layer.borderWidth = 2;
    cicView.layer.borderColor = SLIVERYCOLOR.CGColor;
    cicView.layer.masksToBounds =YES;
    [self.view addSubview:cicView];

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, WIDTH-60, 100)];
    lab.numberOfLines = 0;
    lab.text = @"检测到您正使用      账号登录小月只能智能枕，再次无法修改密码。建议您绑定一个手机号，可以使用该手机号登录，并对其密码进行设置。";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];
    
    UILabel *QQLab = [[UILabel alloc]initWithFrame:CGRectMake(115, 13, 30, 20)];
    QQLab.text = @"QQ";
    QQLab.textColor = TEXTCOLOR;
    QQLab.font = [UIFont systemFontOfSize:15];
    QQLab.textAlignment = NSTextAlignmentLeft;
    QQLab.textColor = CAOGREENCOLOR;
    [cicView addSubview:QQLab];
    
    UIButton *goBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goBindBtn.frame = CGRectMake( 20, HEIGHT/2, WIDTH-40, 40);
    goBindBtn.backgroundColor = CAOGREENCOLOR;
    goBindBtn.layer.cornerRadius = 3;
    goBindBtn.clipsToBounds = YES;
    goBindBtn.adjustsImageWhenHighlighted = NO;
    [goBindBtn setTitle:@"立即绑定手机" forState:UIControlStateNormal];
    [goBindBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    goBindBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [goBindBtn addTarget:self action:@selector(goBindBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBindBtn];
}

- (void)goBindBtnClick{
    BindingNumberViewController *bind = [[BindingNumberViewController alloc]init];
    [self.navigationController pushViewController:bind animated:YES];

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
