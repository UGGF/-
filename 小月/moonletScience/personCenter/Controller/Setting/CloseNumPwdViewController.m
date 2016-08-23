//
//  CloseNumPwdViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/27.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "CloseNumPwdViewController.h"
#import "BindingAccountViewController.h"
#import "NumQuestionViewController.h"

@interface CloseNumPwdViewController ()
{
    NSArray *_numArr;
    UIButton *_numBtn;
    UIView *_cicView;
    UILabel *_inputLab;
    UILabel *labl;
}
@end

@implementation CloseNumPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.keyWordArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.keyWordStr = @"";
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
    title.text = @"关闭数字密码";
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
    
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame = CGRectMake(WIDTH/2-30, 200, 60, 20);
    forgetBtn.clipsToBounds = YES;
    forgetBtn.adjustsImageWhenHighlighted = NO;
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];

    
    
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
    
    UILabel *botLab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT-70, WIDTH-40, 20)];
    botLab.numberOfLines = 0;
    botLab.textColor = TEXTTINTCOLOR;
    botLab.font = [UIFont systemFontOfSize:12];
    botLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:botLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"如无法自助完成,请至反馈申诉提交诉求内容"];
    NSRange range1 = [[botString string]rangeOfString:@"反馈申诉"];
    [botString addAttribute:NSForegroundColorAttributeName value:CAOGREENCOLOR range:range1];
    
    
    botLab.attributedText = botString;
    
    
}

- (void)forgetBtnClick{
    NumQuestionViewController *num = [[NumQuestionViewController alloc]init];
    [self.navigationController pushViewController:num animated:YES];
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
        NSArray *viewControllerArray = [self.navigationController viewControllers];
        [self.navigationController popToViewController:viewControllerArray[viewControllerArray.count - 3] animated:YES];
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
