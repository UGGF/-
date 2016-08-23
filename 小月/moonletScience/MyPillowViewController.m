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
    self.nameStr = @"程绍宇";
    self.infoStr = @",您好:\n未发现设备,请检查你是否绑定设备,如无设备可点击“购买设备”进行购买!";
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createPillowInfo];
    [self createBGLine];
    [self createDeviceListView];
    [self createManageView];
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
    unBindBtn.frame = CGRectMake(WIDTH-70, 15, 60, 20);
    unBindBtn.clipsToBounds = YES;
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [unBindBtn setTitle:@"设备绑定" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:15];
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

#pragma mark - 传说中的北京视图分割线
- (void)createBGLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/7, WIDTH, 2)];
    line1.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 74+HEIGHT/7*2, WIDTH, 6)];
    line2.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line2];
    
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(0, 80+HEIGHT/7*2+HEIGHT/7/3, WIDTH, 2)];
    line3.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line3];
    
    UIView *line4 = [[UIView alloc]initWithFrame:CGRectMake(0,  82+HEIGHT/7*2+HEIGHT/7/3+(HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2-2, WIDTH, 2)];
    line4.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line4];
    
    for (int i = 0; i < 2; i++) {
        UIView *line5 = [[UIView alloc]initWithFrame:CGRectMake(20, 82+HEIGHT/7*2+HEIGHT/7/3+30+i*(HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2, WIDTH-40, 2)];
        line5.backgroundColor = SLIVERYCOLOR;
        [self.view addSubview:line5];
    }
}



#pragma mark - 枕头客户的相关信息
- (void)createPillowInfo{
    /**   */
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT/7)];
    cicView.clipsToBounds = YES;
    [self.view addSubview:cicView];

    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(20, (HEIGHT/7-50)/2, 50, 50);
//    unBindBtn.backgroundColor = REDCOLOR;
    unBindBtn.layer.cornerRadius = 3;
    unBindBtn.clipsToBounds = YES;
    [unBindBtn setImage:[UIImage imageNamed:@"add_head_photo.png"] forState:UIControlStateNormal];
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [cicView addSubview:unBindBtn];

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10+80, (HEIGHT/7-50)/2+5, 200, 20)];
    lab.numberOfLines = 0;
    lab.text = self.nameStr;
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];
    
    UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(10+80, (HEIGHT/7-50)/2+20+5, 20, 20)];
//    [imaInfoView setImage:[UIImage imageNamed:<#(nonnull NSString *)#>]];
    imaInfoView.layer.cornerRadius = 3;
    imaInfoView.clipsToBounds = YES;
    [cicView addSubview:imaInfoView];
  
    self.desLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 74+HEIGHT/7, WIDTH-40, HEIGHT/7)];
    self.desLab.numberOfLines = 0;
    self.desLab.text = [NSString stringWithFormat:@"%@%@",self.nameStr,self.infoStr];
//    desLab.text =@"程少宇,您好:\n感谢你对小月科技(中国)有限公司的信任与支持!今始,将由我们著名的全球睡眠专家为你及家人提供健康睡眠科学护航!";
    self.desLab.textColor = TEXTCOLOR;
    self.desLab.font = [UIFont systemFontOfSize:13];
    self.desLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.desLab];
    
}

/**  设备列表视图 */
#pragma mark - 设备列表视图
- (void)createDeviceListView{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 80+HEIGHT/7*2, WIDTH-40, HEIGHT/7/3)];
    lab.numberOfLines = 0;
    lab.text = @"设备列表";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
    
    NSArray *arr = @[@"我使用的设备",@"我管理的设备"];
    for (int i = 0; i < arr.count; i++) {
        UILabel *listLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 82+HEIGHT/7*2+HEIGHT/7/3+i*(HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2,80, 30)];
        listLab.text = arr[i];
        listLab.textColor = TEXTCOLOR;
        listLab.font = [UIFont systemFontOfSize:13];
        listLab.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:listLab];
    }
    
    _useDeviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 82+HEIGHT/7*2+HEIGHT/7/3, WIDTH, (HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2-2)];
    _useDeviceView.clipsToBounds = YES;
    [self.view addSubview:_useDeviceView];
    
    /**  我使用的设备 可以改变的数据 */
    UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 120, 90)];
    [imaInfoView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
    imaInfoView.layer.cornerRadius = 3;
    imaInfoView.clipsToBounds = YES;
    [_useDeviceView addSubview:imaInfoView];

    if ([self.infoStr isEqualToString:@",您好:\n未发现设备,请检查你是否绑定设备,如无设备可点击“购买设备”进行购买!"]) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(140, 55, WIDTH-140, 20)];
        lab.text = @"暂无设备";
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:13];
        lab.textAlignment = NSTextAlignmentCenter;
        [_useDeviceView addSubview:lab];
        
        UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        buyBtn.frame = CGRectMake(140+(WIDTH-140)/2-WIDTH/3/2, 100, WIDTH/3, 20);
        buyBtn.backgroundColor = BGCOLOR;
        buyBtn.layer.cornerRadius = 3;
        buyBtn.clipsToBounds = YES;
        buyBtn.adjustsImageWhenHighlighted = NO;
        [buyBtn setTitle:@"购买设备" forState:UIControlStateNormal];
        [buyBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        buyBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        //    [unBindBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
        [_useDeviceView addSubview:buyBtn];
    }
}


