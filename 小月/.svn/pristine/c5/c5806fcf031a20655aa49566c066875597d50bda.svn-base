//
//  SureBuyViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/19.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SureBuyViewController.h"
#import "ShippingInfoTableViewCell.h"
#import "SelectAdressViewController.h"

@interface SureBuyViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    NSString *_temp;
}
@end

@implementation SureBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createBgLine];
    [self createShippingInfoView];
    _array = @[@"王三",@"15888122479",@"浙江省宁波市江东区中山东路\n455号东海曙光大厦20楼B1"];
    [self createTableView];
    [self createProInfoView];
    [self createShipView];
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
    title.text = @"确认购买";
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

#pragma  mark - 我是传说中的背景分割线
- (void)createBgLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 70+15+15+5+80, WIDTH, 5)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(10, 190+20+20+20+5+20+20, WIDTH-20, 2)];
    line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line2];
    
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(10, 190+20+20+20+5+20+40+20, WIDTH-20, 2)];
    line3.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line3];
    
    UIView *line4 = [[UIView alloc]initWithFrame:CGRectMake(0, 190+20+20+20+5+20+40+10+5+20+20, WIDTH, 5)];
    line4.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line4];

}

#pragma mark - 配送信息相关内容
- (void)createShippingInfoView{
    UILabel *shInLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 70+15, 80, 20)];
    shInLab.text = @"配送信息";
    shInLab.textColor = TEXTCOLOR;
    shInLab.font = [UIFont systemFontOfSize:15];
    shInLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:shInLab];
    
    UILabel *deLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-60, 70+15, 50, 20)];
    deLab.text = @"[默认]";
    deLab.textColor = CAOGREENCOLOR;
    deLab.font = [UIFont systemFontOfSize:15];
    deLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:deLab];
    
}

#pragma mark - tableView相关信息
- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70+15+15+5, WIDTH-30, 80)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ShippingInfoTableViewCell";
    ShippingInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    cell.myLable.backgroundColor = REDCOLOR;
    cell.myLable.text = @"收货人";
    cell.myLable.textColor = TEXTCOLOR;
    
    cell.myPhoneLable.text = @"手机号";
    cell.myPhoneLable.textColor = TEXTCOLOR;
    
    cell.myAdressLable.text = @"收货地址";
    cell.myAdressLable.textColor = TEXTCOLOR;
    cell.myAdressLable.numberOfLines = 0;
 
    cell.InfoNameLable.textColor = TEXTCOLOR;
    cell.InfoNameLable.text = _array[0];
    cell.InfoNameLable.textAlignment = NSTextAlignmentLeft;
    
    cell.InfoNumLable.textColor = TEXTCOLOR;
    cell.InfoNumLable.text = _array[1];
    cell.InfoNumLable.textAlignment = NSTextAlignmentLeft;
    
    cell.InfoAdressLable.textColor = TEXTCOLOR;
    cell.InfoAdressLable.text = _array[2];
    cell.InfoAdressLable.numberOfLines = 0;
    cell.InfoAdressLable.textAlignment = NSTextAlignmentLeft;
    
    _temp = [_array[2] substringWithRange:NSMakeRange(0, 2)];
    if (![_temp  isEqual: @"中国"] && ![_temp  isEqual: @""]) {
        _postageLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 65, 200, 20)];
        _postageLab.numberOfLines = 0;
        _postageLab.text = @"您的收货地址不属于包邮地区，需另加运费200元";
        _postageLab.textColor = REDCOLOR;
        _postageLab.font = [UIFont systemFontOfSize:8];
        _postageLab.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:_postageLab];
        
        UILabel *styleLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-220, 190+20+20+20+5+20+10+20, 200, 20)];
        styleLab.text = @"快递(附加运费200元)";
        styleLab.textColor = TEXTCOLOR;
        styleLab.font = [UIFont systemFontOfSize:15];
        styleLab.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:styleLab];
  
    }else{
        UILabel *styleLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-140, 190+20+20+20+5+20+10+20, 120, 20)];
        styleLab.text = @"快递 包邮";
        styleLab.textColor = TEXTCOLOR;
        styleLab.font = [UIFont systemFontOfSize:15];
        styleLab.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:styleLab];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectAdressViewController *select = [[SelectAdressViewController alloc]init];
    [self.navigationController pushViewController:select animated:YES];    
}

