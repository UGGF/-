//
//  BackPayViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/7/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "BackPayViewController.h"

@interface BackPayViewController ()<UITextViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong)UILabel *backPay ;
@property(nonatomic,strong)UILabel *monPay;
@property(nonatomic,strong)UITextView *showF;
@property(nonatomic,strong)UILabel *tempLab;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *PopView;
@end

@implementation BackPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createContentView];
    [self createCommit];
}


#pragma mark - 修改状态栏的简便方法
-(void)createNavBar
{
    //状态栏设置
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    statusBarView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏背景
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navBar];
    
    //导航信息
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"退款";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航栏返回按钮
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:fanHuiBtn];
    
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - 内容视图
- (void)createContentView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT-72)];
    cicView.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:cicView];

    //退款原因
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, WIDTH-20, 20)];
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"退款原因*"];
    NSRange range1 = [[botString string]rangeOfString:@"*"];
    [botString addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range1];
    lab.attributedText = botString;
    
    self.backPay = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, WIDTH-40, 40)];
    self.backPay.backgroundColor = WHITECOLOR;
    self.backPay.textColor = TEXTTINTCOLOR;
    self.backPay.text = @"退款原因";
    self.backPay.font = [UIFont systemFontOfSize:16];
    self.backPay.textAlignment = NSTextAlignmentLeft;
    self.backPay.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.backPay.layer.shadowOffset = CGSizeMake(1.5,1.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.backPay.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.backPay.layer.shadowRadius = 3;//阴影半径，默认3
    [cicView addSubview:self.backPay];
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.firstLineHeadIndent = 10;
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString: self.backPay.text attributes:@{ NSParagraphStyleAttributeName : style}];
    self.backPay.attributedText = attrText;
    
    UIButton *unPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unPayBtn.frame = CGRectMake(20, 50, WIDTH-40, 40);
    unPayBtn.backgroundColor = [UIColor clearColor];;
    unPayBtn.layer.cornerRadius = 3;
    unPayBtn.adjustsImageWhenHighlighted = NO;
    [unPayBtn addTarget:self action:@selector(unPayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:unPayBtn];

    
    //退款金额
    UILabel *MonLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 110, WIDTH-20, 20)];
    MonLab.textColor = TEXTCOLOR;
    MonLab.font = [UIFont systemFontOfSize:16];
    MonLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:MonLab];
    
    NSMutableAttributedString *MonString = [[NSMutableAttributedString alloc]initWithString:@"退款金额*不可修改"];
    NSRange range2 = [[MonString string]rangeOfString:@"*"];
    [MonString addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range2];
    NSRange range3 = [[MonString string]rangeOfString:@"不可修改"];
    [MonString addAttribute:NSForegroundColorAttributeName value:TEXTTINTCOLOR range:range3];
    [MonString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range3];
    MonLab.attributedText = MonString;
    
    self.monPay = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, WIDTH-40, 40)];
    self.monPay.backgroundColor = WHITECOLOR;
    self.monPay.textColor = TEXTTINTCOLOR;
    self.monPay.font = [UIFont systemFontOfSize:16];
    self.monPay.textAlignment = NSTextAlignmentLeft;
    self.monPay.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.monPay.layer.shadowOffset = CGSizeMake(1.5,1.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.monPay.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.monPay.layer.shadowRadius = 3;//阴影半径，默认3
    [cicView addSubview:self.monPay];
    
    NSMutableParagraphStyle *style1= [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style1.firstLineHeadIndent = 10;
    NSAttributedString *attrText1 = [[NSAttributedString alloc] initWithString: @"19.8" attributes:@{ NSParagraphStyleAttributeName : style1}];
    self.monPay.attributedText = attrText1;

    //退款说明
    UILabel *ShowLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 200, WIDTH-20, 20)];
    ShowLab.textColor = TEXTCOLOR;
    ShowLab.font = [UIFont systemFontOfSize:16];
    ShowLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:ShowLab];
    
    NSMutableAttributedString *ShowString = [[NSMutableAttributedString alloc]initWithString:@"退款说明 (可不填)"];
    NSRange rang = [[ShowString string]rangeOfString:@"(可不填)"];
    [ShowString addAttribute:NSForegroundColorAttributeName value:TEXTTINTCOLOR range:rang];
    [ShowString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:rang];
    ShowLab.attributedText = ShowString;
    
    self.showF = [[UITextView alloc]initWithFrame:CGRectMake(20, 230, WIDTH-40, 40)];
    self.showF.textColor = TEXTCOLOR;
    self.showF.delegate = self;
    self.showF.font = [UIFont systemFontOfSize:16];
    self.showF.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.showF.layer.shadowOffset = CGSizeMake(1.5,1.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.showF.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.showF.layer.shadowRadius = 3;//阴影半径，默认3
    [cicView addSubview:self.showF];
    
    self.tempLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, WIDTH-40, 40)];
    self.tempLab.text = @"请输入退款说明";
    self.tempLab.textColor = TEXTTINTCOLOR;
    self.tempLab.font = [UIFont systemFontOfSize:16];
    [self.showF addSubview:self.tempLab];

}

- (void)unPayBtnClick{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:self.bgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.delegate = self;
    [self.bgView addGestureRecognizer:tap];
    
    self.PopView = [[UIView alloc]initWithFrame:CGRectMake(40, HEIGHT/6, WIDTH-80, HEIGHT/1.7)];    self.PopView.backgroundColor = WHITECOLOR;
    self.PopView.layer.cornerRadius = 3;
    [self.bgView addSubview:self.PopView];
    
    NSArray *arr = @[@"七天无理由退货",@"质量问题",@"发票问题",@"未按约定时间发货",@"其他问题"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *warnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        warnBtn.frame = CGRectMake(20, 40+i*(HEIGHT/13+15), WIDTH-80-40, HEIGHT/13);
        warnBtn.layer.cornerRadius = 3;
        warnBtn.clipsToBounds = YES;
        warnBtn.tag = i+1992;
        warnBtn.adjustsImageWhenHighlighted = NO;
        warnBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
        warnBtn.layer.borderWidth = 1.2;
        warnBtn.layer.masksToBounds = YES;
        [warnBtn setTitle:arr[i] forState:UIControlStateNormal];
        [warnBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        warnBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [warnBtn addTarget:self action:@selector(warnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.PopView addSubview:warnBtn];
    }
    
}

- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired== 1) {
        [_bgView removeFromSuperview];
    }
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
    [UIView animateWithDuration:0.5 animations:^{
        self.tempLab.hidden = YES;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    if (self.showF.text.length > 0) {
        self.tempLab.hidden = YES;
    }else{
        self.tempLab.hidden =  NO;
    }
}



- (void)warnBtnClick:(UIButton *)sender{
    self.backPay.text = sender.currentTitle;
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.firstLineHeadIndent = 10;
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString: self.backPay.text attributes:@{ NSParagraphStyleAttributeName : style}];
    self.backPay.attributedText = attrText;
    
    [self.bgView removeFromSuperview];
}



#pragma mark - 提交申请
- (void)createCommit{
    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(0, HEIGHT-50, WIDTH, 50);
    unBindBtn.backgroundColor = REDCOLOR;
    unBindBtn.layer.cornerRadius = 1;
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [unBindBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    [unBindBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:unBindBtn];
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
