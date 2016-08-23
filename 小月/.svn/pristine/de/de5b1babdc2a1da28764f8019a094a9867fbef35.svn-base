//
//  LeftViewController.m
//  moonletScience
//
//  Created by 苏 on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "moonletForumViewController.h"
#import "PersonDataViewController.h"
#import "linkManVC.h"
#import "MessageVC.h"
#import "MySettingViewController.h"
#import "MyPillowViewController.h"
#import "MoonletShopViewController.h"
#import "SleepReController.h"
#import "DetailSleepReController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createKit];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self logoinRequest];
}

-(void)logoinRequest
{
    
}




-(void)createKit
{
    NSLog(@"1111111111");
    
    self.view.backgroundColor = WHITECOLOR;
    
    
    UIImageView *headerImage = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH - 100) / 2 - 40, 50, 80, 80)];
    [headerImage setImageWithURL:[NSURL URLWithString:[[[self.dataDict objectForKey:@"rows"] objectAtIndex:0] objectForKey:@"Field_userIcon"]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
    headerImage.layer.cornerRadius = 40;
    headerImage.clipsToBounds = YES;
    [self.view addSubview:headerImage];
    
    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerBtn.frame = CGRectMake((WIDTH - 100) / 2 - 40, 50, 80, 80);
    headerBtn.layer.cornerRadius = 3;
    headerBtn.clipsToBounds = YES;
    [headerBtn addTarget:self action:@selector(headerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headerBtn];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 140, WIDTH - 100, 20)];
    nameLabel.text = [NSString stringWithFormat:@"%@",[[[self.dataDict objectForKey:@"rows"] objectAtIndex:0] objectForKey:@"Field_userNick"]];
    nameLabel.textColor = TEXTGRAYCOLOR;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:nameLabel];
    
    NSArray *detailArray = @[@"Field_mesNum",@"Field_attention"];
    NSArray *kindArray = @[@"消息",@"关注"];
    for (int i = 0; i < detailArray.count; i++) {
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 + (WIDTH - 120) / 2 * i, 170, (WIDTH - 120) / 2, 20)];
        detailLabel.text = [NSString stringWithFormat:@"%@%@",kindArray[i],[[[self.dataDict objectForKey:@"rows"] objectAtIndex:0] objectForKey:detailArray[i]]];
        detailLabel.textColor = TEXTGRAYCOLOR;
        detailLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:detailLabel];
        if (i == 1) {
            detailLabel.textAlignment = NSTextAlignmentLeft;
        }
        
        UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        detailBtn.frame = CGRectMake(10 + (WIDTH - 120) / 2 * i, 160, (WIDTH - 120) / 2, 40);
        detailBtn.tag = 3013 + i;
        [detailBtn addTarget:self action:@selector(detailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:detailBtn];
    }
    
    NSArray *imageArray = @[@"My_pillow",@"Set_up",@"Wishlists",@"forum",@"guide",@"Mall"];
    NSArray *nameArray = @[@"我的枕头",@"我的设置",@"我的收藏",@"小月之家",@"使用指南",@"小月商城"];
    for (int i = 0; i < nameArray.count; i++) {
        UIImageView *actionImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 210 + 40 * i, 20, 20)];
        actionImage.image = [UIImage imageNamed:imageArray[i]];
        [self.view addSubview:actionImage];
        
        UILabel *actionLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 210 + 40 * i, 100, 20)];
        actionLabel.text = nameArray[i];
        actionLabel.textAlignment = NSTextAlignmentLeft;
        actionLabel.textColor = TEXTCOLOR;
        actionLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:actionLabel];
        
        UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        actionBtn.frame = CGRectMake(0, 200 + 40 * i, WIDTH - 100, 40);
        actionBtn.tag = 2013 + i;
        [actionBtn addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        actionBtn.backgroundColor = [UIColor redColor];
        [self.view addSubview:actionBtn];
        
    }
    
    UIButton *postBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    postBtn.frame = CGRectMake(0, HEIGHT - 100, WIDTH - 100, 100);
    postBtn.tag = 1;
    [postBtn setTitle:@"诱导广告" forState:UIControlStateNormal];
    [postBtn.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[[self.dataDict objectForKey:@"rows"] objectAtIndex:0] objectForKey:@"Field_ads"]]]];
    postBtn.backgroundColor = [UIColor redColor];
    [postBtn addTarget:self action:@selector(postBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postBtn];
    
}

-(void)detailBtnClick:(UIButton *)sender
{
    switch (sender.tag - 3013) {
        case 0:
        {
            NSLog(@"消息中心");AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            MessageVC *message = [[MessageVC alloc]init];
            [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
            [tempAppDelegate.mainNavigationController pushViewController:message animated:YES];
            break;
        }
        case 1:
        {
            NSLog(@"联系人中心"); 
            AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            linkManVC *linkMan = [[linkManVC alloc]init];
            [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
            [tempAppDelegate.mainNavigationController pushViewController:linkMan animated:YES];
            break;
        }
        default:
            break;
    }
}

-(void)postBtnClick
{
    NSLog(@"诱导广告位置");
}

-(void)actionBtnClick:(UIButton *)sender
{
    switch (sender.tag - 2013) {
        case 0:{
            
            NSLog(@"我的枕头");
            
            AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            MyPillowViewController *pillow = [[MyPillowViewController alloc]init];
            [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
            [tempAppDelegate.mainNavigationController pushViewController:pillow animated:YES];

                       break;
        }case 1:{
            
            NSLog(@"我的设置");
            
            AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
             MySettingViewController *set = [[MySettingViewController alloc]init];
            [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
            [tempAppDelegate.mainNavigationController pushViewController:set animated:YES];
            
           
            [self.navigationController pushViewController:set animated:YES];
            break;
        }case 2:{
            
            NSLog(@"我的收藏");
            break;
        }case 3:{
            
            NSLog(@"小月之家");
            AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            moonletForumViewController *moonlet = [[moonletForumViewController alloc]init];
            [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
            [tempAppDelegate.mainNavigationController pushViewController:moonlet animated:YES];
            
            break;
        }case 4:{
            
            NSLog(@"使用指南");
            AppDelegate *temAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            SleepReController *sleep = [[SleepReController alloc]init];
//            DetailSleepReController *detail = [[DetailSleepReController alloc]init];
            [temAppDelegate.LeftSlideVC closeLeftView];
            [temAppDelegate.mainNavigationController pushViewController:sleep animated:YES];
            break;
        }case 5:{
            
            NSLog(@"小月商城");
            
            AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            MoonletShopViewController *shop = [[MoonletShopViewController alloc]init];
            [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
            [tempAppDelegate.mainNavigationController pushViewController:shop animated:YES];
            break;
        }
            
            
        default:
            break;
    }
}

-(void)headerBtnClick
{
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    PersonDataViewController *personData = [[PersonDataViewController alloc]init];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    [tempAppDelegate.mainNavigationController pushViewController:personData animated:YES];
   
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
