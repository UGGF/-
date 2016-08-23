//
//  ShopCarViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/20.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ShopCarViewController.h"
#import "ShopCarTableViewCell.h"
#import "SureBuyViewController.h"

@interface ShopCarViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
}
@end

@implementation ShopCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createTableView];
    [self createBottomView];

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
    title.text = @"购物车";
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

#pragma mark - tableview的创建和相关代理方法实现
- (void)createTableView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT-70-2-50)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = SLIVERYCOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    

}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ShopCarTableViewCell";
    ShopCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
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

    //待同步数据的
    cell.sizeLab.text = @"豪华版";
    cell.typeLab.text = @"长150宽35高8cm";
    cell.colorLab.text = @"米白色";
    cell.priceLab.text = @"1980";
    cell.numLab.text = @"2";
    
    //删除不同cell中的数据的点击事件
    cell.deleteBtn.tag = indexPath.row + 1;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}


- (void)deleteBtnClick:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定删除该订单吗?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //点击确定按钮后的点击事件
        
       
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //待加  删除数组中的数据
        
        //删除行
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
}

#pragma mark - 底部视图
- (void)createBottomView{
    [_tableView reloadData];
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-50, WIDTH, 50)];
    bottomView.backgroundColor = WHITECOLOR;
    [self.view addSubview:bottomView];
    
    UILabel *shouldLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 80, 20)];
    shouldLab.text = @"应付总额:";
    shouldLab.textColor = TEXTCOLOR;
    shouldLab.font = [UIFont systemFontOfSize:15];
    shouldLab.textAlignment = NSTextAlignmentLeft;
    [bottomView addSubview:shouldLab];
    
    UILabel *shouldTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(15+80, 15, 15, 20)];
    shouldTotalLab.text = @"¥";
    shouldTotalLab.textColor = REDCOLOR;
    shouldTotalLab.font = [UIFont systemFontOfSize:15];
    shouldTotalLab.textAlignment = NSTextAlignmentLeft;
    [bottomView addSubview:shouldTotalLab];
    
    
    UILabel *payTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(10+80+15, HEIGHT-50+15, 100, 20)];
    payTotalLab.text = @"7920.00";
    payTotalLab.textColor = REDCOLOR;
    payTotalLab.font = [UIFont systemFontOfSize:15];
    payTotalLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:payTotalLab];


    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.frame = CGRectMake(WIDTH-80, 10, 60, 30);
    payBtn.backgroundColor = REDCOLOR;
    payBtn.layer.cornerRadius = 3;
    payBtn.clipsToBounds = YES;
    payBtn.adjustsImageWhenHighlighted = NO;
    [payBtn setTitle:@"去付款" forState:UIControlStateNormal];
    [payBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:payBtn];

}

- (void)payBtnClick{
    SureBuyViewController *sure = [[SureBuyViewController alloc]init];
    [self.navigationController pushViewController:sure animated:YES];
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
