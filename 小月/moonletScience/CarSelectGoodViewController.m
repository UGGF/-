//
//  CarSelectGoodViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/20.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "CarSelectGoodViewController.h"
#import "CarSelectGoodTableViewCell.h"

@interface CarSelectGoodViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UILabel *_numLab;
    UIView *_popView;
    int a ;
}


@end

@implementation CarSelectGoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createImaView];
    _array = @[@"配置规格",@"配置版本",@"尺寸型号",@"选择颜色",@"购买数量"];
    [self createTableView];
    [self createPopView];
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
    title.text = @"选择商品1";
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

#pragma mark - 产品图片展示视图
- (void)createImaView{
    //线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    //背景视图
    UIImageView *imaView = [[UIImageView alloc]initWithFrame:CGRectMake(10,80,200,120 )];
    imaView.backgroundColor = REDCOLOR;
    [imaView setImage:[UIImage imageNamed:@"select_commodity_pillow.png"]];
    imaView.layer.cornerRadius = 3;
    imaView.clipsToBounds = YES;
    [self.view addSubview:imaView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-100, 70+20, 80, 10)];
    lab.text = @"SEELEEP";
    lab.textColor = BGCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-100, 70+30+10, 80, 10)];
    lab1.text = @"小月智能枕";
    lab1.textColor = TEXTCOLOR;
    lab1.font = [UIFont systemFontOfSize:15];
    lab1.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-100, 70+30+20+20, 80, 10)];
    lab2.text = @"小月1号";
    lab2.textColor = TEXTCOLOR;
    lab2.font = [UIFont systemFontOfSize:15];
    lab2.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab2];
    
    UILabel *lab3 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-100, 70+30+20+20+30,80, 10)];
    lab3.text = @"￥2980";
    lab3.textColor = REDCOLOR;
    lab3.font = [UIFont systemFontOfSize:15];
    lab3.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab3];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 210, WIDTH, 5)];
    line2.backgroundColor = LINECOLOR;
    [self.view addSubview:line2];
    
}

