//
//  ManageDeviceViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/4.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ManageDeviceViewController.h"
#import "DevicePermissionTableViewCell.h"
#import "DevicePermissionViewController.h"

@interface ManageDeviceViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSArray *_dataArray;
}
@end

@implementation ManageDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createBgLineView];
    [self createManageDeviceView];
    [self createWarning];
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
    title.text = @"设备管理";
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
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 我是传说中的背景分割线
- (void)createBgLineView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14, WIDTH, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 74+HEIGHT/7, WIDTH, 2)];
    line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line2];
    
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(0, 76+HEIGHT/7+(HEIGHT-76-HEIGHT/7-(HEIGHT/2-72-HEIGHT/7/2-30))/2, WIDTH, 2)];
    line3.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line3];

}

#pragma mark - 设备管理界面
- (void)createManageDeviceView{
    UILabel *identityLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 72, WIDTH-40, HEIGHT/14)];
    identityLab.textColor = TEXTCOLOR;
    identityLab.font = [UIFont systemFontOfSize:12];
    identityLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:identityLab];
    
    NSMutableAttributedString *identityString = [[NSMutableAttributedString alloc]initWithString:@"我是使用者+管理者"];
    NSRange range1 = [[identityString string]rangeOfString:@"使用者+管理者"];
    [identityString addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range1];
    identityLab.attributedText = identityString;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 74+HEIGHT/14, WIDTH, HEIGHT/14)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    NSArray *arr = @[@"解绑设备",@"转让设备"];
    for (int i = 0; i < arr.count; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 76+HEIGHT/7+i*(HEIGHT-76-HEIGHT/7-(HEIGHT/2-72-HEIGHT/7/2-30))/2, WIDTH/2, HEIGHT/18)];
        lab.text = arr[i];
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:15];
        lab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:lab];
    }
    
    NSArray *oneArr = @[@"解绑使用者",@"解绑管理者",@"解绑使用者+管理者"];
    for (int i = 0; i < oneArr.count; i++) {
        UILabel *unBindLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 76+HEIGHT/7+HEIGHT/18+i*HEIGHT/18, WIDTH/2, HEIGHT/18)];
        unBindLab.text = oneArr[i];
        unBindLab.textColor = TEXTTINTCOLOR;
        unBindLab.font = [UIFont systemFontOfSize:13];
        unBindLab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:unBindLab];
    }
    
    NSArray *twoArr = @[@"转让使用者",@"转让管理者",@"转让使用者+管理者"];
    for (int i = 0; i < twoArr.count; i++) {
        UILabel *TransferLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 76+HEIGHT/7+(HEIGHT-76-HEIGHT/7-(HEIGHT/2-72-HEIGHT/7/2-30))/2+HEIGHT/18+i*HEIGHT/18, WIDTH/2, HEIGHT/18)];
        TransferLab.text = twoArr[i];
        TransferLab.textColor = TEXTTINTCOLOR;
        TransferLab.font = [UIFont systemFontOfSize:13];
        TransferLab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:TransferLab];
    }
    
    for (int i = 0; i < 6; i++) {
        UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+HEIGHT/18+i*(HEIGHT/18)+2, 22, 22);
        unBindBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
        unBindBtn.layer.borderWidth = 1;
        unBindBtn.tag = i+30;
        unBindBtn.selected = YES;
        unBindBtn.layer.masksToBounds = YES;
        unBindBtn.clipsToBounds = YES;
        if (i == 0) {
            unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+HEIGHT/18+6, 20, 20);
        }
        else if (i == 1) {
            unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+HEIGHT/18+(HEIGHT/18)+6, 20, 20);
        }
        else if(i == 2){
            unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+HEIGHT/18+2*(HEIGHT/18)+6, 20, 20);
        }
        else if (i == 3) {
            unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+(HEIGHT-76-HEIGHT/7-(HEIGHT/2-72-HEIGHT/7/2-30))/2+HEIGHT/18+6, 20, 20);
        }
        else if (i == 4) {
            unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+(HEIGHT-76-HEIGHT/7-(HEIGHT/2-72-HEIGHT/7/2-30))/2+HEIGHT/18+(HEIGHT/18)+6, 20, 20);
        }
        else if (i == 5) {
            unBindBtn.frame = CGRectMake(WIDTH-40, 76+HEIGHT/7+(HEIGHT-76-HEIGHT/7-(HEIGHT/2-72-HEIGHT/7/2-30))/2+HEIGHT/18+(HEIGHT/18)*2+6, 20, 20);

        }
        //        [unBindBtn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
        unBindBtn.layer.cornerRadius = 10;
        unBindBtn.adjustsImageWhenHighlighted = NO;
        [unBindBtn addTarget:self action:@selector(unBindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:unBindBtn];
    }
}

