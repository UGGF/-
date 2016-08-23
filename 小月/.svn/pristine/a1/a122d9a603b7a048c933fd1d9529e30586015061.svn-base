//
//  EditAdressViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/20.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "EditAdressViewController.h"

@interface EditAdressViewController ()
{
    UIButton *_tickedBtn;
}
@end

@implementation EditAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createNewAdressView];
    [self createDefaultAdressView];
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
    title.text = @"编辑收货地址";
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
    
    //完成按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-50, 15, 40, 20);
    [saveBtn setTitle:@"完成" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    saveBtn.clipsToBounds = YES;
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)saveBtnClick{
    
}

#pragma mark - 收货地址详情视图
- (void)createNewAdressView{
    //收货详情信息背景
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT-70)];
    bgView.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:bgView];
    
    UIView *detailView = [[UIView alloc]initWithFrame:CGRectMake(0, 2, WIDTH, 280)];
    detailView.backgroundColor = WHITECOLOR;
    [bgView addSubview:detailView];
    
    //收货人和手机号
    NSArray *titleArr = @[@"收货人",@"手机号"];
    NSArray *contentArr = @[@"输入收货人姓名",@"输入手机号"];
    for (int i = 0; i < 2; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 15+i*(20+20), 45, 20)];
        lab.text = titleArr[i];
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:15];
        lab.textAlignment = NSTextAlignmentLeft;
        [detailView addSubview:lab];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(90, 15+20+i*(20+20), WIDTH-110, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [detailView addSubview:line];
        
        UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(90, 16+i*(20+20), WIDTH-100, 20)];
        textF.placeholder = contentArr[i];
        textF.textColor = TEXTCOLOR;
        textF.font = [UIFont systemFontOfSize:15];
        [bgView addSubview:textF];
        if (i == 1) {
            [textF removeFromSuperview];
            UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(90, 15+(20+20), WIDTH-100, 20)];
            textF.placeholder = contentArr[1];
            textF.keyboardType = UIKeyboardTypeNumberPad;
            textF.textColor = TEXTCOLOR;
            textF.font = [UIFont systemFontOfSize:15];
            [detailView addSubview:textF];
            
        }
    }
    
    //所在地
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 95, 45, 20)];
    lab.text = @"所在地";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [detailView addSubview:lab];
    
    NSArray *arr = @[@"--省份--",@"--城市--",@"--县市区--"];
    for (int i = 0; i < 3; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(90, 95+i*(30+15), WIDTH-110, 30)];
        lab.text = arr[i];
        lab.textColor = TEXTTINTCOLOR;
        lab.font = [UIFont systemFontOfSize:15];
        lab.layer.borderColor = SLIVERYCOLOR.CGColor;
        lab.layer.borderWidth = 1.5;
        lab.layer.masksToBounds = YES;
        lab.textAlignment = NSTextAlignmentLeft;
        [detailView addSubview:lab];
        
        UIButton *openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        openBtn.frame = CGRectMake(WIDTH-45, 95+5+i*(30+15), 20, 20);
        openBtn.clipsToBounds = YES;
        [openBtn setImage:[UIImage imageNamed:@"store_open_up.png"] forState:UIControlStateNormal];
        openBtn.adjustsImageWhenHighlighted = NO;
        [openBtn addTarget:self action:@selector(openBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [detailView addSubview:openBtn];
        
    }
    
    //详情地址
    UILabel *adressLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 230, 60, 20)];
    adressLab.text = @"详情地址";
    adressLab.textColor = TEXTCOLOR;
    adressLab.font = [UIFont systemFontOfSize:15];
    adressLab.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:adressLab];
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(90, 225, WIDTH-100, 30)];
    textF.placeholder = @"请输入街道地址";
    textF.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:textF];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(90,255, WIDTH-110, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [bgView addSubview:line];
}

//所在地(省份、城市、县市区)的按钮点击事件
- (void)openBtnClick:(UIButton *)sender{
    
}


#pragma mark - 设为默认地址 视图
- (void)createDefaultAdressView{
    UIView *defaultView = [[UIView alloc]initWithFrame:CGRectMake(0, 358, WIDTH, 50)];
    defaultView.backgroundColor = WHITECOLOR;
    [self.view addSubview:defaultView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 50)];
    lab.text = @"设为默认地址";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [defaultView addSubview:lab];
    
    _tickedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tickedBtn.frame = CGRectMake(WIDTH-35, 15, 20, 20);
    _tickedBtn.backgroundColor = TEXTTINTCOLOR;
    _tickedBtn.layer.cornerRadius = 10;
    _tickedBtn.clipsToBounds = YES;
    _tickedBtn.selected = YES;
    _tickedBtn.adjustsImageWhenHighlighted = NO;
    [_tickedBtn addTarget:self action:@selector(tickedBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [defaultView addSubview:_tickedBtn];
}

- (void)tickedBtnClick{
    _tickedBtn.selected = !_tickedBtn.selected;
    if (_tickedBtn.selected == NO) {
        [_tickedBtn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
    }else{
        [_tickedBtn setImage:nil forState:UIControlStateNormal];
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
