//
//  FixRemarkViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "FixRemarkViewController.h"

@interface FixRemarkViewController ()<UITextViewDelegate,UITextFieldDelegate>

@end

@implementation FixRemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self creatUI];
    [self requestMyGroup];
}

-(void)requestMyGroup
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:FINDALLGROUP(danLi.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        self.groupNameArray = [dict objectForKey:@"data"];
    }];
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
    title.text = @"添加备注";
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
    
    //确定按钮
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(WIDTH-50, 5, 40, 40);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    sureBtn.layer.cornerRadius = 1;
    sureBtn.clipsToBounds = YES;
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:sureBtn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [navBar addSubview:lineView];
    
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sureBtnClick{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:UPDATE_RELATION(danLi.token, self.relationId, self.remarkText.text, self.phoneText.text, self.relationShipTF.text, self.decText.text, self.groupId) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        [self.navigationController popViewControllerAnimated:YES];
    }];

}


- (void)creatUI{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 208)];
    backView.backgroundColor = LINECOLOR;
    [self.view addSubview:backView];
    
    //备注名称
    UIView *remarkView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 39)];
    remarkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:remarkView];
    UILabel *remarkLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 20)];
    remarkLable.text = @"备注名称";
    remarkLable.textColor = TEXTCOLOR;
    remarkLable.font = [UIFont systemFontOfSize:16];
    [remarkView addSubview:remarkLable];
    
    self.remarkText = [[UITextField alloc]initWithFrame:CGRectMake(90, 10, WIDTH - 100, 20)];
    self.remarkText.placeholder = @"(最多6字)";
    self.remarkText.textAlignment = NSTextAlignmentRight;
    self.remarkText.delegate = self;
    self.remarkText.font = [UIFont systemFontOfSize:16];
    [remarkView addSubview:self.remarkText];
    
    UIView *relationShipBG = [[UIView alloc]initWithFrame:CGRectMake(0, 110, WIDTH, 39)];
    relationShipBG.backgroundColor = WHITECOLOR;
    [self.view addSubview:relationShipBG];
    
    UILabel *relationShipLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 20)];
    relationShipLB.text = @"备注名称";
    relationShipLB.textColor = TEXTCOLOR;
    relationShipLB.font = [UIFont systemFontOfSize:16];
    [relationShipBG addSubview:relationShipLB];
    
    self.relationShipTF = [[UITextField alloc]initWithFrame:CGRectMake(90, 10, WIDTH - 100, 20)];
    self.relationShipTF.placeholder = @"例:哥哥,姐姐";
    self.relationShipTF.textAlignment = NSTextAlignmentRight;
    self.relationShipTF.delegate = self;
    self.relationShipTF.font = [UIFont systemFontOfSize:16];
    [relationShipBG addSubview:self.relationShipTF];

    //联系方式
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, WIDTH, 39)];
    phoneView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phoneView];
    UILabel *phoneLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 20)];
    phoneLable.text = @"联系方式";
    phoneLable.textColor = TEXTCOLOR;
    phoneLable.font = [UIFont systemFontOfSize:16];
    [phoneView addSubview:phoneLable];
    
    self.phoneText = [[UITextField alloc]initWithFrame:CGRectMake(90, 10, WIDTH - 100, 20)];
    self.phoneText.placeholder = @"请输入联系方式";
    self.phoneText.textAlignment = NSTextAlignmentRight;
    self.phoneText.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneText.delegate = self;
    self.phoneText.font = [UIFont systemFontOfSize:16];
    [phoneView addSubview:self.phoneText];
    
    UIView *groupBg = [[UIView alloc]initWithFrame:CGRectMake(0, 190, WIDTH, 39)];
    groupBg.backgroundColor = WHITECOLOR;
    [self.view addSubview:groupBg];
    
    UILabel *groupLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 20)];
    groupLabel.textColor = TEXTCOLOR;
    groupLabel.text = @"分组管理";
    groupLabel.font = [UIFont systemFontOfSize:16];
    [groupBg addSubview:groupLabel];
    
    self.groupNmae = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, WIDTH - 100, 20)];
    self.groupNmae.text = self.groupNmaeStr;
    self.groupNmae.textAlignment = NSTextAlignmentRight;
    self.groupNmae.font = [UIFont systemFontOfSize:16];
    [groupBg addSubview:self.groupNmae];
    
    UIButton *groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    groupBtn.frame = CGRectMake(0, 0, WIDTH, 40);
    [groupBtn addTarget:self action:@selector(groupBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [groupBg addSubview:groupBtn];

    
    //简介描述
    UIView *decView = [[UIView alloc]initWithFrame:CGRectMake(0, 230, WIDTH,100)];
    decView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:decView];
    UILabel *decLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 30)];
    decLable.text = @"简介描述";
    decLable.textColor = TEXTCOLOR;
    decLable.font = [UIFont systemFontOfSize:16];
    [decView addSubview:decLable];
    
    self.placeHold = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, WIDTH - 90, 30)];
    self.placeHold.text = @"(最多100字)";
    self.placeHold.textColor = GRAYCOLOR;
    self.placeHold.font = [UIFont systemFontOfSize:16];
    [decView addSubview:self.placeHold];
    
    self.decText = [[UITextView alloc]initWithFrame:CGRectMake(80 ,8, WIDTH-100, 80)];
    self.decText.textColor = TEXTTINTCOLOR;
    self.decText.delegate = self;
    self.decText.backgroundColor = [UIColor clearColor];
    self.decText.font = [UIFont systemFontOfSize:15];
    [decView addSubview:self.decText];
  
}

