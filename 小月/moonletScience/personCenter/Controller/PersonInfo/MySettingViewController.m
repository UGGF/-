//
//  MySettingViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MySettingViewController.h"
#import "MySettingTableViewCell.h"
#import "SafeAccountViewController.h"
#import "ComplainViewController.h"
#import "MessageLogViewController.h"
#import "CommentPermissonViewController.h"

@interface MySettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UILabel *_lab;
    NSTimer *_timer;
    UIView *_currentView;
}
@end

@implementation MySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    _array = @[@"声音开关",@"账户与安全",@"消息记录",@"反馈申诉",@"版本更新",@"小月之家评论权限"];//,@"用户协议及隐私政策"
    [self creatTableView];
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
    title.text = @"我的设置";
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

- (void)creatTableView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, 50*_array.count)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

#pragma mark - tableView 
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"MySettingTableViewCell";
    MySettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.myLable.text = _array[indexPath.row];

    if (indexPath.row == 0){
        cell.accessoryType = UITableViewCellAccessoryNone ;
        UISwitch *swich = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-65, 10, 30, 20)];
        [swich setOn:YES];
        [swich addTarget:self action:@selector(swichChange:) forControlEvents:UIControlEventValueChanged];
        [cell addSubview:swich];
    }else if (indexPath.row == 4){
        UILabel *BLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-55, 15, 40, 20)];
        BLable.font = [UIFont systemFontOfSize:15];
        BLable.textAlignment = NSTextAlignmentCenter;
        BLable.backgroundColor = WHITECOLOR;
        BLable.text = @"1.03";
        BLable.textColor = TEXTTINTCOLOR;
        [cell addSubview:BLable];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(WIDTH-20, 15, 6, 6);
        btn.backgroundColor = [UIColor redColor];
        btn.layer.cornerRadius = 3;
        [cell addSubview:btn];
    }
    return cell;
}

/** switch按钮点击事件 */
- (void)swichChange:(UISwitch *)sender{
    BOOL isSwitchOn = [sender isOn];
    if (isSwitchOn) {
        NSLog(@"芝麻芝麻,开门!");
    }else{
        NSLog(@"芝麻芝麻,关门");
    }
}



- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:
        {
            SafeAccountViewController *safe = [[SafeAccountViewController alloc]init];
            [self.navigationController pushViewController:safe animated:YES];
        }
            break;
        case 2:
        {
            MessageLogViewController *message = [[MessageLogViewController alloc]init];
            [self.navigationController pushViewController:message animated:YES];
        }
            break;
        case 3:
        {
            ComplainViewController *complain = [[ComplainViewController alloc]init];
            [self.navigationController pushViewController:complain animated:YES];
        }
            break;
            
        case 4:
        {
           UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"检测到新版本" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"稍后再说" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
               _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:NO];
                
                _currentView = [[UIView alloc]initWithFrame:CGRectMake(20, 80, WIDTH-40, 30)];
                _currentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
//                currentView.alpha =0.9;
                [self.view addSubview:_currentView];
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH-40, 30)];
                lab.text = @"当前已是最新版本";
                lab.textColor = WHITECOLOR;
                lab.font = [UIFont systemFontOfSize:10];
                lab.textAlignment = NSTextAlignmentCenter;
                [_currentView addSubview:lab];

                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        default:
            break;
        case 5:
        {
            CommentPermissonViewController *comment = [[CommentPermissonViewController alloc]init];
            [self.navigationController pushViewController:comment animated:YES];
        }
            break;
    }
}

- (void)timeChange:(NSTimer *)sender{
    [_timer invalidate];
    [_currentView removeFromSuperview];
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
