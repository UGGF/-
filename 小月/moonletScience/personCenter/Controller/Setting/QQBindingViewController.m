//
//  QQBindingViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "QQBindingViewController.h"

@interface QQBindingViewController ()

@end

@implementation QQBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createQQ];
    
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
    title.text = @"QQ已绑定";
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


#pragma mark - QQ绑定视图
- (void)createQQ{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIButton *imaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imaBtn.frame = CGRectMake(WIDTH/2-60, 70+60, 121, 121);
    imaBtn.backgroundColor = TEXTTINTCOLOR;
//    unBindBtn.alpha = 0.7;
    imaBtn.layer.cornerRadius = 60;
    imaBtn.clipsToBounds = YES;
    [imaBtn setImage:[UIImage imageNamed:@"qq_binding.png"] forState:UIControlStateNormal];
    imaBtn.adjustsImageWhenHighlighted = NO;
//    [unBindBtn setTitle:@"解绑邮箱" forState:UIControlStateNormal];
//    [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
//    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//    [unBindBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:imaBtn];

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 301, WIDTH/2-10, 20)];
    lab.text = @"绑定的QQ:";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    //    lab.textAlignment = NSTextAlignmentCenter;
    lab.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:lab];
    
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2+5, 301, WIDTH/2-10, 20)];
    numLab.text = @"97278292";
    numLab.textColor = TEXTCOLOR;
    numLab.font = [UIFont systemFontOfSize:15];
    //    lab.textAlignment = NSTextAlignmentCenter;
//    numLab.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:numLab];

    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(20, 381, WIDTH-40, 40);
    //    unBindBtn.frame = CGRectMake(WIDTH/2-60, 70+60, 121, 121);
    unBindBtn.backgroundColor = TEXTTINTCOLOR;
    unBindBtn.alpha = 0.7;
    unBindBtn.layer.cornerRadius = 3;
    unBindBtn.clipsToBounds = YES;
//    [unBindBtn setImage:[UIImage imageNamed:@"qq_binding.png"] forState:UIControlStateNormal];
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [unBindBtn setTitle:@"解绑QQ" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [unBindBtn addTarget:self action:@selector(unBindBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:unBindBtn];
    
    UILabel *PromptLab = [[UILabel alloc]initWithFrame:CGRectMake(10, HEIGHT-80, WIDTH-10, 50)];
    PromptLab.text = @"绑定QQ可以保障您的账户安全，当您手机账号无法登陆时，可通过此处绑定的QQ实现第三方登录进入绑定账户。";
    PromptLab.textColor = TEXTTINTCOLOR;
    PromptLab.numberOfLines = 0;
    PromptLab.font = [UIFont systemFontOfSize:12];
    //    lab.textAlignment = NSTextAlignmentCenter;
    PromptLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:PromptLab];

}

- (void)unBindBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"解绑QQ将对您的账户安全产生隐患\n确定解绑吗？" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        [self.navigationController popViewControllerAnimated:YES];

    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
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
