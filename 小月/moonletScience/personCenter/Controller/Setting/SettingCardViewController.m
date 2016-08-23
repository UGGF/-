//
//  SettingCardViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/3.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SettingCardViewController.h"
#import "MyPillowViewController.h"
#import "ManageDeviceViewController.h"
#import "SetUserViewController.h"
#import "SetManagerViewController.h"

@interface SettingCardViewController ()<UIGestureRecognizerDelegate>
{
    NSString *_tempString;
    UIView *_bgView;
    UIView *_popView;
    UIView *_glideView;
    UIView *_ManagePopView;
    UIView *_deviceView;
    UIView *_line2;
}
@end

@implementation SettingCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
     _tempString = nil;
    [self createNavBar];
    [self createBgLine];
    [self createSetView];
    [self createWarning];
    [self createUserGlideView];
    [self createManagePopView];
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
    title.text = @"设定身份";
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
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-40, 16, 30, 20);
    saveBtn.adjustsImageWhenHighlighted = NO;
    [saveBtn setTitle:@"确定" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];

}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
   
}

- (void)saveBtnClick{
    if ([_tempString isEqualToString:@"11"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"确定绑定为设备使用者+管理者吗?" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //
            
            NSArray *conArr = [self.navigationController viewControllers];
            MyPillowViewController *myPillow = conArr[conArr.count - 3];
            myPillow.infoStr = @",您好:\n感谢你对小月科技(中国)有限公司的信任与支持!今始,将由我们著名的全球睡眠专家为你及家人提供健康睡眠科学护航!";
            
//-----------------/** 待修改  */-------------------------//
            if ([myPillow.infoStr isEqualToString:@",您好:\n感谢你对小月科技(中国)有限公司的信任与支持!今始,将由我们著名的全球睡眠专家为你及家人提供健康睡眠科学护航!"]) {
                _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
                _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
                [self.view addSubview:_bgView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
                tap.delegate = self;
                [_bgView addGestureRecognizer:tap];
                
                _popView = [[UIView alloc]initWithFrame:CGRectMake((WIDTH-238)/2, HEIGHT/4, 238, 258)];
                _popView.backgroundColor = WHITECOLOR;
                _popView.layer.cornerRadius = 3;
                [_bgView addSubview:_popView];
                
                UILabel *warnLab = [[UILabel alloc]initWithFrame:CGRectMake(258/2-30, 10, 40, 30)];
                warnLab.text = @"警示";
                warnLab.textColor = REDCOLOR;
                warnLab.font = [UIFont systemFontOfSize:20];
                warnLab.textAlignment = NSTextAlignmentCenter;
                [_popView addSubview:warnLab];
                
                UILabel *titileLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, WIDTH-40, 80)];
                titileLab.numberOfLines = 0;
                titileLab.textColor = TEXTCOLOR;
                titileLab.font = [UIFont systemFontOfSize:13];
                titileLab.textAlignment = NSTextAlignmentLeft;
                [_popView addSubview:titileLab];
                
                NSMutableAttributedString *rangeString = [[NSMutableAttributedString alloc]initWithString: @"一个账号只能绑定一个使用者身份!\n您的账号已绑定一个设备使用者身\n份，请切换账号后重新绑定使用者\n身份或绑定设备管理者身份!"];
                NSRange range1 = [[rangeString string]rangeOfString:@"一个账号只能绑定一个使用者身份!"];
                [rangeString addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range1];
                titileLab.attributedText = rangeString;
                
                NSArray *arr = @[@"切换账号绑定",@"解绑原设备使用者",@"绑定管理者身份"];
                for (int i = 0; i < arr.count; i++) {
                    UIButton *warnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    warnBtn.frame = CGRectMake(20, 130+i*(30+10), 238-40, 30);
                    warnBtn.layer.cornerRadius = 3;
                    warnBtn.clipsToBounds = YES;
                    warnBtn.tag = i+1992;
                    warnBtn.adjustsImageWhenHighlighted = NO;
                    warnBtn.layer.borderColor = CAOGREENCOLOR.CGColor;
                    warnBtn.layer.borderWidth = 1.2;
                    warnBtn.layer.masksToBounds = YES;
                    [warnBtn setTitle:arr[i] forState:UIControlStateNormal];
                    [warnBtn setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                    warnBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                    [warnBtn addTarget:self action:@selector(warnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                    [_popView addSubview:warnBtn];

                }
                
            }else{
                
               [self.navigationController popToViewController:conArr[conArr.count-3] animated:YES];
                
            }

        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }else if ([_tempString isEqualToString:@"60"]){
        SetUserViewController *set = [[SetUserViewController alloc]init];
        [self.navigationController pushViewController:set animated:YES];
        
        
    }else if ([_tempString isEqualToString:@"80"]){
        SetManagerViewController *manage = [[SetManagerViewController alloc]init];
        [self.navigationController pushViewController:manage animated:YES];
        
    }
}

- (void)tapClick:(UIGestureRecognizer *)sender{
    if (sender.numberOfTouches == 1) {
        [_bgView removeFromSuperview];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:_popView]) {
        return NO;
    }
    return YES;
}

- (void)warnBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1992:
        {
            
        }
            break;
        case 1993:
        {
            ManageDeviceViewController *manage = [[ManageDeviceViewController alloc]init];
            [self.navigationController pushViewController:manage animated:YES];
        }
            break;
        case 1994:
        {
            
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - 我就是传说中的背景分割线
- (void)createBgLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(20, 72+20+20+49, WIDTH-40, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    _line2 = [[UIView alloc]initWithFrame:CGRectMake(20,  72+20+20+49+40, WIDTH-40, 2)];
    _line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:_line2];
}


#pragma mark - 弹出的页面视图
- (void)createUserGlideView{
    _glideView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+20+120, WIDTH, 20)];
    _glideView.clipsToBounds = YES;
    [self.view addSubview:_glideView];
    _glideView.hidden = YES;
    
    UILabel *popLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH/2, 20)];
    popLab.text = @"是否指定使用者";
    popLab.textColor = TEXTCOLOR;
    popLab.font = [UIFont systemFontOfSize:13];
    popLab.textAlignment = NSTextAlignmentLeft;
    [_glideView addSubview:popLab];
    
    NSArray *sureArr = @[@"是",@"否"];
    for (int i = 0; i < sureArr.count; i++) {
        UILabel *sureLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-120+i*60, 0, 20, 20)];
        sureLab.text = sureArr[i];
        sureLab.textColor = TEXTCOLOR;
        sureLab.font = [UIFont systemFontOfSize:13];
        sureLab.textAlignment = NSTextAlignmentLeft;
        [_glideView addSubview:sureLab];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(WIDTH-100+60*i, 0, 20, 20);
        sureBtn.layer.cornerRadius = 10;
        sureBtn.clipsToBounds = YES;
        sureBtn.tag = 60 + i;
        sureBtn.selected = YES;
        sureBtn.adjustsImageWhenHighlighted = NO;
        sureBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        sureBtn.layer.borderWidth = 1;
        sureBtn.layer.masksToBounds = YES;
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_glideView addSubview:sureBtn];
    }
}

