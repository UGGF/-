//
//  MyOrderViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/16.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderTableViewCell.h"
#import "OrderDetailViewController.h"
#import "WaitPayTableViewCell.h"

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIView *blueView;
@property(nonatomic,strong)UITableView *AllTable;
@property(nonatomic,strong)UITableView *WaitPayTable;
@property(nonatomic,copy)NSString *signStr;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *PopView;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
     [self createTableView];
    [self createPayStatusView];
    self.AllTable.hidden = NO;;
   
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
    title.text = @"我的订单";
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

#pragma mark - 支付状态视图
- (void)createPayStatusView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    UIView *statusView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT/14)];
    statusView.clipsToBounds = YES;
    statusView.backgroundColor = WHITECOLOR;
    [self.view addSubview:statusView];
    
    NSArray *payArr = @[@"全部",@"待付款",@"代发货",@"待收货",@"已完成"];
    for (int i = 0; i < payArr.count; i++) {
        self.signStr = @"200";
        UIButton *statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        statusBtn.frame = CGRectMake(i*WIDTH/payArr.count, 72, WIDTH/payArr.count, HEIGHT/14);
        statusBtn.backgroundColor = WHITECOLOR;
        statusBtn.clipsToBounds = YES;
        statusBtn.tag = i+200;
        statusBtn.adjustsImageWhenHighlighted = NO;
        [statusBtn setTitle:payArr[i] forState:UIControlStateNormal];
        [statusBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        statusBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [statusBtn addTarget:self action:@selector(statusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:statusBtn];
    }
    
    self.blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14-4, WIDTH/payArr.count, 3)];
    self.blueView.backgroundColor = BGCOLOR;
    [self.view addSubview:self.blueView];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14-1, WIDTH, 2)];
    line1.backgroundColor = LINECOLOR;
    [self.view addSubview:line1];
}

- (void)statusBtnClick:(UIButton *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        self.blueView.frame =  CGRectMake((sender.tag-200)*WIDTH/5,  72+HEIGHT/14-4, WIDTH/5, 3);
    }];
    switch (sender.tag) {
        case 200:
        {
            self.signStr = @"200";
            self.AllTable.hidden = NO;
            self.WaitPayTable.hidden = YES;
            [self.AllTable reloadData];
        }
            break;
        case 201:
        {
            self.signStr = @"201";
            self.AllTable.hidden = YES;
            self.WaitPayTable.hidden = NO;
            [self.WaitPayTable reloadData];
            
        }
            break;
        case 202:
        {
            self.signStr = @"202";
            self.AllTable.hidden = NO;
            self.WaitPayTable.hidden = YES;
            NSLog(@"self.signStr 的值是 %@",self.signStr);
            [self.AllTable reloadData];
            
        }
            break;
    }

}

#pragma mark - tableview的创建和相关代理方法实现
- (void)createTableView{
    self.AllTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14, WIDTH, HEIGHT-70-2-HEIGHT/14)];
    self.AllTable.delegate = self;
    self.AllTable.dataSource = self;
    self.AllTable.backgroundColor = WHITECOLOR;
    self.AllTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.AllTable];
    self.AllTable.hidden = YES;
    
    
    self.WaitPayTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14, WIDTH, HEIGHT-70-2-HEIGHT/14)];
    self.WaitPayTable.delegate = self;
    self.WaitPayTable.dataSource = self;
    self.WaitPayTable.backgroundColor = WHITECOLOR;
    self.WaitPayTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.WaitPayTable];
    self.WaitPayTable.hidden = YES;
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.AllTable]) {
        return 2;
    }else{
        return 4;
    }
   
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.AllTable]) {
        return HEIGHT/4;
    }else{
        return HEIGHT/3;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:self.AllTable]) {
        static NSString *cellID1 = @"MyOrderTableViewCell";
        MyOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellID1 owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //固定的
        [cell.imaInfoView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
        cell.nameLab.text = @"SEELEEP";
        cell.lab.text = @"小月智能枕";
        cell.moonLab.text = @"小月1号";
        cell.editionLab.text = @"GPS版";
        cell.signLab.text = @"¥";
        cell.signNumLab.text = @"x";
        cell.priceTotalLab.text = @"合计:";
        
        //待同步数据的
        cell.sizeLab.text = @"豪华版";
        cell.typeLab.text = @"长150宽35高8cm";
        cell.colorLab.text = @"米白色";
        cell.priceLab.text = @"1980";
        cell.numLab.text = @"2";
        cell.timeLab.text = @"2016-03-01";
        cell.numTotalLab.text = @"¥3960.00";
        
        
        
        return cell;
        
    }else{
        static NSString *cellID = @"WaitPayTableViewCell";
        WaitPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //固定的
        [cell.imaInfoView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
        cell.nameLab.text = @"SEELEEP";
        cell.lab.text = @"小月智能枕";
        cell.moonLab.text = @"小月1号";
        cell.editionLab.text = @"GPS版";
        cell.signLab.text = @"¥";
        cell.signNumLab.text = @"x";
        cell.priceTotalLab.text = @"合计:";
        [cell.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        //待同步数据的
        cell.sizeLab.text = @"豪华版";
        cell.typeLab.text = @"长150宽35高8cm";
        cell.colorLab.text = @"米白色";
        cell.priceLab.text = @"1980";
        cell.numLab.text = @"2";
        cell.timeLab.text = @"2016-03-01";
        cell.numTotalLab.text = @"¥3960.00";
        
        
        
        
        return cell;
    }
   

}

- (void)cancelBtnClick{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:self.bgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.delegate = self;
    [self.bgView addGestureRecognizer:tap];
    
    self.PopView = [[UIView alloc]initWithFrame:CGRectMake(40, HEIGHT/6, WIDTH-80, HEIGHT/1.7)];
    self.PopView.backgroundColor = WHITECOLOR;
    self.PopView.layer.cornerRadius = 3;
    [self.bgView addSubview:self.PopView];
    
    NSArray *arr = @[@"不取消了",@"我不想买了",@"信息填写错误,重新拍",@"同城见面交易",@"其他原因"];
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
//        [warnBtn addTarget:self action:@selector(warnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.PopView addSubview:warnBtn];
        
    }
    
}


- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired== 1) {
        [_bgView removeFromSuperview];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetailViewController *oder = [[OrderDetailViewController alloc]init];
    [self.navigationController pushViewController:oder animated:YES];
}



- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.AllTable setEditing:editing animated:animated];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deletAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [self.AllTable deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];
    
    return @[deletAction];
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
