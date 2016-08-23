//
//  ComplainViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ComplainViewController.h"

@interface ComplainViewController ()<UITextViewDelegate>

@property(nonatomic,strong)UITextView *textV;
@property(nonatomic,strong)UILabel *PLlab;

@end

@implementation ComplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createContentView];
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
    saveBtn.frame = CGRectMake(WIDTH-50, 0, 40, 50);
    [saveBtn setTitle:@"提交" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
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
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 70+5, 120, 30)];
//    lab.backgroundColor = REDCOLOR;
    lab.text = @"问题详情";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
//    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];

    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 110, WIDTH, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    self.textV = [[UITextView alloc]initWithFrame:CGRectMake(10, 115, WIDTH-20, 140)];
    self.textV.font = [UIFont systemFontOfSize:16];
    self.textV.delegate = self;
    self.textV.textColor = TEXTCOLOR;
    [self.view addSubview:self.textV];
    
    self.PLlab = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, WIDTH, 40)];
    self.PLlab.text = @"请描述你遇到的问题，我们会仔细聆听";
    self.PLlab.font = [UIFont systemFontOfSize:14];
    self.PLlab.textColor = TEXTTINTCOLOR;
    [self.textV addSubview:self.PLlab];
    
    
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
    TF.placeholder = @"电子邮箱、手机号或QQ";
    UIView *left = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    TF.leftView = left;
    TF.leftViewMode = UITextFieldViewModeAlways;
    TF.textColor = TEXTCOLOR;
    TF.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:TF];
    
    UIView *line5 = [[UIView alloc]initWithFrame:CGRectMake(0, 345, WIDTH, 2)];
    line5.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line5];
    
    UILabel *botLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 355, WIDTH-10, 20)];
    botLab.textColor = TEXTTINTCOLOR;
    botLab.font = [UIFont systemFontOfSize:12];
    botLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:botLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"如无法自主完成，请求助客服4008-8001-4004"];
    NSRange range1 = [[botString string]rangeOfString:@"4008-8001-4004"];
    [botString addAttribute:NSForegroundColorAttributeName value:CAOGREENCOLOR range:range1];
    botLab.attributedText = botString;
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.PLlab.hidden = YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    if (self.textV.text.length > 0) {
        self.PLlab.hidden = YES;
    }else{
        self.PLlab.hidden = NO;
    }
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
