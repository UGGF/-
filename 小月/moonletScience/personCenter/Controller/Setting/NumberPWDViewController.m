//
//  NumberPWDViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/15.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "NumberPWDViewController.h"
#import "NumQuestionViewController.h"

@interface NumberPWDViewController ()
{
    NSArray *_numArr;
    UIButton *_numBtn;
    UIView *_cicView;
    UILabel *_inputLab;
    UILabel *labl;
}
@end

@implementation NumberPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.keyWordArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.keyWordStr = @"";
    self.AgainKeyWordArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.AgainKeyWordStr = @"";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatNumPwdView];
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
    title.text = @"设置数字密码";
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


#pragma mark - 数字密码视图
- (void)creatNumPwdView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    _inputLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-60, 110, 120, 20)];
    _inputLab.text = @"请输入6位数字密码";
    _inputLab.textColor = TEXTTINTCOLOR;
    _inputLab.font = [UIFont systemFontOfSize:12];
    _inputLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_inputLab];
    
    for (int i = 0; i < 6; i++) {
        _cicView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2-110+i*(20+20), 150, 20, 20)];
        _cicView.layer.cornerRadius = 10 ;
        _cicView.clipsToBounds = YES;
        _cicView.backgroundColor = WHITECOLOR;
        _cicView.layer.borderWidth = 1;
        _cicView.layer.borderColor = TEXTTINTCOLOR.CGColor;
        _cicView.layer.masksToBounds =YES;
        _cicView.tag = i + 2000;
        [self.view addSubview:_cicView];
        
        [self.keyWordArray addObject:_cicView];
        
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(30, HEIGHT/2, WIDTH-60, 160)];
    bgView.layer.cornerRadius =  0;
    bgView.clipsToBounds = YES;
    bgView.backgroundColor = WHITECOLOR;
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = TEXTTINTCOLOR.CGColor;
    bgView.layer.masksToBounds =YES;
    [self.view addSubview:bgView];

    
    _numArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"C",@"0",@"X"];
    for (int i = 0; i < 12; i++) {
        _numBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _numBtn.frame = CGRectMake((i%3)*((WIDTH-60)/3), i/3*40, (WIDTH-60)/3, 40);
        _numBtn.backgroundColor = WHITECOLOR;
        //    unBindBtn.alpha = 0.7;
        _numBtn.layer.cornerRadius = 3;
        _numBtn.clipsToBounds = YES;
        _numBtn.tag = 3000 + i;
        _numBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
        _numBtn.layer.borderWidth = 0.5;
        _numBtn.layer.masksToBounds = YES;
        _numBtn.adjustsImageWhenHighlighted = NO;
        [_numBtn setTitle:_numArr[i] forState:UIControlStateNormal];
        [_numBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        _numBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_numBtn addTarget:self action:@selector(numBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:_numBtn];

    }
    
    UILabel *remindLab = [[UILabel alloc]initWithFrame:CGRectMake(10, HEIGHT-80, WIDTH-20, 50)];
    remindLab.text = @"数字密码可以保障您的设备安全，防止他人恶意篡改您的设备数据和权限。当您的手机无法接收验证码时，可以使用此处设定的数字密码来重新绑定手机。";
    remindLab.numberOfLines = 0;
    remindLab.textColor = TEXTTINTCOLOR;
    remindLab.font = [UIFont systemFontOfSize:12];
    //    lab.textAlignment = NSTextAlignmentCenter;
    remindLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:remindLab];

}

//坑爹 坑死爹爹啦
- (void)numBtnClick:(UIButton *)sender{
    
    if (sender.tag - 3000 != 9 && sender.tag - 3000 != 11 && _keyWordStr.length < 6) {
        self.keyWordStr = [NSString stringWithFormat:@"%@%@",self.keyWordStr,sender.titleLabel.text];
        NSLog(@"keyWordStr  是 %@",_keyWordStr);
        UIView * view = self.keyWordArray[self.keyWordStr.length - 1];
        view.backgroundColor = CAOGREENCOLOR;

    }else if (sender.tag - 3000 == 9 && _keyWordStr.length > 0)
    {
        NSString *aString = [_keyWordStr substringToIndex:[_keyWordStr length]-1];
        _keyWordStr = aString;
        UIView *view = _keyWordArray[_keyWordStr.length];
        view.backgroundColor = WHITECOLOR;
        
    }else if (sender.tag - 3000 == 11)
    {
        self.keyWordStr = @"";
        for (UIView *view in self.keyWordArray) {
            view.backgroundColor = WHITECOLOR;
        }
    }
    
    if (_keyWordStr.length == 6) {
        [self createOtnerView];
    }
    
    
    
//    
//    if (_keyWordStr.length == 6) {
//        static int i = 0;
//        i++;
//        if (i == 1) {
//            _inputLab.text = @"请再次输入数字密码";
//            self.keyWordStr = @"";
//            for (UIView *view in self.keyWordArray) {
//                view.backgroundColor = WHITECOLOR;
//            }
//            self.AgainKeyWordStr = self.keyWordStr;
//            NSLog(@"%@",_AgainKeyWordStr);
//        }else
//        {
//            i = 1;
//        }
//    }
}




