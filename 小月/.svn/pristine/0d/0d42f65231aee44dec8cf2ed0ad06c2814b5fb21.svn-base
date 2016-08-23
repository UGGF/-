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
#import "WXApi.h"
#import "AppDelegate.h"


//微信开发者ID
#define URL_APPID @"wx66b8aa5bd7630c85"
#define URL_SECRET @"bf7866dc93891c3c3362365211b5ad6f"


@interface BindingAccountViewController ()<UITableViewDataSource,UITableViewDelegate,WXApiDelegate>
{
    NSArray *_array;
}

@property (copy, nonatomic) void (^requestForUserInfoBlock)();
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSDictionary *diction;
@property(nonatomic,strong)NSArray *bindArr;

@end

@implementation BindingAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatTableView];
    _array = @[@"手机号",@"QQ",@"微信",@"新浪微博",@"邮箱"];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [self requestData];

}



- (void) requestData{
    session *danli = [session getInstance];
    [ZYHTTPRequest request:ACCOUNT_BINDING(danli.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        int stat = [[dict objectForKey:@"code"] intValue];
        
        if (stat == 500) {
            [self requestData];
        }else if (stat == 200){
            self.diction = dict;
            [self.tableView reloadData];
        }
        
    }];
    
    
    

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
    return 5;
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
    cell.MyLable.font = [UIFont systemFontOfSize:16];
    cell.MyLable.textColor = TEXTCOLOR;
    
    for (int i = 0; i < 5; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 50+50*i, WIDTH, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [self.tableView addSubview:line];
    }

    
    if (indexPath.row == 0) {
        cell.bindLab.textColor = REDCOLOR;
    }else{
        cell.bindLab.textColor = TEXTTINTCOLOR;
        
    }
//        bindLable.backgroundColor = BGCOLOR;
    NSString *str = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"weibo"]] ;
    NSString *QQstr = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"qq"]];
    NSString *WXstr = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"weixin"]] ;
    NSString *NumStr = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"name"]];
    NSString *MailStr = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"email"]];
    NSLog(@"-----%@--------",str);
    NSLog(@"---%@---",QQstr);
    
    self.bindArr = @[NumStr,QQstr,WXstr,str,MailStr];
    
    if (![self.bindArr[indexPath.row] isEqualToString:@"0"] && ![self.bindArr[indexPath.row] isEqualToString:@""])  {
        cell.bindLab.text = @"已绑定";
        
    }else{
        cell.bindLab.text = @"未绑定";

    }
    
 
    return cell;
}





- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            NSString *str = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"name"]] ;
            if (![str isEqualToString:@"0"]) {
                PhoneBindingViewController *phone = [[PhoneBindingViewController alloc]init];
                [self.navigationController pushViewController:phone animated:YES];
            }else{
                BindingNumberViewController *num = [[BindingNumberViewController alloc]init];
                [self.navigationController pushViewController:num animated:YES];
            }
            
        }
            break;
        case 1:
        {
            
            NSString *str = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"qq"]] ;
            if (![str isEqualToString:@"0"]) {
                QQBindingViewController *QQ = [[QQBindingViewController alloc]init];
                [self.navigationController pushViewController:QQ animated:YES];
            }else{
                [ShareSDK getUserInfo:SSDKPlatformTypeQQ
                       onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
                 {
                     if (state == SSDKResponseStateSuccess)
                     {
                         
                         NSLog(@"uid=%@",user.uid);
                         NSLog(@"%@",user.credential);
                         NSLog(@"token=%@",user.credential.token);
                         NSLog(@"nickname=%@",user.nickname);
                         
                         session *danli = [session getInstance];
                         [ZYHTTPRequest request:QQBINDING_URL(danli.token,user.credential.token) Completion:^(NSDictionary *dict) {
                             NSLog(@"%@",dict);
                             int stat = [[dict objectForKey:@"code"] intValue];
                             if (stat == 200) {
                                 [self requestData];

                                 
                             }
                             
                             
                             
                         }];
                         
                     }
                     
                     else
                     {
                         NSLog(@"%@",error);
                     }
                     
                 }];
            }
//
            }
            break;
        case 2:
        {
            NSString *str = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"weixin"]] ;
            if (![str isEqualToString:@"0"]) {
                WeChatBindingViewController *wechat = [[WeChatBindingViewController alloc]init];
                [self.navigationController pushViewController:wechat animated:YES];
            }else{
                [ShareSDK getUserInfo:SSDKPlatformTypeWechat
                       onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
                 {
                     if (state == SSDKResponseStateSuccess)
                     {
                         
                         NSLog(@"uid=%@",user.uid);
                         NSLog(@"%@",user.credential);
                         NSLog(@"token=%@",user.credential.token);
                         NSLog(@"nickname=%@",user.nickname);
                         
                         
                         session *danli = [session getInstance];
                         [ZYHTTPRequest request:WECHATBINDING_URL(danli.token,user.uid) Completion:^(NSDictionary *dict) {
                             NSLog(@"--微信---%@",dict);
                             int stat = [[dict objectForKey:@"code"] intValue];
                             if (stat == 200) {
                                 [self requestData];
                                 
                                 
                             }
                             
                             
                             
                         }];
                

                         
                         
                     }
                     
                     else
                     {
                         NSLog(@"%@",error);
                     }
                     
                 }];

//                session *danli = [session getInstance];
//                [ZYHTTPRequest request:WECHATUNBINDING_URL(danli.token, self.access_token) Completion:^(NSDictionary *dict) {
//                NSLog(@"%@",dict);
//                int stat = [[dict objectForKey:@"code"] intValue];
//                    if (stat == 200) {
//                        [self.navigationController popToRootViewControllerAnimated:YES];
//                
//                
//                }
//                
//
//                                             
//                }];
            }
            
          
        }
            break;
        case 3:
        {
          
            NSString *str = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"weibo"]] ;
            if (![str isEqualToString:@"0"]) {
                MicroBlogBindingViewController *blog = [[MicroBlogBindingViewController alloc]init];
                [self.navigationController pushViewController:blog animated:YES];
            }else{
                [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
                       onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
                 {
                     if (state == SSDKResponseStateSuccess)
                     {
                         
                         NSLog(@"uid=%@",user.uid);
                         NSLog(@"%@",user.credential);
                         NSLog(@"token=%@",user.credential.token);
                         NSLog(@"nickname=%@",user.nickname);
                         
                         session *danli = [session getInstance];
                         [ZYHTTPRequest request:SINABINDING_URL(danli.token,user.credential.token) Completion:^(NSDictionary *dict) {
                             NSLog(@"%@",dict);
                             int stat = [[dict objectForKey:@"code"] intValue];
                             if (stat == 200) {
//
                                 [self requestData];
                             }
                             
                             
                             
                         }];
                         
                         
                     }
                     
                     else
                     {
                         NSLog(@"%@",error);
                     }
                     
                 }];

            
            }

      
        }
            break;
        case 4:
        {
            NSString *str = [NSString stringWithFormat:@"%@",[self.diction objectForKey:@"email"]] ;
            if (![str isEqualToString:@"0"]) {
                UnBindingViewController *unBIN = [[UnBindingViewController alloc]init];
                [self.navigationController pushViewController:unBIN animated:YES];
            }else{
                MailBindingViewController *mailB = [[MailBindingViewController alloc]init];
                [self.navigationController pushViewController:mailB animated:YES];
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
