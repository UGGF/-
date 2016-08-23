//
//  ComplainViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ComplainViewController.h"

@interface ComplainViewController ()

@end

@implementation ComplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createContentView];
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
    title.text = @"反馈申诉";
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
    [saveBtn setTitle:@"提交" forState:UIControlStateNormal];
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

- (void)saveBtnClick{

}

#pragma mark - 内容视图
- (void)createContentView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 70+5, 60, 30)];
//    lab.backgroundColor = REDCOLOR;
    lab.text = @"问题详情";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
//    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];

    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 110, WIDTH, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    UITextView *textV = [[UITextView alloc]initWithFrame:CGRectMake(0, 115, WIDTH, 140)];
    textV.text = @"  请描述你遇到的问题，我们会仔细聆听";
//    textV.backgroundColor = REDCOLOR;
    textV.textColor = TEXTTINTCOLOR;
    [self.view addSubview:textV];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 260, WIDTH, 2)];
    line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line2];
    
    UILabel *nlab = [[UILabel alloc]initWithFrame:CGRectMake(15, 265, 60, 30)];
    //    lab.backgroundColor = REDCOLOR;
    nlab.text = @"联系方式";
    nlab.textColor = TEXTCOLOR;
    nlab.font = [UIFont systemFontOfSize:15];
    //    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nlab];
    
    UIView *line4 = [[UIView alloc]initWithFrame:CGRectMake(0, 300, WIDTH, 2)];
    line4.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line4];
    
    UITextField *TF = [[UITextField alloc]initWithFrame:CGRectMake(10, 310, WIDTH, 30)];
    TF.placeholder = @" 电子邮箱、手机号或QQ";
    TF.textColor = TEXTCOLOR;
    TF.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:TF];
    
    UIView *line5 = [[UIView alloc]initWithFrame:CGRectMake(0, 345, WIDTH, 2)];
    line5.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line5];
    
    UILabel *lab7 = [[UILabel alloc]initWithFrame:CGRectMake(10, 355, WIDTH-10, 20)];
    lab7.text = @"如无法自主完成，请求助客服";
    lab7.textColor = TEXTTINTCOLOR;
    lab7.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:lab7];
    
    UILabel *lab8 = [[UILabel alloc]initWithFrame:CGRectMake(140, 355, 120, 20)];
    lab8.text = @"4008-8001-4004";
    lab8.textColor = CAOGREENCOLOR;
    lab8.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:lab8];
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
