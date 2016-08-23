//
//  MyPillowViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/29.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MyPillowViewController.h"
#import "ManegeDeviceTableViewCell.h"
#import "DeviceBindingViewController.h"
#import "ManageDeviceViewController.h"

@interface MyPillowViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_useDeviceView;
    UIView *_manageDeviceView;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation MyPillowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self requestMyPillowView];
    [self createKit];
    
}

-(void)requestMyPillowView
{
    session *danli = [session getInstance];
    [ZYHTTPRequest request:MY_DIVICE(danli.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            [self.headerImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[dict objectForKey:@"me"] objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiang_fang"]];
            self.nickName.text = [[dict objectForKey:@"me"] objectForKey:@"nick"];
            self.muMangerArray = [dict objectForKey:@"data"];
            self.resouceArray = [dict objectForKey:@"data"];
            self.tableView.frame = CGRectMake(0, 75 + 80 + 30 + 1, WIDTH, 150 + 100 * 3);
            self.bgScrollView.contentSize = CGSizeMake(WIDTH, 75 + 80 + 30 + 1 + 150 + 100 * 3 + 70);
            [self.tableView reloadData];
        }
    }];
}

-(void)createKit
{
    self.view.backgroundColor = RGBCOLOR(242, 242, 242);
    self.bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT)];
    self.bgScrollView.backgroundColor = RGBCOLOR(242, 242, 242);
    [self.view addSubview:self.bgScrollView];
    
    UIView *headerBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 1, WIDTH, 70)];
    headerBgView.backgroundColor = WHITECOLOR;
    [self.bgScrollView addSubview:headerBgView];
    
    self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 60, 60)];
    self.headerImage.image = [UIImage imageNamed:@"touxiang_fang"];
    [headerBgView addSubview:self.headerImage];
    
    self.nickName = [[UILabel alloc]initWithFrame:CGRectMake(80, 6, WIDTH - 90, 20)];
    self.nickName.text = @"放得开连锁店";
    self.nickName.textAlignment = NSTextAlignmentLeft;
    self.nickName.font = [UIFont systemFontOfSize:16];
    self.nickName.textColor = TEXTCOLOR;
    [self.bgScrollView addSubview:self.nickName];
    
    UIView *middlebg = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, 80)];
    middlebg.backgroundColor = WHITECOLOR;
    [self.bgScrollView addSubview:middlebg];
    
    self.desLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, WIDTH - 20, 70)];
    self.desLab.numberOfLines = 0;
    self.desLab.text =@"程少宇,您好:\n感谢你对小月科技(中国)有限公司的信任与支持!今始,将由我们著名的全球睡眠专家为你及家人提供健康睡眠科学护航!";
    self.desLab.textColor = TEXTCOLOR;
    self.desLab.font = [UIFont systemFontOfSize:14];
    self.desLab.textAlignment = NSTextAlignmentLeft;
    [middlebg addSubview:self.desLab];
    
    UIView *downBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 72 + 80 + 3, WIDTH, 30)];
    downBgView.backgroundColor = WHITECOLOR;
    [self.bgScrollView addSubview:downBgView];
    
    UILabel *deviceList = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, WIDTH, 20)];
    deviceList.text = @"设备列表";
    deviceList.textColor = TEXTCOLOR;
    deviceList.font = [UIFont systemFontOfSize:16];
    deviceList.textAlignment = NSTextAlignmentLeft;
    [downBgView addSubview:deviceList];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 75 + 80 + 30 + 1, WIDTH, HEIGHT - 70 - 75 - 80 - 30 - 1)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bgScrollView addSubview:self.tableView];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    headerView.backgroundColor = WHITECOLOR;
    
    UILabel *myUseDevice = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, WIDTH - 20, 20)];
    myUseDevice.textColor = TEXTCOLOR;
    myUseDevice.text = @"我使用的设备";
    myUseDevice.textAlignment = NSTextAlignmentLeft;
    myUseDevice.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:myUseDevice];
    
    UIImageView *myPillowImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 80, 80)];
    myPillowImage.image = [UIImage imageNamed:@"touxiang_fang"];
    [headerView addSubview:myPillowImage];
    
    if (self.resouceArray) {
        UILabel *user = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, WIDTH - 110, 20)];
        user.text = @"使用者:我";
        user.textAlignment = NSTextAlignmentLeft;
        user.textColor = TEXTCOLOR;
        user.font = [UIFont systemFontOfSize:14];
        [headerView addSubview:user];
        
        UILabel *Managerial = [[UILabel alloc]initWithFrame:CGRectMake(100, 55, WIDTH - 110, 20)];
        Managerial.text = @"管理者:我";
        Managerial.textAlignment = NSTextAlignmentLeft;
        Managerial.textColor = TEXTCOLOR;
        Managerial.font = [UIFont systemFontOfSize:14];
        [headerView addSubview:Managerial];
        
        UIButton *setManger = [UIButton buttonWithType:UIButtonTypeCustom];
        setManger.frame = CGRectMake(100, 80, 80, 30);
        [setManger setTitle:@"设置管理" forState:UIControlStateNormal];
        setManger.titleLabel.font = [UIFont systemFontOfSize:14];
        setManger.titleLabel.textAlignment = NSTextAlignmentCenter;
        [setManger setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        setManger.layer.cornerRadius = 3;
        setManger.backgroundColor = TEXTTINTCOLOR;
        setManger.clipsToBounds = YES;
        [setManger addTarget:self action:@selector(setMangerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:setManger];
    }else
    {
        UILabel *noneDevice = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, WIDTH - 110, 20)];
        noneDevice.text = @"暂无设备";
        noneDevice.font = [UIFont systemFontOfSize:14];
        noneDevice.textAlignment = NSTextAlignmentCenter;
        noneDevice.textColor = TEXTCOLOR;
        [headerView addSubview:noneDevice];
        
        UIButton *buyDevice = [UIButton buttonWithType:UIButtonTypeCustom];
        buyDevice.frame = CGRectMake((WIDTH - 110) / 2 - 50 + 110, 80, 100, 30);
        [buyDevice setTitle:@"购买设备" forState:UIControlStateNormal];
        buyDevice.titleLabel.font = [UIFont systemFontOfSize:14];
        buyDevice.titleLabel.textAlignment = NSTextAlignmentCenter;
        [buyDevice setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        buyDevice.layer.cornerRadius = 3;
        buyDevice.backgroundColor = BGCOLOR;
        buyDevice.clipsToBounds = YES;
        [buyDevice addTarget:self action:@selector(buyDeviceBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:buyDevice];
    }
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 119, WIDTH, 1)];
    lineView.backgroundColor = GRAYCOLOR;
    [headerView addSubview:lineView];
    
    UILabel *mangerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 125, WIDTH - 20, 20)];
    mangerLabel.textColor = TEXTCOLOR;
    mangerLabel.text = @"我管理的设备";
    mangerLabel.textAlignment = NSTextAlignmentLeft;
    mangerLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:mangerLabel];
    
    return headerView;
}