-(void)groupBtnClick
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70)];
    self.bgView.backgroundColor = GRAYCOLOR;
    self.bgView.alpha = 0.7;
    [self.view addSubview:self.bgView];
    
    UIButton *bgBtn = [UIButton buttonWithType:0];
    bgBtn.frame = CGRectMake(0, 0, WIDTH, HEIGHT - 70);
    [bgBtn addTarget:self action:@selector(bgBtnClick) forControlEvents:1<<6];
    [self.bgView addSubview:bgBtn];
    
    self.chooseBG = [[UIView alloc]initWithFrame:CGRectMake(10, ( HEIGHT - (40 * self.groupNameArray.count)) / 2, WIDTH - 20, 40 * self.groupNameArray.count)];
    self.chooseBG.backgroundColor = WHITECOLOR;
    self.chooseBG.layer.cornerRadius = 3;
    self.chooseBG.clipsToBounds = YES;
    [self.view addSubview:self.chooseBG];
    
    for (int i = 0; i < self.groupNameArray.count; i++) {
        UIButton *groupBtns = [UIButton buttonWithType:0];
        groupBtns.frame = CGRectMake(0,  40 * i, WIDTH - 20, 40);
        [groupBtns setTitle:[self.groupNameArray[i] objectForKey:@"name"] forState:0];
        [groupBtns setTitleColor:BLACKTEXTCOLOR forState:0];
        groupBtns.tag = i + 1000;
        [groupBtns addTarget:self action:@selector(groupNmeBtnClick:) forControlEvents:1<<6];
        [self.chooseBG addSubview:groupBtns];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39 + 40* i, WIDTH - 20, 1)];
        lineView.backgroundColor = LINECOLOR;
        [self.chooseBG addSubview:lineView];
    }
}

-(void)groupNmeBtnClick:(UIButton *)sender
{
    self.groupNmae.text = [[self.groupNameArray objectAtIndex:sender.tag - 1000] objectForKey:@"name"];
    self.groupId = [[self.groupNameArray objectAtIndex:sender.tag - 1000] objectForKey:@"id"];
    [self.bgView removeFromSuperview];
    [self.chooseBG removeFromSuperview];
}

-(void)bgBtnClick
{
    [self.bgView removeFromSuperview];
    [self.chooseBG removeFromSuperview];
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@""] && range.length > 0) {
        
        return YES;
    }else{
        if (textField.text.length - range.length + string.length > 12) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"超出最大可输出长度" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
            return NO;
        }else{
            return YES;
        }
    
    }
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.placeHold.hidden = YES;
    return YES;
}


-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length) {
        self.placeHold.hidden = YES;
        if (textView.text.length > 10) {
            textView.text = [textView.text substringToIndex:10];
            [self.view endEditing:YES];
            ALERTVIEW(@"超出最大可输出长度");
            
        }
        
    }else
    {
        self.placeHold.hidden = NO;
    }
}

//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    if (textField.text.length) {
//        self.placeHold.hidden = YES;
//    }else
//    {
//        self.placeHold.hidden = NO;
//    }
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    if (self.decText.text.length) {
        self.placeHold.hidden = YES;
    }else
    {
        self.placeHold.hidden = NO;
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
