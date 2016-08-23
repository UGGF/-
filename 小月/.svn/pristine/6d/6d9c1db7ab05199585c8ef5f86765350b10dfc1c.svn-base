//
//  PostViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()<UITextFieldDelegate>

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self creatTextField];
    [self createNavBar];
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
    title.text = @"职务";
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
    
    //保存按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-50, 15, 40, 20);
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    saveBtn.clipsToBounds = YES;
    [saveBtn addTarget:self action:@selector(saveJobBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];
    
}


- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)saveJobBtnClick
{
    [self.view endEditing:YES];
    session *danli = [session getInstance];    
    [ZYHTTPRequest request:SETTING_PERSONINFO_URL(danli.token, @"job", self.textF.text) Completion:^(NSDictionary *dict) {
        NSLog(@"%@----%@",dict,danli.token);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}


- (void)creatTextField{
    self.textF = [[UITextField alloc]initWithFrame:CGRectMake(20, 90, WIDTH-40, 40)];
    self.textF.placeholder = @"  亲，有助于提升您的形象哦！";
    self.textF.textColor = TEXTCOLOR;
    self.textF.layer.borderColor = SLIVERYCOLOR.CGColor;
    self.textF.layer.borderWidth = 1;
    self.textF.layer.cornerRadius = 3;
    self.textF.delegate = self;
    self.textF.layer.masksToBounds =YES;
    [self.view addSubview:self.textF];
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@""] && range.length > 0) {
        return YES;
    }else{
        if (textField.text.length - range.length + string.length > 16) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"超出最大可输入长度" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
            return NO;
        }else{
            return YES;
        }
        
    }


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