-(void)setMangerBtnClick:(UIButton *)sender
{
    ManageDeviceViewController *dev = [[ManageDeviceViewController alloc]init];
    if (sender.tag == 2016) {
        dev.deviceId = [self.muMangerArray objectAtIndex:0];
    }
    [self.navigationController pushViewController:dev animated:YES];
}

-(void)buyDeviceBtnClick
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    
    
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    
    statusBarView.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:statusBarView];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"我的枕头";
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
    
    /** 设备绑定 */
    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(WIDTH-80, 0, 70, 50);
    unBindBtn.clipsToBounds = YES;
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [unBindBtn setTitle:@"设备绑定" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [unBindBtn addTarget:self action:@selector(unBindBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:unBindBtn];

    
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)unBindBtnClick{
    DeviceBindingViewController *device = [[DeviceBindingViewController alloc]init];
    [self.navigationController pushViewController:device animated:YES];
}

#pragma mark - 页面加载刷新后跳回来的界面
-(void)viewWillAppear:(BOOL)animated
{
    
}

#pragma mark - tableView的相关代理方法
/**  tableView的相关代理方法 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.muMangerArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ManegeDeviceTableViewCell";
    ManegeDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        lineView.backgroundColor = GRAYCOLOR;
        [cell addSubview:lineView];
    }
    
        [cell.infoImageView setImage:[UIImage imageNamed:@"touxiang_fang"]];
        cell.useLab.text = @"使用者:";
        cell.manageLab.text = @"管理者:";
        cell.manageDeviceBtn.layer.cornerRadius = 3;
        [cell.manageDeviceBtn setTitle:@"设备管理" forState:UIControlStateNormal];
        cell.manageDeviceBtn.backgroundColor = TEXTTINTCOLOR;
    [cell.manageDeviceBtn addTarget:self action:@selector(setMangerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.manageDeviceBtn.tag = 2016 + indexPath.row;
        /**  使用者管理者可改变的数据 */
        cell.userLabel.text = @"暂无使用者";
        cell.managerLabel.text = @"我";

    return cell;
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
