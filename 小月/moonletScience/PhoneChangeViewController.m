//
//  PhoneChangeViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "PhoneChangeViewController.h"
#import "PhoneChangeTableViewCell.h"
#import "TestPhoneViewController.h"
#import "TestMailViewController.h"
#import "NumberTestViewController.h"

@interface PhoneChangeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;

}

@end

@implementation PhoneChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    _array = @[@"原手机号验证更换",@"邮箱验证更换",@"数字密码验证更换"];
    [self creatTableView];
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
    title.text = @"更换手机号";
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



#pragma mark - tableView 视图
- (void)creatTableView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, _array.count*50+5)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


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
    static NSString *cellID = @"PhoneChangeTableViewCell";
    PhoneChangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.myLable.text = _array[indexPath.row];
    cell.myLable.textColor = BLACKTEXTCOLOR;
    cell.myLable.font = [UIFont systemFontOfSize:15];
    
    for (int i = 0; i < _array.count; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70+50*(i+1), WIDTH, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [self.view addSubview:line];
    }
    
    UILabel *botLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 72+_array.count*50+5, WIDTH, 20)];
    botLab.numberOfLines = 0;
    botLab.textColor = TEXTTINTCOLOR;
    botLab.font = [UIFont systemFontOfSize:10];
    botLab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:botLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:@"如无法自助完成，请至反馈申诉提交诉求内容"];
    NSRange range1 = [[botString string]rangeOfString:@"反馈申诉"];
    [botString addAttribute:NSForegroundColorAttributeName value:CAOGREENCOLOR range:range1];
    botLab.attributedText = botString;
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            TestPhoneViewController *test = [[TestPhoneViewController alloc]init];
            [self.navigationController pushViewController:test animated:YES];
        }
            break;
        case 1:
        {
            TestMailViewController *mail = [[TestMailViewController alloc]init];
            [self.navigationController pushViewController:mail animated:YES];
        }
            break;
        case 2:
        {
            NumberTestViewController *text = [[NumberTestViewController alloc]init];
            [self.navigationController pushViewController:text animated:YES];
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
