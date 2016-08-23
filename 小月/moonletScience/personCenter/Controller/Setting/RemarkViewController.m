//
//  RemarkViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "RemarkViewController.h"

@interface RemarkViewController ()<UITextFieldDelegate,UITextViewDelegate>

@property(nonatomic,strong)UITextField *PhoneF;
@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createContenView];
    [self createBGLine];
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
    title.text = @"添加备注";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanHuiBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
    /** 确定 */
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(WIDTH-70, 15, 60, 20);
    sureBtn.clipsToBounds = YES;
    sureBtn.adjustsImageWhenHighlighted = NO;
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:sureBtn];   
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sureBtnClick{
    
}

#pragma mark - 传说中的背景分割线
- (void)createBGLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(20, 71+HEIGHT/14-2, WIDTH-40, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(20, 71+HEIGHT/14*2-4, WIDTH-40, 2)];
    line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line2];
    
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(20, 70+HEIGHT/14*3+HEIGHT/7*2, WIDTH-40, 2)];
    line3.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line3];
}

#pragma mark - 内容视图
- (void)createContenView{
    NSArray *nameLab = @[@"备注名称",@"联系方式",@"简介描述(最多150字)"];
    for (int i = 0; i < 3; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 71+i*HEIGHT/14, WIDTH-20, HEIGHT/14)];
        lab.text = nameLab[i];
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:15];
        lab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:lab];
    }
    
    /** 备注名字 */
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2, 71, WIDTH/2-20, HEIGHT/14-2)];
    textF.placeholder = @"(最多6字)";
    textF.textAlignment = NSTextAlignmentRight;
    textF.delegate = self;
    [self.view addSubview:textF];
    
    /** 联系方式 */
    UITextField *PhoneF = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2, 71+HEIGHT/14-2, WIDTH/2-20, HEIGHT/14-2)];
    PhoneF.keyboardType = UIKeyboardTypeNumberPad;
    PhoneF.textAlignment = NSTextAlignmentRight;
    PhoneF.delegate = self;
    [self.view addSubview:PhoneF];

    /** 简介描述 */
    UITextView *desView = [[UITextView alloc]initWithFrame:CGRectMake(20, 70+HEIGHT/14*3, WIDTH-40, HEIGHT/7*2)];
    desView.delegate = self;
    [self.view addSubview:desView];

}


- (void) textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:self.PhoneF.text]) {
        [self checkTel:self.PhoneF.text];
    }
    
}

- (BOOL)checkTel:(NSString *)str{
    if ([str length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"手机号码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    
    //正则表达式
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,1,5-9])|(17[6-8]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号码" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    
    return YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""] && range.length > 0) {
        return YES;
    }else{
        if (textView.text.length - range.length + text.length) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"超出最大可输入长度" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            return NO;
        }else{
            return YES;
        }
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
