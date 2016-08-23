//
//  BindingAccountViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "BindingAccountViewController.h"
#import "BindingAccountTableViewCell.h"
#import "BindingNumberViewController.h"
#import "PhoneBindingViewController.h"
#import "MailBindingViewController.h"
#import "UnBindingViewController.h"
#import "QQBindingViewController.h"
#import "WeChatBindingViewController.h"
#import "MicroBlogBindingViewController.h"
#import "NumberPWDViewController.h"
#import "ResetNumPwdViewController.h"

@interface BindingAccountViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UILabel *_bindLable;
}
@end

@implementation BindingAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatTableView];
    _array = @[@"手机号",@"QQ",@"微信",@"新浪微博",@"邮箱",@"数字密码(用于保障设备安全)"];
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
    title.text = @"账户绑定";
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
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, 302)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];

}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"BindingAccountTableViewCell";
    BindingAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.MyLable.text = _array[indexPath.row];
    cell.MyLable.font = [UIFont systemFontOfSize:15];
    cell.MyLable.textColor = TEXTCOLOR;
    
    for (int i = 0; i < 6; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 50+50*i, WIDTH, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [_tableView addSubview:line];
    }

    _bindLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-200, 15, 170, 20)];
//        bindLable.backgroundColor = BGCOLOR;
    _bindLable.text = @"未绑定";
    _bindLable.textColor = TEXTTINTCOLOR;
    _bindLable.font = [UIFont systemFontOfSize:15];
    _bindLable.textAlignment = NSTextAlignmentRight;
    [cell addSubview:_bindLable];
   
    if (indexPath.row == 0) {
        [_bindLable removeFromSuperview];
        _bindLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-200, 15, 170, 20)];
        //        bindLable.backgroundColor = BGCOLOR;
        _bindLable.text = @"未绑定";
        _bindLable.textColor = REDCOLOR;
        _bindLable.font = [UIFont systemFontOfSize:15];
        _bindLable.textAlignment = NSTextAlignmentRight;
        [cell addSubview:_bindLable];
    }else if(indexPath.row == 5){
        [_bindLable removeFromSuperview];
        _bindLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-200, 15, 170, 20)];
        //        bindLable.backgroundColor = BGCOLOR;
        _bindLable.text = @"未开启";
        _bindLable.textColor = TEXTTINTCOLOR;
        _bindLable.font = [UIFont systemFontOfSize:15];
        _bindLable.textAlignment = NSTextAlignmentRight;
        [cell addSubview:_bindLable];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            
//            BindingNumberViewController *num = [[BindingNumberViewController alloc]init];
//            [self.navigationController pushViewController:num animated:YES];
            PhoneBindingViewController *phone = [[PhoneBindingViewController alloc]init];
            [self.navigationController pushViewController:phone animated:YES];
        }
            break;
        case 1:
        {
            QQBindingViewController *QQ = [[QQBindingViewController alloc]init];
            [self.navigationController pushViewController:QQ animated:YES];
        }
            break;
        case 2:
        {
            WeChatBindingViewController *wechat = [[WeChatBindingViewController alloc]init];
            [self.navigationController pushViewController:wechat animated:YES];
        }
            break;
        case 3:
        {
            MicroBlogBindingViewController *blog = [[MicroBlogBindingViewController alloc]init];
            [self.navigationController pushViewController:blog animated:YES];
        }
            break;
        case 4:
        {
//            MailBindingViewController *mailB = [[MailBindingViewController alloc]init];
//            [self.navigationController pushViewController:mailB animated:YES];
            UnBindingViewController *unBIN = [[UnBindingViewController alloc]init];
            [self.navigationController pushViewController:unBIN animated:YES];
        }
            break;
        case 5:
        {
//            NumberPWDViewController *num = [[NumberPWDViewController alloc]init];
//            [self.navigationController pushViewController:num animated:YES];
            ResetNumPwdViewController *reset = [[ResetNumPwdViewController alloc]init];
            [self.navigationController pushViewController:reset animated:YES];
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