- (void)sureBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 60:
        {
            _tempString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
            UIButton *btn = [self.view viewWithTag:61];
            btn.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
            }
        }
            break;
        case 61:
        {
            UIButton *btn = [self.view viewWithTag:60];
            btn.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
            }
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"本设备暂无使用者\n暂不设置设备使用者吗" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //

                
            }]];
            [self presentViewController:alert animated:YES completion:nil];

        }
            break;
    }
}

- (void)createManagePopView{
    _ManagePopView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+180, WIDTH, 20)];
    _ManagePopView.clipsToBounds = YES;
    [self.view addSubview:_ManagePopView];
    _ManagePopView.hidden = YES;
    
    UILabel *mangeLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH/2, 20)];
    mangeLab.text = @"是否指定管理者";
    mangeLab.textColor = TEXTCOLOR;
    mangeLab.font = [UIFont systemFontOfSize:13];
    mangeLab.textAlignment = NSTextAlignmentLeft;
    [_ManagePopView addSubview:mangeLab];
    
    NSArray *sureManageArr = @[@"是",@"否"];
    for (int i = 0; i < sureManageArr.count; i++) {
        UILabel *sureManageLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-120+i*60, 0, 20, 20)];
        sureManageLab.text = sureManageArr[i];
        sureManageLab.textColor = TEXTCOLOR;
        sureManageLab.font = [UIFont systemFontOfSize:13];
        sureManageLab.textAlignment = NSTextAlignmentLeft;
        [_ManagePopView addSubview:sureManageLab];
        
        UIButton *sureManageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureManageBtn.frame = CGRectMake(WIDTH-100+60*i, 0, 20, 20);
        sureManageBtn.layer.cornerRadius = 10;
        sureManageBtn.clipsToBounds = YES;
        sureManageBtn.tag = 80 + i;
        sureManageBtn.selected = YES;
        sureManageBtn.adjustsImageWhenHighlighted = NO;
        sureManageBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        sureManageBtn.layer.borderWidth = 1;
        sureManageBtn.layer.masksToBounds = YES;
        [sureManageBtn addTarget:self action:@selector(sureManageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ManagePopView addSubview:sureManageBtn];
    }

}

- (void)sureManageBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 80:
        {
            _tempString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
            UIButton *btn = [self.view viewWithTag:81];
            btn.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
            }
        }
            break;
        case 81:
        {
            UIButton *btn = [self.view viewWithTag:80];
            btn.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
            }
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"本设备暂无管理者\n暂不设置设备管理者吗" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //
                
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
            break;
    }
}


