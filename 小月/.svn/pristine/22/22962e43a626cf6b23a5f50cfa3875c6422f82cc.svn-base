//
//  DescriptionReportViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "DescriptionReportViewController.h"

@interface DescriptionReportViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextView *message;
@end

@implementation DescriptionReportViewController

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
    title.text = @"举报";
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


#pragma mark - 举报内容描述视图
- (void)createContentView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 72, WIDTH-40, HEIGHT/14)];
    lab.text = @"举报描述(50字以内)";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];

    self.message = [[UITextView alloc]initWithFrame:CGRectMake(20, 72+HEIGHT/14, WIDTH-40, HEIGHT/7)];
     self.message.textColor = TEXTCOLOR;
     self.message.font = [UIFont systemFontOfSize:12];
     self.message.layer.borderWidth = 1.2;
     self.message.layer.borderColor = SLIVERYCOLOR.CGColor;
     self.message.layer.masksToBounds = YES;
    [self.view addSubview: self.message];
    
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(20, 72+HEIGHT/14+HEIGHT/7+20, WIDTH-40, 40);
    commitBtn.backgroundColor = CAOGREENCOLOR;
    commitBtn.layer.cornerRadius = 3;
    commitBtn.clipsToBounds = YES;
    commitBtn.adjustsImageWhenHighlighted = NO;
    [commitBtn setTitle:@"提     交" forState:UIControlStateNormal];
    [commitBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    commitBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//        [commitBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];

}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""] && range.length > 0) {
        return YES;
    }else{
        if (textView.text.length - range.length + text.length > 100) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"超出最大可输入限制" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            return NO;

        }else{
            return YES;
        }
       
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:self.message.text]) {
        [self messaeCheck:self.message.text];
    }
}

- (BOOL)messaeCheck:(NSString *)str{
    if ([str length] > 50) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"超出最大可输入限制" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    }else{
        return YES;
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
