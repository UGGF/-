//
//  AddFriendViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "AddFriendViewController.h"
#import "LookPermissonTableViewCell.h"

@interface AddFriendViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_headerArr;
    NSArray *_lookArr;
    
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    _headerArr= @[@"我管理的设备查看权限",@"他的设备查看权限"];
    _lookArr = @[@"姐姐的设备",@"我的设备",@"妈妈设备"];
    [self createNavBar];
    [self createContentView];
    [self createTableView];
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
    title.text = @"添加好友";
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
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(WIDTH-70, 15, 60, 20);
    sendBtn.clipsToBounds = YES;
    sendBtn.adjustsImageWhenHighlighted = NO;
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:sendBtn];
    
    
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendBtnClick{

    
}



#pragma mark - 内容视图
- (void)createContentView{
    UIView *permissionView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT/7)];
    permissionView.backgroundColor = WHITECOLOR;
    [self.view addSubview:permissionView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [permissionView addSubview:line];
    
    UILabel *waitLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, WIDTH-20, 20)];
    waitLab.numberOfLines = 0;
    waitLab.text = @"你需要发送验证申请,等待对方通过";
    waitLab.textColor = TEXTTINTCOLOR;
    waitLab.font = [UIFont systemFontOfSize:10];
    waitLab.textAlignment = NSTextAlignmentLeft;
    [permissionView addSubview:waitLab];
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(20, HEIGHT/7-40, WIDTH-20, 30)];
    textF.placeholder = @"对方需要你填写验证信息";
    textF.delegate = self;
    textF.layer.borderColor = TEXTCOLOR.CGColor;
    [permissionView addSubview:textF];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/7-2, WIDTH, 2)];
    line1.backgroundColor = LINECOLOR;
    [permissionView addSubview:line1];
}


#pragma mark - tableview的创建和相关代理
- (void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70+HEIGHT/7, WIDTH, HEIGHT-70-HEIGHT/7-HEIGHT/7)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50;
    [self.view addSubview:self.tableView];
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-HEIGHT/7, WIDTH, HEIGHT/7)];
    bottomView.backgroundColor = WHITECOLOR;
    [self.view addSubview:bottomView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, WIDTH/2, 20)];
    lab.text = @"小月之家评论权限";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [bottomView addSubview:lab];
    
    
    UISwitch *commentSwit = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-20-50, 20, 0, 0)];
    [commentSwit setOn:YES animated:YES];
    [commentSwit addTarget:self action:@selector(commentSwitChange:) forControlEvents:UIControlEventValueChanged];
    [bottomView addSubview:commentSwit];
}

- (void)commentSwitChange:(UISwitch *)sender{
    BOOL isSwitchOn = [sender isOn];
    if (isSwitchOn) {
        NSLog(@"哈哈");
    }else{
        NSLog(@"呵呵");
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _headerArr.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/14)];
    cicView.backgroundColor = WHITECOLOR;
    [self.view addSubview:cicView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH/2, 20)];
    lab.text = _headerArr[section];
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];

    return cicView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 2;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"LookPermissonTableViewCell";
    LookPermissonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.lookLab.text = _lookArr[indexPath.row];
    [cell.onSwitch addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventValueChanged];
    
    if (indexPath.section == 1) {
        cell.onSwitch.hidden = YES;
        UIButton *applicationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        applicationBtn.frame = CGRectMake(WIDTH-20-40, 15, 40, 20);
        applicationBtn.backgroundColor = TEXTTINTCOLOR;
        applicationBtn.layer.cornerRadius = 3;
        [applicationBtn setTitle:@"申请" forState:UIControlStateNormal];
        [applicationBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        applicationBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [applicationBtn addTarget:self action:@selector(applicationBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:applicationBtn];
        
    }
    
    return cell;
}

- (void)changeState:(UISwitch *)sender{
    BOOL isSwitchOn = [sender isOn];
    if (isSwitchOn) {
        NSLog(@"On");
    }else{
        NSLog(@"Off");
    }
}

- (void)applicationBtnClick{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