#pragma mark - ManageView的创建
- (void)createManageView{
    _manageDeviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 82+HEIGHT/7*2+HEIGHT/7/3+(HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2, WIDTH, (HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2)];
    _manageDeviceView.clipsToBounds = YES;
    [self.view addSubview:_manageDeviceView];
    
    if ([self.infoStr isEqualToString:@",您好:\n未发现设备,请检查你是否绑定设备,如无设备可点击“购买设备”进行购买!"]) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH, 100)];
        lab.text = @"暂无管理的设备";
        lab.textColor = TEXTTINTCOLOR;
        lab.font = [UIFont systemFontOfSize:12];
        lab.textAlignment = NSTextAlignmentCenter;
        [_manageDeviceView addSubview:lab];
    }
}


#pragma mark - 页面加载刷新后跳回来的界面
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",self.infoStr);
    self.desLab.text = [NSString stringWithFormat:@"%@%@",self.nameStr,self.infoStr];;
    if ([self.infoStr isEqualToString:@",您好:\n感谢你对小月科技(中国)有限公司的信任与支持!今始,将由我们著名的全球睡眠专家为你及家人提供健康睡眠科学护航!"]){
        
//        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT/2, WIDTH-40, 120)];
//        lab.numberOfLines = 0;
//        lab.text = @"设备管理者设置成功!\n设备使用者暂未设置!";
//        lab.textColor = WHITECOLOR;
//        lab.font = [UIFont systemFontOfSize:15];
//        lab.textAlignment = NSTextAlignmentCenter;
//        [self.view addSubview:lab];
        
        [_useDeviceView removeFromSuperview];
        _useDeviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 82+HEIGHT/7*2+HEIGHT/7/3, WIDTH, (HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2-2)];
        _useDeviceView.tag = 123145;
        _useDeviceView.clipsToBounds = YES;
        [self.view addSubview:_useDeviceView];
        
        /**  我使用的设备 可以改变的数据 */
        UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 120, 90)];
        [imaInfoView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
        imaInfoView.layer.cornerRadius = 3;
        imaInfoView.clipsToBounds = YES;
        [_useDeviceView addSubview:imaInfoView];
        for (int i = 0; i < 4; i++) {
            /**  使用者 管理者 */
            self.deviceLabel = [[UILabel alloc]initWithFrame:CGRectMake(150+(i%2)*45, 30+10+(i/2)*(20+10), 40, 20)];
            self.deviceLabel.textColor = TEXTCOLOR;
            self.deviceLabel.tag = i + 2000;
            self.deviceLabel.font = [UIFont systemFontOfSize:13];
            self.deviceLabel.textAlignment = NSTextAlignmentLeft;
            [_useDeviceView addSubview:self.deviceLabel];
            if (i == 0) {
                self.deviceLabel.text = @"使用者";
            }else if (i == 2){
                self.deviceLabel.text = @"管理者";
            }else if (i == 1){
                self.deviceLabel.text = @"我";
            }else{
                self.deviceLabel.text = @"";
            }
        }
        
        UIButton *manageDevBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        manageDevBtn.frame = CGRectMake(150, 30+10+50+10, 60, 20);
        manageDevBtn.backgroundColor = TEXTTINTCOLOR;
        manageDevBtn.layer.cornerRadius = 3;
        manageDevBtn.clipsToBounds = YES;
        manageDevBtn.adjustsImageWhenHighlighted = NO;
        [manageDevBtn setTitle:@"设备管理" forState:UIControlStateNormal];
        [manageDevBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        manageDevBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [manageDevBtn addTarget:self action:@selector(manageDevBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_useDeviceView addSubview:manageDevBtn];
        
        [_manageDeviceView removeFromSuperview];
        _manageDeviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 82+HEIGHT/7*2+HEIGHT/7/3+(HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2, WIDTH, (HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2)];
        _manageDeviceView.clipsToBounds = YES;
        [self.view addSubview:_manageDeviceView];
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 32, WIDTH-40, (HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2-32)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_manageDeviceView addSubview:self.tableView];
        
    }
    
}

- (void)manageDevBtnClick:(UIButton *)sender{
    ManageDeviceViewController *dev = [[ManageDeviceViewController alloc]init];
    [self.navigationController pushViewController:dev animated:YES];
}

#pragma mark - tableView的相关代理方法
/**  tableView的相关代理方法 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (HEIGHT-82-HEIGHT/7*2-HEIGHT/7/3)/2-30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ManegeDeviceTableViewCell";
    ManegeDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
        [cell.infoImageView setImage:[UIImage imageNamed:@"select_commodity_pillow_small.png"]];
        cell.useLab.text = @"使用者";
        cell.manageLab.text = @"管理者";
        cell.manageDeviceBtn.layer.cornerRadius = 3;
        [cell.manageDeviceBtn setTitle:@"设备管理" forState:UIControlStateNormal];
        cell.manageDeviceBtn.backgroundColor = TEXTTINTCOLOR;
        
        /**  使用者管理者可改变的数据 */
        cell.userLabel.text = @"";
        cell.managerLabel.text = @"";

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
