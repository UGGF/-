//
//  ResetNumPwdViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/27.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ResetNumPwdViewController.h"
#import "ResetNumPwdTableViewCell.h"
#import "AgainSetPwdViewController.h"
#import "CloseNumPwdViewController.h"

@interface ResetNumPwdViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong) NSArray *arr;
@end

@implementation ResetNumPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    self.arr = @[@"重置数字密码",@"数字密码"];
    [self createTableView];
    [self createBottomView];
    
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
    title.text = @"数字密码";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - tableview的创建及相关代理实现
- (void)createTableView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, 104)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview的代理方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ResetNumPwdTableViewCell";
    ResetNumPwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.myLab.text = _arr[indexPath.row];
    cell.myLab.textColor = TEXTCOLOR;
    
    for (int i = 0; i < 2; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 50+50*i, WIDTH, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [_tableView addSubview:line];
    }
    
    
    if (indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        UISwitch *swit = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-60, 10, 40, 30)];
        [swit setOn:YES];
        [swit addTarget:self action:@selector(switClick:) forControlEvents:UIControlEventValueChanged];
        [cell addSubview:swit];
    }
    
    return cell;
}

- (void)switClick:(UISwitch *)sender{
    BOOL isSwitOn = [sender isOn];
    if (isSwitOn) {
        NSLog(@"on");
    }else{
        NSLog(@"off");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"关闭数字密码会使设备数据失去安全保障\n确定关闭吗?" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //
            CloseNumPwdViewController *close = [[CloseNumPwdViewController alloc]init];
            [self.navigationController pushViewController:close animated:YES];
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - 底部相关视图
- (void)createBottomView{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 70+100, WIDTH-40, 70)];
    lab.numberOfLines = 0;
    lab.text = @"数字密码可以保障您的设备安全，防止他人恶意篡改您的设备数据和权限。当您的手机无法接收验证码时，可以使用此处设定的数字密码来重新绑定手机。";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
    
    UILabel *botLab = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT-70, WIDTH-40, 20)];
    botLab.numberOfLines = 0;
    botLab.textColor = TEXTTINTCOLOR;
    botLab.font = [UIFont systemFontOfSize:12];
    botLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:botLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"如无法自助完成，请至反馈申诉提交诉求内容"];
    NSRange range1 = [[botString string]rangeOfString:@"反馈申诉"];
    [botString addAttribute:NSForegroundColorAttributeName value:CAOGREENCOLOR range:range1];
    botLab.attributedText = botString;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            AgainSetPwdViewController *again = [[AgainSetPwdViewController alloc]init];
            [self.navigationController pushViewController:again animated:YES];
        }
            break;
            
        default:
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
