//
//  DeviceBindingViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/3.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "DeviceBindingViewController.h"
#import "SettingCardViewController.h"

@interface DeviceBindingViewController ()<UITextFieldDelegate>
{
    UIView *_inputView;
    UIView *_scanView;
    UITextField *_textF;
}
@property(nonatomic,strong)UIView *blueLine;
@end

@implementation DeviceBindingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createBgLine];
    [self createDeviceBindStyleView];
    [self createWarning];
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
    title.text = @"设备绑定";
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
- (void)createBgLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 70+HEIGHT/7/2, WIDTH, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/2+72+HEIGHT/7/2+30, WIDTH, 2)];
    line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line2];
    
}

#pragma mark - 设备绑定方式
- (void)createDeviceBindStyleView{
    NSArray *arr = @[@"输入设备串号",@"扫描二维码"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *deviceBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deviceBindBtn.frame = CGRectMake(WIDTH/2-10-90+i*(100+20), 72, 90, HEIGHT/7/2);
        deviceBindBtn.clipsToBounds = YES;
        deviceBindBtn.selected = YES;
        deviceBindBtn.tag = i+10;
    
        deviceBindBtn.adjustsImageWhenHighlighted = NO;
        [deviceBindBtn setTitle:arr[i] forState:UIControlStateNormal];
        [deviceBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        deviceBindBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [deviceBindBtn addTarget:self action:@selector(deviceBindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:deviceBindBtn];
    }
    
    self.blueLine = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2-10-90, 72+HEIGHT/7/2-8, 90, 3)];
    self.blueLine.backgroundColor = BGCOLOR;
    [self.view addSubview:self.blueLine];
    
    /** 点击 扫描二维码 按钮出现的页面  */
    _scanView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/7/2, WIDTH, HEIGHT/2)];
    _scanView.backgroundColor = WHITECOLOR;
    [self.view addSubview:_scanView];
    
    UIView *scanFrame = [[UIView alloc]initWithFrame:CGRectMake(50, 50, WIDTH-100, HEIGHT/3)];
    scanFrame.clipsToBounds = YES;
    scanFrame.layer.borderWidth = 2;
    scanFrame.layer.borderColor = TEXTTINTCOLOR.CGColor;
    scanFrame.layer.masksToBounds =YES;
    [_scanView addSubview:scanFrame];

    
    
    /** 点击 输入设备串号 按钮出现的页面  */
    _inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/7/2, WIDTH, HEIGHT/2)];
    _inputView.backgroundColor = WHITECOLOR;
    [self.view addSubview:_inputView];
    _inputView.hidden = NO;
    
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(30, 20, WIDTH-60, 40)];
    cicView.layer.cornerRadius =  3;
    cicView.clipsToBounds = YES;
    cicView.layer.borderWidth = 1.2;
    cicView.layer.borderColor = SLIVERYCOLOR.CGColor;
    cicView.layer.masksToBounds =YES;
    [_inputView addSubview:cicView];

    _textF = [[UITextField alloc]initWithFrame:CGRectMake(5, 0, WIDTH-70, 40)];
    _textF.placeholder = @"请输入设备串号";
    _textF.keyboardType = UIKeyboardTypeNumberPad;
    _textF.font = [UIFont systemFontOfSize:13];
    _textF.textColor = TEXTCOLOR;
    [cicView addSubview:_textF];
    
    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(30, 80, WIDTH-60, 40);
    unBindBtn.backgroundColor = BGCOLOR;
    unBindBtn.layer.cornerRadius = 3;
    unBindBtn.clipsToBounds = YES;
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [unBindBtn setTitle:@"提交绑定设备" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [unBindBtn addTarget:self action:@selector(unBindBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:unBindBtn];
    
////    初始化照相机窗口
//    self.readview = [ZBarReaderView new];
//    //自定义大小
//    self.readview.frame = CGRectMake(50, 50, WIDTH-100, HEIGHT/3);
//    //自定义添加相关指示.........发挥各自的APP的想象力
//    //此处省略美化10000行代码...................
//    //………………………..
//    // 好进入正题—— 接着设置好代理
//    self.readview.readerDelegate = self;
//    self.readview.torchMode = 1;
//    //将其照相机拍摄视图添加到要显示的视图上
//    [_scanView  addSubview:self.readview];
//    //二维码/条形码识别设置
//    ZBarImageScanner *scanner = self.readview.scanner;
//    [scanner setSymbology: ZBAR_I25
//                   config: ZBAR_CFG_ENABLE
//                       to: 0];
//    //启动，必须启动后，手机摄影头拍摄的即时图像菜可以显示在readview上
}

- (void)deviceBindBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    self.blueLine.frame = CGRectMake(WIDTH/2-10-90+(sender.tag-10)*(100+20), 70+HEIGHT/7/2-8, 90, 3);
    switch (sender.tag) {
        case 10:
        {
           _inputView.hidden = NO;
        }
            break;
        case 11:
        {
              [self.readview start];
            _inputView.hidden = YES;

            

        }
            break;

       
    }
    }

//-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
//{
//    ZBarSymbol *symbol = nil;
//    for (symbol in symbols)
//        break;
//    NSLog(@"%@",symbol.data);
//    ALERTVIEW(symbol.data)
//}

- (void)unBindBtnClick{
    if ([_textF.text isEqualToString:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"设备串号不存在或已失效\n请检查后再输入" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        session *danLi = [session getInstance];
        [ZYHTTPRequest request:ADD_DEVICE_URL(danLi.token,@"", _textF.text) Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
            
        }];
        
        
        SettingCardViewController *set = [[SettingCardViewController alloc]init];
        [self.navigationController pushViewController:set animated:YES];
    }
}

#pragma mark - 注意事项
- (void)createWarning{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, HEIGHT/2+72+HEIGHT/7/2+30, WIDTH-20, HEIGHT/2-72-HEIGHT/7/2-30)];
    lab.numberOfLines = 0;
    lab.text = @"注意事项\n1.一个账户只能捆绑一台设备的使用者身份,但可管理多台设备;\n2.可扫描设备二维码或输入设备串号进行设备与账户绑定;\n3.设备二维码或串号只能捆绑一次使用者或管理者身份,当使用者或管理者完全解绑时方可重新绑定激活;";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