#pragma mark - 设定身份的页面
- (void)createSetView{
    NSArray *arr = @[@"我是",@"设备使用者+管理者",@"设备管理者",@"设备使用者"];
    for (int i = 0; i < arr.count; i++) {
        _deviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+20+40*i, WIDTH, 20)];
        _deviceView.clipsToBounds = YES;
        _deviceView.tag = i+50;
        [self.view addSubview:_deviceView];

        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH/2, 20)];
        lab.text = arr[i];
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:13];
        lab.textAlignment = NSTextAlignmentLeft;
        [_deviceView addSubview:lab];
        
        if (i == 0) {
            lab.textColor = CAOGREENCOLOR;
        }
        
        UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        circleBtn.frame = CGRectMake(WIDTH-40, 0, 20, 20);
        circleBtn.layer.cornerRadius = 10;
        circleBtn.clipsToBounds = YES;
        circleBtn.tag = i + 10;
        if (i == 1) {
            circleBtn.selected = YES;
            [circleBtn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
            _tempString = [NSString stringWithFormat:@"%d",i+10];
        }else{
            circleBtn.selected = NO;
            [circleBtn setImage:nil forState:UIControlStateNormal];
        }
        if (i == 0) {
            circleBtn.hidden = YES;
        }
        circleBtn.adjustsImageWhenHighlighted = NO;
        circleBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        circleBtn.layer.borderWidth = 1;
        circleBtn.layer.masksToBounds = YES;
        [circleBtn addTarget:self action:@selector(circleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_deviceView addSubview:circleBtn];
    }
//
//    for (int i = 0; i < 3; i++) {
//        UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        circleBtn.frame = CGRectMake(WIDTH-40, 72+60+40*i, 20, 20);
//        circleBtn.layer.cornerRadius = 10;
//        circleBtn.clipsToBounds = YES;
//        circleBtn.tag = i + 10;
//        if (i == 0) {
//            circleBtn.selected = YES;
//            [circleBtn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//            _tempString = [NSString stringWithFormat:@"%d",i+10];
//        }else{
//            circleBtn.selected = NO;
//            [circleBtn setImage:nil forState:UIControlStateNormal];
//        }
//        circleBtn.adjustsImageWhenHighlighted = NO;
//        circleBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
//        circleBtn.layer.borderWidth = 1;
//        circleBtn.layer.masksToBounds = YES;
//        [circleBtn addTarget:self action:@selector(circleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:circleBtn];
//    }
}

- (void)circleBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 11:
        {
            _tempString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
            UIButton *btn = [self.view viewWithTag:12];
            btn.selected = !sender.selected;
            UIButton *btn1 = [self.view viewWithTag:13];
            btn1.selected = !sender.selected;
            if (sender.selected) {
                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (btn.selected) {
                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                    [btn1 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn setImage:nil forState:UIControlStateNormal];
                    [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                }
            }
            
            _glideView.hidden = YES;
            UIView *view = [self.view viewWithTag:53];
            view.frame = CGRectMake(0, 72+20+120, WIDTH, 20);
            _line2.frame = CGRectMake(20, 72+20+20+49+40, WIDTH-40, 2);
            
            _ManagePopView.hidden = YES;

            
        }
            break;
        case 12:
        {
            _tempString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
            UIButton *btn = [self.view viewWithTag:11];
            btn.selected = !sender.selected;
            UIButton *btn1 = [self.view viewWithTag:13];
            btn1.selected = !sender.selected;
            if (sender.selected) {
                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (btn.selected == NO) {
                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                    [btn1 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn setImage:nil forState:UIControlStateNormal];
                    [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                }
            }
            
            _glideView.hidden = NO;
            UIView *view = [self.view viewWithTag:53];
            view.frame = CGRectMake(0, 72+20+160, WIDTH, 20);
            _line2.frame = CGRectMake(20, 72+20+20+49+40+40, WIDTH-40, 2);
            
            _ManagePopView.hidden = YES;
            

        }
            break;
        case 13:
        {
            _tempString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
            UIButton *btn = [self.view viewWithTag:12];
            btn.selected = !sender.selected;
            UIButton *btn1 = [self.view viewWithTag:11];
            btn1.selected = !sender.selected;
            if (sender.selected) {
                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (btn.selected) {
                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                    [btn1 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn setImage:nil forState:UIControlStateNormal];
                    [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                }
            }
            
            _glideView.hidden = YES;
            UIView *view = [self.view viewWithTag:53];
            view.frame = CGRectMake(0, 72+20+120, WIDTH, 20);
            _line2.frame = CGRectMake(20, 72+20+20+49+40, WIDTH-40, 2);

//            UIView *view1 = [self.view viewWithTag:54];
//            view1.frame = CGRectMake(0, 72+20+180, WIDTH, 20);
            
            _ManagePopView.hidden = NO;

        }
            break;
    }
}

#pragma mark - 注意事项
- (void)createWarning{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT/2+72+HEIGHT/7/2+30, WIDTH-40, HEIGHT/2-72-HEIGHT/7/2-30)];
    lab.numberOfLines = 0;
    lab.text = @"注意事项\n1.一个账户只能捆绑一台设备的使用者身份,但可管理多台设备;\n2.可扫描设备二维码或输入设备串号进行设备与账户绑定;\n3.设备二维码或串号只能捆绑一次使用者或管理者身份,当使用者或管理者完全解绑时方可重新绑定激活;";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
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