#pragma mark - tableView的详细内容
- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 215, WIDTH, 300)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CarSelectGoodTableViewCell";
    CarSelectGoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.myLable.text = _array[indexPath.row];
    cell.myLable.textColor = TEXTTINTCOLOR;
    for (int i = 0; i < 5; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(10, 55+60*i, WIDTH, 2)];
        line.backgroundColor = LINECOLOR;
        [_tableView addSubview:line];
    }
    if (indexPath.row == 0) {
        //配置规格的按钮
        NSArray *sizeArr = @[@"豪华版",@"精装版"];
        for (int i = 0; i < 2; i++) {
            UIButton *_sizeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _sizeBtn.frame = CGRectMake(10+i*(50+10), 22, 50, 25);
            _sizeBtn.layer.cornerRadius = 3;
            _sizeBtn.clipsToBounds = YES;
            _sizeBtn.tag = i+1;
            [_sizeBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
            [_sizeBtn setTitleColor:WHITECOLOR forState:UIControlStateSelected];
            if ( i == 0) {
                _sizeBtn.selected= YES;
                _sizeBtn.backgroundColor = CAOGREENCOLOR;
                
            }
            _sizeBtn.adjustsImageWhenHighlighted = NO;
            _sizeBtn.layer.borderWidth = 1.2;
            _sizeBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
            _sizeBtn.layer.masksToBounds = YES;
            [_sizeBtn setTitle:sizeArr[i] forState:UIControlStateNormal];
            _sizeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [_sizeBtn addTarget:self action:@selector(sizeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tableView addSubview:_sizeBtn];
        }
    }else if (indexPath.row == 1){
        //配置版本的按钮
        NSArray *editionArr = @[@"GSP版"];
        for (int i = 0; i < 1; i++) {
            UIButton *_editionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _editionBtn.frame = CGRectMake(10+i*(50+10), 22+60, 50, 25);
            _editionBtn.layer.cornerRadius = 3;
            _editionBtn.clipsToBounds = YES;
            _editionBtn.selected = YES;
            _editionBtn.tag = i+10;
            [_editionBtn setTitleColor:WHITECOLOR forState:UIControlStateSelected];
            _editionBtn.backgroundColor = CAOGREENCOLOR;
            _editionBtn.adjustsImageWhenHighlighted = NO;
            _editionBtn.layer.borderWidth = 1.2;
            _editionBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
            _editionBtn.layer.masksToBounds = YES;
            [_editionBtn setTitle:editionArr[i] forState:UIControlStateNormal];
            _editionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            //            [_editionBtn addTarget:self action:@selector(editionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tableView addSubview:_editionBtn];
        }
    }else if (indexPath.row == 2){
        //尺寸型号的按钮
        NSArray *typeArr = @[@"长120宽35高8(CM)",@"长150宽35高8(CM)"];
        for (int i = 0; i < 2; i++) {
            UIButton *_typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _typeBtn.frame = CGRectMake(10+i*(120+10), 22+60+60, 120, 25);
            _typeBtn.layer.cornerRadius = 3;
            _typeBtn.clipsToBounds = YES;
            _typeBtn.adjustsImageWhenHighlighted = NO;
            _typeBtn.layer.borderWidth = 1.2;
            _typeBtn.tag = i+20;
            [_typeBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
            [_typeBtn setTitleColor:WHITECOLOR forState:UIControlStateSelected];
            if ( i == 0) {
                _typeBtn.selected= YES;
                _typeBtn.backgroundColor = CAOGREENCOLOR;
                
            }
            _typeBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
            _typeBtn.layer.masksToBounds = YES;
            [_typeBtn setTitle:typeArr[i] forState:UIControlStateNormal];
            _typeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [_typeBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tableView addSubview:_typeBtn];
        }
    }else if (indexPath.row == 3){
        //选择颜色的按钮
        NSArray *colorArr = @[@"橙色",@"灰色",@"蓝色",@"米白色"];
        for (int i = 0; i < 4; i++) {
            UIButton *_colorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _colorBtn.frame = CGRectMake(10+i*(50+10), 22+60+60+60, 50, 25);
            _colorBtn.layer.cornerRadius = 3;
            _colorBtn.clipsToBounds = YES;
            _colorBtn.tag = i+30;
            [_colorBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
            [_colorBtn setTitleColor:WHITECOLOR forState:UIControlStateSelected];
            if ( i == 0) {
                _colorBtn.selected= YES;
                _colorBtn.backgroundColor = CAOGREENCOLOR;
                
            }
            _colorBtn.adjustsImageWhenHighlighted = NO;
            _colorBtn.layer.borderWidth = 1.2;
            _colorBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
            _colorBtn.layer.masksToBounds = YES;
            [_colorBtn setTitle:colorArr[i] forState:UIControlStateNormal];
            _colorBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [_colorBtn addTarget:self action:@selector(colorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tableView addSubview:_colorBtn];
        }
    }else if (indexPath.row ==4){
        //购买数量的按钮
        NSArray *numArr = @[@"-",@"+"];
        for (int i = 0; i < 2; i++) {
            UIButton *numBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            numBtn.frame = CGRectMake(10+i*(30+32), 22+60+60+60+60, 30, 25);
            //            numBtn.layer.cornerRadius = 3;
            numBtn.clipsToBounds = YES;
            numBtn.adjustsImageWhenHighlighted = NO;
            numBtn.layer.borderWidth = 1.2;
            numBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
            numBtn.layer.masksToBounds = YES;
            numBtn.tag = i+40;
            [numBtn setTitle:numArr[i] forState:UIControlStateNormal];
            [numBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
            numBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [numBtn addTarget:self action:@selector(numBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tableView addSubview:numBtn];
        }
        _numLab = [[UILabel alloc]initWithFrame:CGRectMake(10+30, 22+60*4, 32, 25)];
        _numLab.text = @"1";
        //        numLab.backgroundColor = BGCOLOR;
        _numLab.textColor = REDCOLOR;
        _numLab.layer.borderWidth = 1.2;
        _numLab.layer.borderColor = TEXTTINTCOLOR.CGColor;
        _numLab.font = [UIFont systemFontOfSize:12];
        _numLab.textAlignment = NSTextAlignmentCenter;
        [_tableView addSubview:_numLab];
        
        int num = 6666;
        UILabel *wordLab = [[UILabel alloc]initWithFrame:CGRectMake(10+30+40+30+10, 22+60*4-5, 120, 25)];
        wordLab.text = [NSString stringWithFormat:@"剩余%d件",num];
        wordLab.textColor = TEXTTINTCOLOR;
        wordLab.font = [UIFont systemFontOfSize:12];
        wordLab.textAlignment = NSTextAlignmentLeft;
        [_tableView addSubview:wordLab];
    }
    
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = CGRectMake(10, HEIGHT-47, WIDTH-20, 40);
    buyBtn.backgroundColor = REDCOLOR;
    buyBtn.layer.cornerRadius = 3;
    buyBtn.clipsToBounds = YES;
    buyBtn.adjustsImageWhenHighlighted = NO;
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [buyBtn addTarget:self action:@selector(buyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];
    
    
    return cell;
}


#pragma mark - 选择商品按钮相关点击事件
//配置规格选择点击事件
- (void)sizeBtnClick:(UIButton *)sender{
    sender.selected = YES;
    sender.backgroundColor = CAOGREENCOLOR;
    
    switch (sender.tag) {
        case 1:
        {
            UIButton *btn = [self.view viewWithTag:2];
            btn.selected = NO;
            btn.backgroundColor = WHITECOLOR;
        }
            break;
        case 2:
        {
            UIButton *btn = [self.view viewWithTag:1];
            btn.selected = NO;
            btn.backgroundColor = WHITECOLOR;
        }
            
    }
    
    
}

//尺寸型号选择点击事件
- (void)typeBtnClick:(UIButton *)sender{
    sender.selected = YES;
    sender.backgroundColor = CAOGREENCOLOR;

    switch (sender.tag) {
        case 20:
        {
            UIButton *btn = [self.view viewWithTag:21];
            btn.selected = NO;
            btn.backgroundColor = WHITECOLOR;
        }
            break;
        case 21:
        {
            UIButton *btn = [self.view viewWithTag:20];
            btn.selected = NO;
            btn.backgroundColor = WHITECOLOR;
        }
            
    }
    
    
}

//选择颜色选择点击事件
- (void)colorBtnClick:(UIButton *)sender{
    sender.selected = YES;
    sender.backgroundColor = CAOGREENCOLOR;
    
    switch (sender.tag) {
        case 30:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            UIButton *btn2 = [self.view viewWithTag:32];
            UIButton *btn3 = [self.view viewWithTag:33];
            
            btn1.selected = btn2.selected = btn3.selected = NO;
            btn1.backgroundColor = btn2.backgroundColor = btn3.backgroundColor = WHITECOLOR;
        }
            break;
        case 31:
        {
            UIButton *btn1 = [self.view viewWithTag:30];
            UIButton *btn2 = [self.view viewWithTag:32];
            UIButton *btn3 = [self.view viewWithTag:33];
            
            btn1.selected = btn2.selected = btn3.selected = NO;
            btn1.backgroundColor = btn2.backgroundColor = btn3.backgroundColor = WHITECOLOR;
        }
            break;
        case 32:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            UIButton *btn2 = [self.view viewWithTag:30];
            UIButton *btn3 = [self.view viewWithTag:33];
            
            btn1.selected = btn2.selected = btn3.selected = NO;
            btn1.backgroundColor = btn2.backgroundColor = btn3.backgroundColor = WHITECOLOR;
        }
            break;
        case 33:
        {
            UIButton *btn1 = [self.view viewWithTag:31];
            UIButton *btn2 = [self.view viewWithTag:32];
            UIButton *btn3 = [self.view viewWithTag:30];
            
            btn1.selected = btn2.selected = btn3.selected = NO;
            btn1.backgroundColor = btn2.backgroundColor = btn3.backgroundColor = WHITECOLOR;
        }
            break;
    }
    
}

//选择数量按钮的点击事件
- (void)numBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 40:
        {
            if ([_numLab.text isEqualToString:@"1"]) {
                
            }else{
                a = [_numLab.text intValue];
                a -= 1;
                _numLab.text = [NSString stringWithFormat:@"%d",a];
            }
        }
            break;
        case 41:
        {
            a = [_numLab.text intValue];
            a += 1;
            _numLab.text = [NSString stringWithFormat:@"%d",a];
        }
            break;
            
    }
    
}


#pragma mark - 加入购物车弹出视图
- (void)createPopView{
    _popView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _popView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:_popView];
    _popView.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapChange:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [_popView addGestureRecognizer:tap];

    UIButton *shopCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopCarBtn.frame = CGRectMake(20, HEIGHT/2, WIDTH-40, 40);
    shopCarBtn.backgroundColor = WHITECOLOR;
    shopCarBtn.layer.cornerRadius = 3;
    shopCarBtn.clipsToBounds = YES;
    shopCarBtn.adjustsImageWhenHighlighted = NO;
    [shopCarBtn setTitle:@"恭喜，已加入购物车" forState:UIControlStateNormal];
    [shopCarBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    shopCarBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [shopCarBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [_popView addSubview:shopCarBtn];
}

- (void)tapChange:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired == 1) {
        [_popView removeFromSuperview];
    }
}

#pragma mark - 加入购物车点击事件
- (void)joinShipClick:(UIButton *)sender{
    _popView.hidden = NO;
    
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
