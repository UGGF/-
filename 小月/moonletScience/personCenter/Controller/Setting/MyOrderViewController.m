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

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIView *blueView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSString *signStr;
@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
     [self createTableView];
    [self createPayStatusView];
   
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
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *statusView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT/14)];
    statusView.clipsToBounds = YES;
    statusView.backgroundColor = WHITECOLOR;
    [self.view addSubview:statusView];
    
    NSArray *payArr = @[@"已支付",@"支付失败",@"未支付"];
    for (int i = 0; i < payArr.count; i++) {
        self.signStr = @"200";
        UIButton *statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        statusBtn.frame = CGRectMake(i*WIDTH/3, 72, WIDTH/3, HEIGHT/14);
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
    
    self.blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14-4, WIDTH/3, 3)];
    self.blueView.backgroundColor = BGCOLOR;
    [self.view addSubview:self.blueView];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14-1, WIDTH, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
}

- (void)statusBtnClick:(UIButton *)sender{
    self.blueView.frame =  CGRectMake((sender.tag-200)*WIDTH/3,  72+HEIGHT/14-4, WIDTH/3, 3);
    switch (sender.tag) {
        case 200:
        {
            self.signStr = @"200";
            [self.tableView reloadData];
        }
            break;
        case 201:
        {
            self.signStr = @"201";
            [self.tableView reloadData];
            
        }
            break;
        case 202:
        {
            self.signStr = @"202";
            NSLog(@"self.signStr 的值是 %@",self.signStr);
            [self.tableView reloadData];
            
        }
            break;
    }

}

#pragma mark - tableview的创建和相关代理方法实现
- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14, WIDTH, HEIGHT-70-2-HEIGHT/14)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = WHITECOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.signStr isEqualToString:@"200"]) {
        return 2;
    }else if ([self.signStr isEqualToString:@"201"]){
        return 3;
    }else if ([self.signStr isEqualToString:@"202"]){
        return 4;
    }else{
        return 0;
    }
   
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"MyOrderTableViewCell";
    MyOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetailViewController *oder = [[OrderDetailViewController alloc]init];
    [self.navigationController pushViewController:oder animated:YES];
}



- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deletAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
        
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
