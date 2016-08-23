//
//  DevicePermissionViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "DevicePermissionViewController.h"
#import "ReportDetailTableViewCell.h"
#import "OpenReportViewController.h"
#import "CloseReportViewController.h"

@interface DevicePermissionViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation DevicePermissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    self.dataArr = @[@"报告可关闭对象",@"报告可开放对象",@"提醒谁看"];
    [self createNavBar];
    [self createImageView];
    [self createTableView];
    [self createRelativeView];
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
    title.text = @"设备权限";
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

- (void)createImageView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, (HEIGHT-70)/4)];
    cicView.clipsToBounds = YES;
//    cicView.backgroundColor = SLIVERYCOLOR;
    cicView.backgroundColor = WHITECOLOR;
    [self.view addSubview:cicView];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 80, 80)];
    [image setImage:[UIImage imageNamed:@"add_head_photo.png"]];
    image.layer.cornerRadius = 40;
    [cicView addSubview:image];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(115, 30, WIDTH/2, 20)];
    nameLab.text = @"米吉尔的鸡";
    nameLab.textColor = TEXTCOLOR;
    nameLab.font = [UIFont systemFontOfSize:15];
    nameLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:nameLab];
    
    UILabel *signLab = [[UILabel alloc]initWithFrame:CGRectMake(115, 70, WIDTH/2, 20)];
    signLab.text = @"奶奶";
    signLab.textColor = TEXTTINTCOLOR;
    signLab.font = [UIFont systemFontOfSize:12];
    signLab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:signLab];

}

#pragma mark - tableView的创建和相关代理实现
- (void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72+(HEIGHT-70)/4, WIDTH, (HEIGHT-70)/4)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = (HEIGHT-70)/4/3;
    [self.view addSubview:self.tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ReportDetailTableViewCell";
    ReportDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.reportLab.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            CloseReportViewController *close = [[CloseReportViewController alloc]init];
            [self.navigationController pushViewController:close animated:YES];
        }
            break;
        case 1:
        {
            OpenReportViewController *open = [[OpenReportViewController alloc]init];
            [self.navigationController pushViewController:open animated:YES];
        }
            break;
        case 2:
        {
            
        }
            break;
    }
}

#pragma mark - 至亲榜页面
- (void)createRelativeView{
    UIView *relativeView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+(HEIGHT-70)/2, WIDTH, (HEIGHT-70)/6)];
    relativeView.clipsToBounds = YES;
    [self.view addSubview:relativeView];
    
    UILabel *relativeLab = [[UILabel alloc]initWithFrame:CGRectMake(20, (HEIGHT-70)/6/2-25, WIDTH/2-20, 20)];
    relativeLab.text = @"加入至亲榜";
    relativeLab.textColor = TEXTCOLOR;
    relativeLab.font = [UIFont systemFontOfSize:15];
    relativeLab.textAlignment = NSTextAlignmentLeft;
    [relativeView addSubview:relativeLab];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, (HEIGHT-70)/6/2+5, WIDTH-40, 20)];
    lab.text = @"至亲榜相关人的头像及睡眠报告将在首页呈现";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:10];
    lab.textAlignment = NSTextAlignmentLeft;
    [relativeView addSubview:lab];
    
    NSArray *judgeArr = @[@"是",@"否"];
    for (int i = 0; i < judgeArr.count; i++) {
        UILabel *judgeLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20-80+i*60, (HEIGHT-70)/6/2-25, 20, 20)];
        judgeLab.text = judgeArr[i];
        judgeLab.textColor = TEXTCOLOR;
        judgeLab.font = [UIFont systemFontOfSize:15];
        judgeLab.textAlignment = NSTextAlignmentLeft;
        [relativeView addSubview:judgeLab];
        
        UIButton *judgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        judgeBtn.frame = CGRectMake(WIDTH-105-20+i*60, (HEIGHT-70)/6/2-25, 20, 20);
        judgeBtn.backgroundColor = TEXTTINTCOLOR;
        judgeBtn.layer.cornerRadius = 10;
        judgeBtn.tag = 90 + i;
        judgeBtn.selected = NO;
        judgeBtn.clipsToBounds = YES;
        judgeBtn.adjustsImageWhenHighlighted = NO;
        [judgeBtn addTarget:self action:@selector(judgeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [relativeView addSubview:judgeBtn];
    }
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, (HEIGHT-70)/6-2, WIDTH-40, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [relativeView addSubview:line];
}

- (void)judgeBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 90:
        {
            UIButton *btn = [self.view viewWithTag:91];
            btn.selected = !sender.tag;
            if (sender.selected) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
            }else{
                [btn setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [sender setImage:nil forState:UIControlStateNormal];
            }
            
        }
            break;
        case 91:
        {
            UIButton *btn = [self.view viewWithTag:90];
            btn.selected = !sender.tag;
            if (sender.selected) {
                [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [btn setImage:nil forState:UIControlStateNormal];
            }else{
                [btn setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
                [sender setImage:nil forState:UIControlStateNormal];
            }

        }
            break;

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