- (void)unBindBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 30:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:32];
            btn2.selected = !sender.selected;
            UIButton *btn3 = [self.view viewWithTag:33];
            btn3.selected = !sender.selected;
            UIButton *btn4 = [self.view viewWithTag:34];
            btn4.selected = !sender.selected;
            UIButton *btn5 = [self.view viewWithTag:35];
            btn5.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
                [btn2 setImage:nil forState:UIControlStateNormal];
                [btn3 setImage:nil forState:UIControlStateNormal];
                [btn4 setImage:nil forState:UIControlStateNormal];
                [btn5 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (sender.selected == NO) {
                    [btn1 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                    [btn2 setImage:nil forState:UIControlStateNormal];
                    [btn3 setImage:nil forState:UIControlStateNormal];
                    [btn4 setImage:nil forState:UIControlStateNormal];
                    [btn5 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn1 setImage:nil forState:UIControlStateNormal];
                    if (sender.selected == NO) {
                        [btn2 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                        [btn3 setImage:nil forState:UIControlStateNormal];
                        [btn4 setImage:nil forState:UIControlStateNormal];
                        [btn5 setImage:nil forState:UIControlStateNormal];
                    }else{
                        [btn2 setImage:nil forState:UIControlStateNormal];
                        if (sender.selected == NO) {
                            [btn3 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                            [btn4 setImage:nil forState:UIControlStateNormal];
                            [btn5 setImage:nil forState:UIControlStateNormal];
                        }else{
                            [btn3 setImage:nil forState:UIControlStateNormal];
                            if (sender.selected == NO) {
                                [btn4 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn5 setImage:nil forState:UIControlStateNormal];
                            }else{
                                [btn5 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn4 setImage:nil forState:UIControlStateNormal];
                            }
                        }
                        
                    }
                }
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"解除绑定后,关心此设备使用者的人将无法查看原设备使用者的睡眠报告和睡眠状态,确定解除绑定吗" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //
                NSArray *arr = [self.navigationController viewControllers];
                [self.navigationController popToViewController:arr[arr.count-3] animated:YES];
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
            break;
        case 31:
        {
            UIButton *btn1 = [self.view viewWithTag:30];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:32];
            btn2.selected = !sender.selected;
            UIButton *btn3 = [self.view viewWithTag:33];
            btn3.selected = !sender.selected;
            UIButton *btn4 = [self.view viewWithTag:34];
            btn4.selected = !sender.selected;
            UIButton *btn5 = [self.view viewWithTag:35];
            btn5.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
                [btn2 setImage:nil forState:UIControlStateNormal];
                [btn3 setImage:nil forState:UIControlStateNormal];
                [btn4 setImage:nil forState:UIControlStateNormal];
                [btn5 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (sender.selected == NO) {
                    [btn1 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                    [btn2 setImage:nil forState:UIControlStateNormal];
                    [btn3 setImage:nil forState:UIControlStateNormal];
                    [btn4 setImage:nil forState:UIControlStateNormal];
                    [btn5 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn1 setImage:nil forState:UIControlStateNormal];
                    if (sender.selected == NO) {
                        [btn2 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                        [btn3 setImage:nil forState:UIControlStateNormal];
                        [btn4 setImage:nil forState:UIControlStateNormal];
                        [btn5 setImage:nil forState:UIControlStateNormal];
                    }else{
                        [btn2 setImage:nil forState:UIControlStateNormal];
                        if (sender.selected == NO) {
                            [btn3 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                            [btn4 setImage:nil forState:UIControlStateNormal];
                            [btn5 setImage:nil forState:UIControlStateNormal];
                        }else{
                            [btn3 setImage:nil forState:UIControlStateNormal];
                            if (sender.selected == NO) {
                                [btn4 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn5 setImage:nil forState:UIControlStateNormal];
                            }else{
                                [btn5 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn4 setImage:nil forState:UIControlStateNormal];
                            }
                        }
                        
                    }
                    
                    
                }
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"解除绑定后,原设备管理者将不再具备此设备管理权利,确定解除绑定吗?" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //
                NSArray *arr = [self.navigationController viewControllers];
                [self.navigationController popToViewController:arr[arr.count-3] animated:YES];
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];


        }
            break;
        case 32:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:30];
            btn2.selected = !sender.selected;
            UIButton *btn3 = [self.view viewWithTag:33];
            btn3.selected = !sender.selected;
            UIButton *btn4 = [self.view viewWithTag:34];
            btn4.selected = !sender.selected;
            UIButton *btn5 = [self.view viewWithTag:35];
            btn5.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
                [btn2 setImage:nil forState:UIControlStateNormal];
                [btn3 setImage:nil forState:UIControlStateNormal];
                [btn4 setImage:nil forState:UIControlStateNormal];
                [btn5 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (sender.selected == NO) {
                    [btn1 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                    [btn2 setImage:nil forState:UIControlStateNormal];
                    [btn3 setImage:nil forState:UIControlStateNormal];
                    [btn4 setImage:nil forState:UIControlStateNormal];
                    [btn5 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn1 setImage:nil forState:UIControlStateNormal];
                    if (sender.selected == NO) {
                        [btn2 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                        [btn3 setImage:nil forState:UIControlStateNormal];
                        [btn4 setImage:nil forState:UIControlStateNormal];
                        [btn5 setImage:nil forState:UIControlStateNormal];
                    }else{
                        [btn2 setImage:nil forState:UIControlStateNormal];
                        if (sender.selected == NO) {
                            [btn3 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                            [btn4 setImage:nil forState:UIControlStateNormal];
                            [btn5 setImage:nil forState:UIControlStateNormal];
                        }else{
                            [btn3 setImage:nil forState:UIControlStateNormal];
                            if (sender.selected == NO) {
                                [btn4 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn5 setImage:nil forState:UIControlStateNormal];
                            }else{
                                [btn5 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn4 setImage:nil forState:UIControlStateNormal];
                            }
                        }
                        
                    }
                    
                    
                }
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"解除绑定后,设备将恢复出厂设置,此前所有相关数据将被清空,确定解除绑定吗?" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //
                NSArray *arr = [self.navigationController viewControllers];
                [self.navigationController popToViewController:arr[arr.count-3] animated:YES];
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 33:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:32];
            btn2.selected = !sender.selected;
            UIButton *btn3 = [self.view viewWithTag:30];
            btn3.selected = !sender.selected;
            UIButton *btn4 = [self.view viewWithTag:34];
            btn4.selected = !sender.selected;
            UIButton *btn5 = [self.view viewWithTag:35];
            btn5.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
                [btn2 setImage:nil forState:UIControlStateNormal];
                [btn3 setImage:nil forState:UIControlStateNormal];
                [btn4 setImage:nil forState:UIControlStateNormal];
                [btn5 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (sender.selected == NO) {
                    [btn1 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                    [btn2 setImage:nil forState:UIControlStateNormal];
                    [btn3 setImage:nil forState:UIControlStateNormal];
                    [btn4 setImage:nil forState:UIControlStateNormal];
                    [btn5 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn1 setImage:nil forState:UIControlStateNormal];
                    if (sender.selected == NO) {
                        [btn2 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                        [btn3 setImage:nil forState:UIControlStateNormal];
                        [btn4 setImage:nil forState:UIControlStateNormal];
                        [btn5 setImage:nil forState:UIControlStateNormal];
                    }else{
                        [btn2 setImage:nil forState:UIControlStateNormal];
                        if (sender.selected == NO) {
                            [btn3 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                            [btn4 setImage:nil forState:UIControlStateNormal];
                            [btn5 setImage:nil forState:UIControlStateNormal];
                        }else{
                            [btn3 setImage:nil forState:UIControlStateNormal];
                            if (sender.selected == NO) {
                                [btn4 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn5 setImage:nil forState:UIControlStateNormal];
                            }else{
                                [btn5 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn4 setImage:nil forState:UIControlStateNormal];
                            }
                        }
                        
                    }
                    
                    
                }
            }
            
        }
            break;

        case 34:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:32];
            btn2.selected = !sender.selected;
            UIButton *btn3 = [self.view viewWithTag:33];
            btn3.selected = !sender.selected;
            UIButton *btn4 = [self.view viewWithTag:30];
            btn4.selected = !sender.selected;
            UIButton *btn5 = [self.view viewWithTag:35];
            btn5.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
                [btn2 setImage:nil forState:UIControlStateNormal];
                [btn3 setImage:nil forState:UIControlStateNormal];
                [btn4 setImage:nil forState:UIControlStateNormal];
                [btn5 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (sender.selected == NO) {
                    [btn1 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                    [btn2 setImage:nil forState:UIControlStateNormal];
                    [btn3 setImage:nil forState:UIControlStateNormal];
                    [btn4 setImage:nil forState:UIControlStateNormal];
                    [btn5 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn1 setImage:nil forState:UIControlStateNormal];
                    if (sender.selected == NO) {
                        [btn2 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                        [btn3 setImage:nil forState:UIControlStateNormal];
                        [btn4 setImage:nil forState:UIControlStateNormal];
                        [btn5 setImage:nil forState:UIControlStateNormal];
                    }else{
                        [btn2 setImage:nil forState:UIControlStateNormal];
                        if (sender.selected == NO) {
                            [btn3 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                            [btn4 setImage:nil forState:UIControlStateNormal];
                            [btn5 setImage:nil forState:UIControlStateNormal];
                        }else{
                            [btn3 setImage:nil forState:UIControlStateNormal];
                            if (sender.selected == NO) {
                                [btn4 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn5 setImage:nil forState:UIControlStateNormal];
                            }else{
                                [btn5 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn4 setImage:nil forState:UIControlStateNormal];
                            }
                        }
                        
                    }
                    
                    
                }
            }
            
        }
            break;

        case 35:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:32];
            btn2.selected = !sender.selected;
            UIButton *btn3 = [self.view viewWithTag:33];
            btn3.selected = !sender.selected;
            UIButton *btn4 = [self.view viewWithTag:34];
            btn4.selected = !sender.selected;
            UIButton *btn5 = [self.view viewWithTag:30];
            btn5.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn1 setImage:nil forState:UIControlStateNormal];
                [btn2 setImage:nil forState:UIControlStateNormal];
                [btn3 setImage:nil forState:UIControlStateNormal];
                [btn4 setImage:nil forState:UIControlStateNormal];
                [btn5 setImage:nil forState:UIControlStateNormal];
            }else{
                [sender setImage:nil forState:UIControlStateNormal];
                if (sender.selected == NO) {
                    [btn1 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                    [btn2 setImage:nil forState:UIControlStateNormal];
                    [btn3 setImage:nil forState:UIControlStateNormal];
                    [btn4 setImage:nil forState:UIControlStateNormal];
                    [btn5 setImage:nil forState:UIControlStateNormal];
                }else{
                    [btn1 setImage:nil forState:UIControlStateNormal];
                    if (sender.selected == NO) {
                        [btn2 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                        [btn3 setImage:nil forState:UIControlStateNormal];
                        [btn4 setImage:nil forState:UIControlStateNormal];
                        [btn5 setImage:nil forState:UIControlStateNormal];
                    }else{
                        [btn2 setImage:nil forState:UIControlStateNormal];
                        if (sender.selected == NO) {
                            [btn3 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                            [btn4 setImage:nil forState:UIControlStateNormal];
                            [btn5 setImage:nil forState:UIControlStateNormal];
                        }else{
                            [btn3 setImage:nil forState:UIControlStateNormal];
                            if (sender.selected == NO) {
                                [btn4 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn5 setImage:nil forState:UIControlStateNormal];
                            }else{
                                [btn5 setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                                [btn4 setImage:nil forState:UIControlStateNormal];
                            }
                        }
                        
                    }
                    
                    
                }
            }
            
        }
            break;

    }
}

#pragma mark - tableView相关的代理方法实现
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return HEIGHT/14;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"DevicePermissionTableViewCell";
    DevicePermissionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.permissionLabel.text = @"权限设备";
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DevicePermissionViewController *devi = [[DevicePermissionViewController alloc]init];
    [self.navigationController pushViewController:devi animated:YES];
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
