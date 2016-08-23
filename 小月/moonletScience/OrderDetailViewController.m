//
//  OrderDetailViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/16.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "BackPayViewController.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createPayAgainView];
    [self createContentView];
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
    title.text = @"订单详情";
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




- (void)createPayAgainView{
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT/10)];
    [self.view addSubview:cicView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, (HEIGHT/10-20)/2, WIDTH/2-20, 20)];
    lab.text = @"订单支付失败";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];
    
    UIButton *payAgainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payAgainBtn.frame = CGRectMake(WIDTH-100, (HEIGHT/10-30)/2, 80, 30);
    payAgainBtn.backgroundColor = REDCOLOR;
    payAgainBtn.layer.cornerRadius = 3;
    payAgainBtn.clipsToBounds = YES;
    payAgainBtn.adjustsImageWhenHighlighted = NO;
    [payAgainBtn setTitle:@"重新支付" forState:UIControlStateNormal];
    [payAgainBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    payAgainBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    //    [payAgainBtn addTarget:self action:@selector(payAgainBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:payAgainBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/10-2, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [cicView addSubview:line];
    
}



#pragma mark - 订单详情内容
- (void)createContentView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/10, WIDTH, HEIGHT-72)];
    [self.view addSubview:cicView];

    
    NSArray *titArr = @[@"订单号:",@"下单时间:",@"支付方式:",@"客服电话"];
    NSArray *contentArr = @[@"1428277755642235",@"2016-03-28 14:58:01",@"支付宝支付",@"400-801-4001"];
    for (int i = 0; i < titArr.count; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 12+i*20, 70, 20)];
        lab.text = titArr[i];
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:14];
        lab.textAlignment = NSTextAlignmentLeft;
        [cicView addSubview:lab];
        
        UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 12+i*20, WIDTH/2, 20)];
        contentLab.text = contentArr[i];
        contentLab.textColor = TEXTCOLOR;
        contentLab.font = [UIFont systemFontOfSize:14];
        contentLab.textAlignment = NSTextAlignmentLeft;
        [cicView addSubview:contentLab];
    }
    
    
    _imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 100, 120, 80)];
    _imaInfoView.layer.cornerRadius = 3;
    _imaInfoView.clipsToBounds = YES;
    [cicView addSubview:_imaInfoView];
    
    _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 100, 100, 20)];
    _nameLab.textColor = BGCOLOR;
    _nameLab.font = [UIFont systemFontOfSize:16];
    _nameLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_nameLab];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+60+10, 100, 100, 20)];
    _lab.textColor = TEXTCOLOR;
    _lab.font = [UIFont systemFontOfSize:16];
    _lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_lab];
    
    _moonLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 100+20, 50, 20)];
    _moonLab.textColor = TEXTCOLOR;
    _moonLab.font = [UIFont systemFontOfSize:13];
    _moonLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_moonLab];
    
    _sizeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10, 100+20, 50, 20)];
    _sizeLab.textColor = CAOGREENCOLOR;
    _sizeLab.font = [UIFont systemFontOfSize:13];
    _sizeLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_sizeLab];
    
    _editionLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10+50, 100+20, 50, 20)];
    _editionLab.textColor = CAOGREENCOLOR;
    _editionLab.font = [UIFont systemFontOfSize:13];
    _editionLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_editionLab];
    
    _typeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 100+20+20, 120, 20)];
    _typeLab.textColor = CAOGREENCOLOR;
    _typeLab.font = [UIFont systemFontOfSize:13];
    _typeLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_typeLab];
    
    _colorLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+10, 100+20+20, 100, 20)];
    _colorLab.textColor = CAOGREENCOLOR;
    _colorLab.font = [UIFont systemFontOfSize:13];
    _colorLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_colorLab];
    
    _signLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 100+20+20+20, 100, 20)];
    _signLab.textColor = REDCOLOR;
    _signLab.font = [UIFont systemFontOfSize:13];
    _signLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_signLab];
    
    _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+10, 100+20+20+20, 100, 20)];
    _priceLab.textColor = REDCOLOR;
    _priceLab.font = [UIFont systemFontOfSize:14];
    _priceLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_priceLab];
    
    _signNumLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+30, 100+20+20+20, 100, 20)];
    _signNumLab.textColor = REDCOLOR;
    _signNumLab.font = [UIFont systemFontOfSize:14];
    _signNumLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_signNumLab];
    
    _numLab = [[UILabel alloc]initWithFrame:CGRectMake(25+120+10+100+30, 100+20+20+20, 100, 20)];
    _numLab.textColor = REDCOLOR;
    _numLab.font = [UIFont systemFontOfSize:14];
    _numLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_numLab];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 100+20+20+20+20+10, WIDTH, 2)];
    line2.backgroundColor = LINECOLOR;
    [cicView addSubview:line2];
    
//    _timeLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 250-72, WIDTH/2+15, 20)];
//    _timeLab.textColor = TEXTCOLOR;
//    _timeLab.font = [UIFont systemFontOfSize:14];
//    _timeLab.textAlignment = NSTextAlignmentLeft;
//    [cicView addSubview:_timeLab];
    
    UIButton *backBtn = [[UIButton alloc]init];
    backBtn.frame = CGRectMake(20, 270-73, 80, 30);
    [backBtn setTitle:@"申请退款" forState:UIControlStateNormal];
    [backBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    backBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    backBtn.layer.borderWidth = 1;
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:backBtn];
    
    
    _numTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20-60, 270-72, 70,30)];
    _numTotalLab.textColor = REDCOLOR;
    _numTotalLab.font = [UIFont systemFontOfSize:14];
    _numTotalLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:_numTotalLab];
    
    _priceTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20-60-40, 270-72, 40, 30)];
    _priceTotalLab.textColor = TEXTCOLOR;
    _priceTotalLab.font = [UIFont systemFontOfSize:14];
    _priceTotalLab.textAlignment = NSTextAlignmentRight;
    [cicView addSubview:_priceTotalLab];
    
    
    //固定的
    [self.imaInfoView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
    self.nameLab.text = @"SEELEEP";
    self.lab.text = @"小月智能枕";
    self.moonLab.text = @"小月1号";
    self.editionLab.text = @"GPS版";
    self.signLab.text = @"¥";
    self.signNumLab.text = @"x";
    self.priceTotalLab.text = @"合计:";
    
    //待同步数据的
    self.sizeLab.text = @"豪华版";
    self.typeLab.text = @"长150宽35高8cm";
    self.colorLab.text = @"米白色";
    self.priceLab.text = @"1980";
    self.numLab.text = @"2";
//    self.timeLab.text = @"客服电话:400-801-4001";
    self.numTotalLab.text = @"¥3960.00";
    
}



- (void)backBtnClick{
    BackPayViewController *unPay = [[BackPayViewController alloc]init];
    [self.navigationController pushViewController:unPay animated:YES];

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