- (void)createOtnerView{
    UIView *otherView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, WIDTH, HEIGHT/2+90)];
    otherView.backgroundColor = WHITECOLOR;
    [self.view addSubview:otherView];

    labl = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, WIDTH, 20)];
    labl.text = @"请再次输入数字密码";
    labl.textColor = TEXTTINTCOLOR;
    labl.font = [UIFont systemFontOfSize:12];
    labl.textAlignment = NSTextAlignmentCenter;
    [otherView addSubview:labl];
    
    for (int i = 0; i < 6; i++) {
        UIView *vie = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2-110+i*(20+20), 75, 20, 20)];
        vie.layer.cornerRadius = 10 ;
        vie.clipsToBounds = YES;
        vie.backgroundColor = WHITECOLOR;
        vie.layer.borderWidth = 1;
        vie.layer.borderColor = TEXTTINTCOLOR.CGColor;
        vie.layer.masksToBounds =YES;
        vie.tag = i + 2000;
        [otherView addSubview:vie];
        
        [self.AgainKeyWordArray addObject:vie];
        
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(30, HEIGHT/2-75, WIDTH-60, 160)];
    bgView.layer.cornerRadius =  0;
    bgView.clipsToBounds = YES;
    bgView.backgroundColor = WHITECOLOR;
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = TEXTTINTCOLOR.CGColor;
    bgView.layer.masksToBounds =YES;
    [otherView addSubview:bgView];
    
    
    NSArray *arra = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"C",@"0",@"X"];
    for (int i = 0; i < 12; i++) {
        UIButton *yueBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        yueBtn.frame = CGRectMake((i%3)*((WIDTH-60)/3), i/3*40, (WIDTH-60)/3, 40);
        yueBtn.backgroundColor = WHITECOLOR;
        //    unBindBtn.alpha = 0.7;
        yueBtn.layer.cornerRadius = 3;
        yueBtn.clipsToBounds = YES;
        yueBtn.tag = 3000 + i;
        yueBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
        yueBtn.layer.borderWidth = 0.5;
        yueBtn.layer.masksToBounds = YES;
        yueBtn.adjustsImageWhenHighlighted = NO;
        [yueBtn setTitle:arra[i] forState:UIControlStateNormal];
        [yueBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        yueBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [yueBtn addTarget:self action:@selector(yueBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:yueBtn];
        
    }
    
}

- (void)yueBtnClick:(UIButton *)sender{
    if (sender.tag - 3000 != 9 && sender.tag - 3000 != 11 && _AgainKeyWordStr.length < 6) {
        self.AgainKeyWordStr = [NSString stringWithFormat:@"%@%@",self.AgainKeyWordStr,sender.titleLabel.text];
        NSLog(@"againkeyWordStr  是 %@",_AgainKeyWordStr);
        UIView * view = self.AgainKeyWordArray[self.AgainKeyWordStr.length - 1];
        view.backgroundColor = CAOGREENCOLOR;
        
    }else if (sender.tag - 3000 == 9 && _AgainKeyWordStr.length > 0)
    {
        NSString *aString = [_AgainKeyWordStr substringToIndex:[_AgainKeyWordStr length]-1];
        _AgainKeyWordStr = aString;
        UIView *view = _AgainKeyWordArray[_AgainKeyWordStr.length];
        view.backgroundColor = WHITECOLOR;
        
    }else if (sender.tag - 3000 == 11)
    {
        self.AgainKeyWordStr = @"";
        for (UIView *view in self.AgainKeyWordArray) {
            view.backgroundColor = WHITECOLOR;
        }
    }
    
    if (_AgainKeyWordStr.length == 6) {
        NSLog(@"1 %@",_keyWordStr);
        NSLog(@"2 %@",_AgainKeyWordStr);
        if ([_AgainKeyWordStr isEqualToString: _keyWordStr]) {
            
            NumQuestionViewController *question = [[NumQuestionViewController alloc]init];
            [self.navigationController pushViewController:question animated:YES];
        }else{
            labl.text = @"两次输入数字密码不同,请重新输入";
            labl.textColor = REDCOLOR;
            self.AgainKeyWordStr = @"";
            for (UIView *view in self.AgainKeyWordArray) {
                view.backgroundColor = WHITECOLOR;
            }
            
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