#pragma mark - 购买产品图片及规格信息
- (void)createProInfoView{
    UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 180+25, 120, 80)];
    [imaInfoView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
    imaInfoView.layer.cornerRadius = 3;
    imaInfoView.clipsToBounds = YES;
    [self.view addSubview:imaInfoView];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 200, 100, 20)];
    nameLab.text = @"SEELEEP";
    nameLab.textColor = BGCOLOR;
    nameLab.font = [UIFont systemFontOfSize:15];
    nameLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:nameLab];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+60+10, 200, 100, 20)];
    lab.text = @"小月智能枕";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
    
    UILabel *moonLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 190+30, 50, 20)];
    moonLab.text = @"小月1号";
    moonLab.textColor = TEXTCOLOR;
    moonLab.font = [UIFont systemFontOfSize:12];
    moonLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:moonLab];
    
    UILabel *sizeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10, 190+30, 50, 20)];
    sizeLab.text = @"豪华版";
    sizeLab.textColor = CAOGREENCOLOR;
    sizeLab.font = [UIFont systemFontOfSize:12];
    sizeLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:sizeLab];
    
    UILabel *editionLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+50+10+50, 190+30, 50, 20)];
    editionLab.text = @"GPS版";
    editionLab.textColor = CAOGREENCOLOR;
    editionLab.font = [UIFont systemFontOfSize:12];
    editionLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:editionLab];
    
    UILabel *typeLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 190+30+20, 100, 20)];
    typeLab.text = @"长150宽35高8cm";
    typeLab.textColor = CAOGREENCOLOR;
    typeLab.font = [UIFont systemFontOfSize:12];
    typeLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:typeLab];
    
    UILabel *colorLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+10, 190+30+20, 100, 20)];
    colorLab.text = @"米白色";
    colorLab.textColor = CAOGREENCOLOR;
    colorLab.font = [UIFont systemFontOfSize:12];
    colorLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:colorLab];
    
    UILabel *signLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10, 190+30+20+20+5, 100, 20)];
    signLab.text = @"¥";
    signLab.textColor = REDCOLOR;
    signLab.font = [UIFont systemFontOfSize:12];
    signLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:signLab];
    
    _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+10, 190+30+20+20+5, 100, 20)];
    _priceLab.text = @"1980";
    _priceLab.textColor = REDCOLOR;
    _priceLab.font = [UIFont systemFontOfSize:12];
    _priceLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_priceLab];
    
    UILabel *signNumLab = [[UILabel alloc]initWithFrame:CGRectMake(15+120+10+100+30, 190+30+20+20+5, 100, 20)];
    signNumLab.text = @"x";
    signNumLab.textColor = REDCOLOR;
    signNumLab.font = [UIFont systemFontOfSize:12];
    signNumLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:signNumLab];
    
    _numLab = [[UILabel alloc]initWithFrame:CGRectMake(25+120+10+100+30, 190+30+20+20+5, 100, 20)];
    _numLab.text = @"2";
    _numLab.textColor = REDCOLOR;
    _numLab.font = [UIFont systemFontOfSize:12];
    _numLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_numLab];
}


#pragma mark - 配送信息
- (void)createShipView{
    
    UILabel *shipLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 190+20+20+20+5+20+10+20, 100, 20)];
    shipLab.text = @"配送方式";
    shipLab.textColor = TEXTCOLOR;
    shipLab.font = [UIFont systemFontOfSize:15];
    shipLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:shipLab];
    
//    _temp = [_array[2] substringWithRange:NSMakeRange(0, 2)];
//    if (![_temp isEqual:@"中国"] && [_temp isEqual:@""]) {
//        UILabel *styleLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-140, 190+20+20+20+5+20+10+20, 120, 20)];
//        styleLab.text = @"快递(附加运费200元)";
//        styleLab.textColor = TEXTCOLOR;
//        styleLab.font = [UIFont systemFontOfSize:15];
//        styleLab.textAlignment = NSTextAlignmentRight;
//        [self.view addSubview:styleLab];
//    }else{
//        UILabel *styleLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-140, 190+20+20+20+5+20+10+20, 120, 20)];
//        styleLab.text = @"快递 包邮";
//        styleLab.textColor = TEXTCOLOR;
//        styleLab.font = [UIFont systemFontOfSize:15];
//        styleLab.textAlignment = NSTextAlignmentRight;
//        [self.view addSubview:styleLab];
//    }
    
    int tempNum = 2;
    UILabel *inFoLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, 190+20+20+20+5+20+40+10+20, 100, 20)];
    inFoLab.text = [NSString stringWithFormat:@"共%d件商品  合计:",tempNum];
    inFoLab.textColor = TEXTCOLOR;
    inFoLab.font = [UIFont systemFontOfSize:12];
    inFoLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:inFoLab];
    
    UILabel *signTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2+100, 190+20+20+20+5+20+40+10+20, 13, 20)];
    signTotalLab.text = @"¥";
    signTotalLab.textColor = REDCOLOR;
    signTotalLab.font = [UIFont systemFontOfSize:13];
    signTotalLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:signTotalLab];
    
  
    int a = [_priceLab.text intValue] * [_numLab.text intValue];
    NSString *temp = [NSString stringWithFormat:@"%d",a];

    
    UILabel *totalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2+100+13, 190+20+20+20+5+20+40+10+20, 200, 20)];
    totalLab.text = temp;
    totalLab.textColor = REDCOLOR;
    totalLab.font = [UIFont systemFontOfSize:13];
    totalLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:totalLab];
    
    UILabel *couponLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 190+20+20+20+5+20+40+10+5+20+10+20+10, 110, 20)];
    couponLab.text = @"使用小月优惠券:";
    couponLab.textColor = TEXTCOLOR;
    couponLab.font = [UIFont systemFontOfSize:13];
    couponLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:couponLab];
    
    UILabel *couponPriLab = [[UILabel alloc]initWithFrame:CGRectMake(120, 190+20+20+20+5+20+40+10+5+20+20+10+10, 100, 20)];
    couponPriLab.text = @"暂无优惠卷";
    couponPriLab.textColor = TEXTTINTCOLOR;
    couponPriLab.font = [UIFont systemFontOfSize:13];
    couponPriLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:couponPriLab];
    
