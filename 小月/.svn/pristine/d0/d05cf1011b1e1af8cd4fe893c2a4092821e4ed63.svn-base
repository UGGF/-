//
//  TestPhoneViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "TestPhoneViewController.h"
#import "BindingNewNumController.h"

@interface TestPhoneViewController ()<UITextFieldDelegate>
{
    UIView *_bindView;
    NSTimer *_timer;
    UITextField *_check;
}

@end

@implementation TestPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatTextfieldView];
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
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 100 , 10, 200, 30)];
    title.text = @"原手机号验证";
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
    saveBtn.frame = CGRectMake(WIDTH-50, 0, 40,50);
    [saveBtn setTitle:@"完成" forState:UIControlStateNormal];
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


- (void)creatTextfieldView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(20, 20+70, WIDTH-40, 40)];
    cicView.layer.cornerRadius = 2 ;
    cicView.clipsToBounds = YES;
    cicView.layer.borderWidth = 1;
    cicView.layer.borderColor = SLIVERYCOLOR.CGColor;
    cicView.layer.masksToBounds =YES;
    [self.view addSubview:cicView];

    _num = [[UITextField alloc]initWithFrame:CGRectMake(10, 0 , WIDTH-60, 40)];
    _num.placeholder = @"请输入手机号";
    _num.keyboardType = UIKeyboardTypeNumberPad;
    _num.delegate = self;
    _num.font = [UIFont systemFontOfSize:15];
    [cicView addSubview:_num];
    
    UIView *cicView1 = [[UIView alloc]initWithFrame:CGRectMake(20, 20+40+70+5, WIDTH/2+30-40, 40)];
    cicView1.layer.cornerRadius = 2 ;
    cicView1.clipsToBounds = YES;
    cicView1.layer.borderWidth = 1;
    cicView1.layer.borderColor = SLIVERYCOLOR.CGColor;
    cicView1.layer.masksToBounds =YES;
    [self.view addSubview:cicView1];

    
    _check = [[UITextField alloc]initWithFrame:CGRectMake(10,0, WIDTH/2+30-60, 40)];
    _check.placeholder = @"输入验证码";
    _check.delegate = self;
    _check.keyboardType = UIKeyboardTypeNumberPad;
    _check.font = [UIFont systemFontOfSize:15];
    [cicView1 addSubview:_check];
   
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//    [self.view addGestureRecognizer:tap];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH/2+30-40+20+5, 65+70, WIDTH/2-35, 40);
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    btn.backgroundColor = CAOGREENCOLOR;
    btn.layer.cornerRadius = 3;
    btn.clipsToBounds = YES;
    [btn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *botLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+70+40+10, WIDTH, 20)];
    botLab.numberOfLines = 0;
    botLab.textColor = TEXTTINTCOLOR;
    botLab.font = [UIFont systemFontOfSize:10];
    botLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:botLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"如无法自助完成，请至反馈申诉提交诉求内容"];
    NSRange range1 = [[botString string]rangeOfString:@"反馈申诉"];
    [botString addAttribute:NSForegroundColorAttributeName value:CAOGREENCOLOR range:range1];
    botLab.attributedText = botString;
}

//- (void)tapClick:(UIGestureRecognizer *)sender{
//    if (sender.numberOfTouches == 1) {
//        [_num resignFirstResponder];
//        [_check resignFirstResponder];
//    }
//}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)btnClick{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    _myview = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2+30-40+20+5, 65+70, WIDTH/2-35, 40)];
    _myview.backgroundColor = CAOGREENCOLOR;
    _myview.layer.cornerRadius = 3;
    _myview.clipsToBounds = YES;
    [self.view addSubview:_myview];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2-35, 40)];
    _lab.font = [UIFont systemFontOfSize:15];
    _lab.text = @"已发至手机(60s)";
    _lab.layer.cornerRadius = 3;
    _lab.clipsToBounds = YES;
    _lab.textColor = WHITECOLOR;
    _lab.textAlignment = NSTextAlignmentCenter;
    [_myview addSubview:_lab];
    
    time = 0;
    
    session *danli = [session getInstance];
    [ZYHTTPRequest request:SMSSEND_URL(danli.token,_num.text) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        int stat = [[dict objectForKey:@"code"] intValue];
        if (stat == 200) {
            
        }
  
    }];
}

- (void)changeTime{
    time++;
    int value = 60 - time;
    if (value >= 0) {
        self.lab.text = [NSString stringWithFormat:@"已发至手机(%ds)",value];
    }else{
        [self.timer invalidate];
        [self.myview removeFromSuperview];
    }
    
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    if ([string isEqualToString:@""] && range.length > 0) {
//        return YES;
//    }else{
//        if (textField.text.length - range.length + string.length >11 ) {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"超出可输入最大长度" message:nil preferredStyle:UIAlertControllerStyleAlert];
//            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
//            [self presentViewController:alert animated:true completion:nil];
//            return NO;
//        }else{
//            return YES;
//        }
//    }
//}


- (void) textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:_num.text]) {
        [self checkTel:_num.text];
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


- (void)saveBtnClick{

    session *danli = [session getInstance];
    [ZYHTTPRequest request:PHONENUMCHANGE_URL(danli.token, _check.text) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        int stat = [[dict objectForKey:@"code"] intValue];
        if (stat == 200) {
            BindingNewNumController *new = [[BindingNewNumController alloc]init];
            [self.navigationController pushViewController:new animated:YES];
            
        }else{
            _bindView = [[UIView alloc]initWithFrame:CGRectMake(20, 10+70, WIDTH-40, 40)];
            _bindView.backgroundColor = TEXTCOLOR;
            _bindView.alpha = 0.7;
            [self.view addSubview:_bindView];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH-40, 40)];
            lab.text = @"验证码错误，请输入或用其它方式验证!";
            lab.font = [UIFont systemFontOfSize:12];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.textColor = WHITECOLOR;
            [_bindView addSubview:lab];
            
            _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(disapearView) userInfo:nil repeats:YES];
        
        }
    
    }];

    
}

- (void)disapearView{
    [_timer invalidate];
    [_bindView removeFromSuperview];
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