//    UILabel *couponPriLab = [[UILabel alloc]initWithFrame:CGRectMake(120, 190+20+20+20+5+20+40+10+5+20+20+10+10, 13, 20)];
//    couponPriLab.text = @"¥";
//    couponPriLab.textColor = REDCOLOR;
//    couponPriLab.font = [UIFont systemFontOfSize:13];
//    couponPriLab.textAlignment = NSTextAlignmentLeft;
//    [self.view addSubview:couponPriLab];
//    
//    UILabel *cPriLab = [[UILabel alloc]initWithFrame:CGRectMake(120+13, 190+20+20+20+5+20+40+10+5+20+20+10+10, 80, 20)];
//    cPriLab.text = @"50.00";
//    cPriLab.textColor = REDCOLOR;
//    cPriLab.font = [UIFont systemFontOfSize:13];
//    cPriLab.textAlignment = NSTextAlignmentLeft;
//    [self.view addSubview:cPriLab];
    
    UITextView *message = [[UITextView alloc]initWithFrame:CGRectMake(10, 190+20+20+20+5+20+40+10+5+20+20+20+10+10+10, WIDTH-20, 60)];
    message.textColor = TEXTTINTCOLOR;
    message.font = [UIFont systemFontOfSize:12];
    message.layer.borderWidth = 1.2;
    message.layer.borderColor = TEXTTINTCOLOR.CGColor;
    message.layer.masksToBounds = YES;
    message.text = @"给厂家留言";
    [self.view addSubview:message];
    
    UILabel *shouldLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 190+20+20+20+5+20+40+10+5+20+20+60+10+35+10+10, 80, 20)];
    shouldLab.text = @"应付总额:";
    shouldLab.textColor = TEXTCOLOR;
    shouldLab.font = [UIFont systemFontOfSize:15];
    shouldLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:shouldLab];
    
    UILabel *shouldTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(10+80, 190+20+20+20+5+20+20+40+10+5+20+10+60+10+35+10, 15, 20)];
    shouldTotalLab.text = @"¥";
    shouldTotalLab.textColor = REDCOLOR;
    shouldTotalLab.font = [UIFont systemFontOfSize:15];
    shouldTotalLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:shouldTotalLab];
  
    
    if ([_temp isEqual:@"中国" ] && [_temp isEqual:@"" ]) {
        int z = a ;
        UILabel *payTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(10+80+15, 190+20+20+20+5+20+20+40+10+5+20+10+60+10+35+10, 100, 20)];
        payTotalLab.text = [NSString stringWithFormat:@"%d",z];
        payTotalLab.textColor = REDCOLOR;
        payTotalLab.font = [UIFont systemFontOfSize:15];
        payTotalLab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:payTotalLab];
    }else{
        int z = a + 200;
        UILabel *payTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(10+80+15, 190+20+20+20+5+20+20+40+10+5+20+10+60+10+35+10, 100, 20)];
        payTotalLab.text = [NSString stringWithFormat:@"%d",z];
        payTotalLab.textColor = REDCOLOR;
        payTotalLab.font = [UIFont systemFontOfSize:15];
        payTotalLab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:payTotalLab];
    }
 
    
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.frame = CGRectMake(WIDTH-80, 190+20+20+20+5+20+40+10+5+20+10+60+5+35+20+10, 60, 30);
    payBtn.backgroundColor = REDCOLOR;
    payBtn.layer.cornerRadius = 3;
    payBtn.clipsToBounds = YES;
    payBtn.adjustsImageWhenHighlighted = NO;
    [payBtn setTitle:@"去付款" forState:UIControlStateNormal];
    [payBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
}

- (void)payBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"支付方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"支付宝支付" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //
        
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"微信支付" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //
        
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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
