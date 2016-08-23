//
//  PersonInfoViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "InfoTableViewCell.h"
#import "FixRemarkViewController.h"
#import "RelationShipViewController.h"

@interface PersonInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    
    NSArray *_array;
    UIImageView *myTempView;
}
@property (nonatomic,weak)UIImageView *myView;
@property (nonatomic , strong)UITableView *tableView;
@property (nonatomic , strong)NSDictionary *resourceDict;

@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    self.valueArray = @[@"身份关系",@"分组管理",@"联系方式",@"relationship",@"userGroupName",@"contact"];
    [self creatKit];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self requestUserInfo];
}

-(void)requestUserInfo
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:FIND_USERINFO(danLi.token, self.userID) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        self.resourceDict = [dict objectForKey:@"data"];
        [self.tableView reloadData];
        
        if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"1"]) {
            self.typeArr = @[@"修改备注",@"删除好友",@"加入黑名单"];
        }else if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"2"]) {
            self.typeArr = @[@"修改备注",@"移出黑名单"];
        }
        else
        {
            self.typeArr = @[@"修改备注",@"加入黑名单"];
        }
        
    }];
}



#pragma mark - 修改状态栏的简便方法
-(void)createNavBar
{
    //状态栏设置
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    statusBarView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏背景
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navBar];
    
    //导航信息
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"个人信息";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航栏返回按钮
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:fanHuiBtn];
    
    //右上角更多
    self.MoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.MoreBtn.frame = CGRectMake(WIDTH-110, 10, 100, 40);
    //    MoreBtn.backgroundColor = [UIColor yellowColor];
    [self.MoreBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"more" ofType:@"png"]] forState:UIControlStateNormal];
    self.MoreBtn.layer.cornerRadius = 1;
    self.MoreBtn.clipsToBounds = YES;
    self.MoreBtn.selected = NO;
    [self.MoreBtn addTarget:self action:@selector(MoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.MoreBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 90, 0, 0)];
    [navBar addSubview:self.MoreBtn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [navBar addSubview:lineView];
   
}

-(void)creatKit
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = RGBCOLOR(242, 242, 242);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerBG = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    
    UIImageView *headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    [headerImg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[self.resourceDict objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiangfang"]];
    headerImg.layer.cornerRadius = 30;
    headerImg.clipsToBounds = YES;
    [headerBG addSubview:headerImg];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, WIDTH - 90, 20)];
    nameLabel.textColor = TEXTCOLOR;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"nick"]];
    [headerBG addSubview:nameLabel];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, WIDTH - 90, 20)];
    detailLabel.textColor = TEXTCOLOR;
    detailLabel.textAlignment = NSTextAlignmentLeft;
    detailLabel.font = [UIFont systemFontOfSize:14];
    if ([[self.resourceDict objectForKey:@"sex"] intValue] == 0) {
        detailLabel.text = [NSString stringWithFormat:@"%@  女  %@",[self.resourceDict objectForKey:@"age"],[self.resourceDict objectForKey:@"addr"]];
    }else
    {
        detailLabel.text = [NSString stringWithFormat:@"%@  男  %@",[self.resourceDict objectForKey:@"age"],[self.resourceDict objectForKey:@"addr"]];
    }
    ;
    [headerBG addSubview:detailLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 79, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [headerBG addSubview:lineView];
    
    UILabel *mindLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, WIDTH / 2, 20)];
    mindLabel.textColor = TEXTCOLOR;
    mindLabel.textAlignment = NSTextAlignmentLeft;
    mindLabel.font = [UIFont systemFontOfSize:14];
    mindLabel.text = [NSString stringWithFormat:@"关注:%d",[[self.resourceDict objectForKey:@"follow"] intValue]];
    [headerBG addSubview:mindLabel];
    
    UIView *linesView = [[UILabel alloc]initWithFrame:CGRectMake(0, 109, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [headerBG addSubview:lineView];
    
    if ([[self.resourceDict objectForKey:@"identity"] intValue] == 1) {
        UILabel *comLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, WIDTH / 2 - 10, 20)];
        comLabel.textAlignment = NSTextAlignmentLeft;
        comLabel.textColor = TEXTCOLOR;
        comLabel.font = [UIFont systemFontOfSize:14];
        comLabel.text = [NSString stringWithFormat:@"就职于:%@",[self.resourceDict objectForKey:@"com"]];
        [headerBG addSubview:comLabel];
        
        UILabel *jobLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2, 120, WIDTH / 2 - 10, 20)];
        jobLabel.textAlignment = NSTextAlignmentRight;
        jobLabel.textColor = TEXTCOLOR;
        jobLabel.font = [UIFont systemFontOfSize:14];
        jobLabel.text = [NSString stringWithFormat:@"职位:%@",[self.resourceDict objectForKey:@"job"]];
        [headerBG addSubview:jobLabel];
        
        
        
        if ([self.resource isEqualToString:@"111"]) {
            UILabel *deatilsLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 150, WIDTH - 20, 20)];
            deatilsLabel.textColor = TEXTCOLOR;
            deatilsLabel.textAlignment = NSTextAlignmentLeft;
            deatilsLabel.font = [UIFont systemFontOfSize:14];
            [headerBG addSubview:deatilsLabel];
            if ([[[self.resourceDict objectForKey:@"appcat"] stringValue] isEqualToString:@"0"]) {
                deatilsLabel.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"msg"] ];
            }else
            {
                deatilsLabel.text = [NSString stringWithFormat:@"sdfd%@",[self.resourceDict objectForKey:@"message"] ];
            }
            
            linesView.frame = CGRectMake(0, 149, WIDTH, 1);
        }else
        {
            linesView.frame = CGRectMake(0, 179, WIDTH, 1);
        }
    }
    
    return headerBG;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([[self.resourceDict objectForKey:@"identity"] intValue] == 1) {
        if ([self.resource isEqualToString:@"111"]) {
            return 190;
        }else
        {
            return 150;
        }
    }else
    {
        return 110;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cellID";
    
    InfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[InfoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    cell.InLabel.text = self.valueArray[indexPath.row];
    cell.detailLabel.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:self.valueArray[indexPath.row + 3]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    footerView.backgroundColor = WHITECOLOR;
    
    UILabel *description = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 20)];
    description.textColor = TEXTCOLOR;
    description.textAlignment = NSTextAlignmentLeft;
    description.font = [UIFont systemFontOfSize:14];
    description.text = @"描述简介:";
    [footerView addSubview:description];
    
    UILabel *describe = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, WIDTH - 90, 20)];
    describe.textAlignment = NSTextAlignmentLeft;
    describe.textColor = TEXTCOLOR;
    describe.font = [UIFont systemFontOfSize:14];
    describe.numberOfLines = 0;
    describe.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"description"]];
    [footerView addSubview:describe];
    
     CGSize size = [describe.text sizeWithFont:describe.font constrainedToSize:CGSizeMake(WIDTH - 90, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    if (size.height > 40) {
        size.height = 40;
    }
    describe.frame = CGRectMake(80, 10, size.width, size.height);
    
    if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"2"]) {
        UIButton *laHeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        laHeiBtn.frame = CGRectMake(10, 120, WIDTH  - 20, 40);
        
        [laHeiBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        laHeiBtn.backgroundColor = GRAYCOLOR;
        laHeiBtn.layer.cornerRadius = 3;
        laHeiBtn.clipsToBounds = YES;
        [laHeiBtn setTitle:@"已加入黑名单" forState:0];
        [laHeiBtn addTarget:self action:@selector(makeFriendsBtnClick) forControlEvents:1<<6];
        [footerView addSubview:laHeiBtn];
        
    }else if (![[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"1"]) {
        if ([self.resource isEqualToString:@"111"]) {
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(10, 60, WIDTH / 2 - 20, 40);
        [sureBtn setTitle:@"同意" forState:UIControlStateNormal];
        [sureBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        sureBtn.backgroundColor = GREENCOLOR;
        sureBtn.layer.cornerRadius = 3;
        sureBtn.clipsToBounds = YES;
        [sureBtn addTarget:self action:@selector(addFriendBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:sureBtn];
        
        UIButton *refuseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        refuseBtn.frame = CGRectMake(WIDTH / 2 + 10, 60, WIDTH / 2 - 20, 40);
        [refuseBtn setTitle:@"拒绝" forState:UIControlStateNormal];
        [refuseBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        refuseBtn.backgroundColor = REDCOLOR;
        refuseBtn.layer.cornerRadius = 3;
        refuseBtn.clipsToBounds = YES;
        [refuseBtn addTarget:self action:@selector(refuseBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:refuseBtn];
        
        if ([self.resourceDict objectForKey:@"message"]) {
            UIButton *laHeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            laHeiBtn.frame = CGRectMake(10, 120, WIDTH  - 20, 40);
            [laHeiBtn setTitle:@"加入黑名单" forState:UIControlStateNormal];
            [laHeiBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            laHeiBtn.backgroundColor = GRAYCOLOR;
            laHeiBtn.layer.cornerRadius = 3;
            laHeiBtn.clipsToBounds = YES;
            [laHeiBtn addTarget:self action:@selector(addBlackList) forControlEvents:UIControlEventTouchUpInside];
            [footerView addSubview:laHeiBtn];
        }else
        {
            
            UIButton *laHeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            laHeiBtn.frame = CGRectMake(10, 120, WIDTH  - 20, 40);
            
            [laHeiBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            laHeiBtn.backgroundColor = GREENCOLOR;
            laHeiBtn.layer.cornerRadius = 3;
            laHeiBtn.clipsToBounds = YES;
            [laHeiBtn setTitle:@"添加好友" forState:0];
            [laHeiBtn addTarget:self action:@selector(makeFriendsBtnClick) forControlEvents:1<<6];
            [footerView addSubview:laHeiBtn];
        }
        }else
        {
            UIButton *laHeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            laHeiBtn.frame = CGRectMake(10, 120, WIDTH  - 20, 40);
            
            [laHeiBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            laHeiBtn.backgroundColor = GREENCOLOR;
            laHeiBtn.layer.cornerRadius = 3;
            laHeiBtn.clipsToBounds = YES;
            [laHeiBtn setTitle:@"添加好友" forState:0];
            [laHeiBtn addTarget:self action:@selector(makeFriendsBtnClick) forControlEvents:1<<6];
            [footerView addSubview:laHeiBtn];
        }
    }else
    {
        
            UIButton *laHeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            laHeiBtn.frame = CGRectMake(10, 120, WIDTH  - 20, 40);
            
            [laHeiBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            laHeiBtn.backgroundColor = GREENCOLOR;
            laHeiBtn.layer.cornerRadius = 3;
            laHeiBtn.clipsToBounds = YES;
            [footerView addSubview:laHeiBtn];
        
        
            if ([[[self.resourceDict objectForKey:@"device"] stringValue] isEqualToString:@"0"]) {
                [laHeiBtn setTitle:@"好友暂无设备" forState:UIControlStateNormal];
                laHeiBtn.backgroundColor = GRAYCOLOR;
            }else
            {
                [laHeiBtn setTitle:@"催睡叫醒" forState:UIControlStateNormal];
                [laHeiBtn addTarget:self action:@selector(sleepOrWeak) forControlEvents:UIControlEventTouchUpInside];
            }

    }
    
    return footerView;
}

-(void)sleepOrWeak
{
    
}

-(void)makeFriendsBtnClick
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:MAKES_FRIENDS(danLi.token, [self.resourceDict objectForKey:@"id"],@"111") Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
}

-(void)addFriendBtnClick
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:MAKE_FRIENDS(danLi.token, [self.resourceDict objectForKey:@"relationId"]) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
}

-(void)refuseBtnClick
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:DECLINE_FRIENDS(danLi.token, [self.resourceDict objectForKey:@"relationId"]) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
}

-(void)addBlackList
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:ADDBLACKLIST(danLi.token, [self.resourceDict objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 170;
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
    self.myView.hidden = YES;
}
- (void)MoreBtnClick:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
    myTempView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 90, 70,90, 40 * self.typeArr.count)];
    myTempView.image = [UIImage imageNamed:@"menuBackground"];
    myTempView.layer.cornerRadius = 5;
    myTempView.userInteractionEnabled = YES;
    [self.view addSubview:myTempView];
    
    for (int i = 0; i < self.typeArr.count; i++) {
        UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [typeBtn setTitle:self.typeArr[i] forState:UIControlStateNormal];
        [typeBtn setTitleColor:RGBCOLOR(51, 51, 51) forState:UIControlStateNormal];
        typeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        typeBtn.frame = CGRectMake(8, 0+i*40, 70, 40);
        typeBtn.tag = 110+i;
        [typeBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [myTempView addSubview:typeBtn];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(3, 39+i*40, 120, 1)];
        line.backgroundColor = LINECOLOR;
        [myTempView addSubview:line];
    }
    }else
    {
        [myTempView removeFromSuperview];
    }
    
  
}



- (void)typeBtnClick:(UIButton *)sender{
    self.MoreBtn.selected = !self.MoreBtn.selected;
    if (myTempView) {
        [myTempView removeFromSuperview];
    }
    
    session *danLi = [session getInstance];
    int i = sender.tag;
    if (![[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"1"] && i > 110 ) {
        i++;
    }
    
    switch (i) {
        case 110:
        {
            if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"1"])
            {
            FixRemarkViewController *fix = [[FixRemarkViewController alloc]init];
                fix.groupNmaeStr = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:self.valueArray[4]]];
                fix.relationId = [self.resourceDict objectForKey:@"relationId"];
            [self.navigationController pushViewController:fix animated:YES];
            }else
            {
                ALERTVIEW(@"您与当前用户不是好友,不能修改备注");
            }
        }
            break;
        case 111:
        {
                [ZYHTTPRequest request:DELETE_FRIENDS(danLi.token, [self.resourceDict objectForKey:@"relationId"]) Completion:^(NSDictionary *dict) {
                    NSLog(@"%@",dict);
                }];
        }
            break;
        case 112:
        {
            
            if (![[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"2"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"加入黑名单，对方通讯录中将直接删除你的资料，且不能主动加你为好友" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //点击确定按钮后弹出的弹框
                    self.myView.hidden = YES;
                    [ZYHTTPRequest request:ADDBLACKLIST(danLi.token,[self.resourceDict objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
                        NSLog(@"%@",dict);
                        ALERTVIEW([dict objectForKey:@"msg"]);
                    }];
                    
                }]];
                [self presentViewController:alert animated:true completion:nil];
            }else
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"加入黑名单，对方通讯录中将直接删除你的资料，且不能主动加你为好友" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //点击确定按钮后弹出的弹框
                    self.myView.hidden = YES;
                    [ZYHTTPRequest request:REMOVEBLACKLIST(danLi.token,[self.resourceDict objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
                        NSLog(@"%@",dict);
                        ALERTVIEW([dict objectForKey:@"msg"]);
                    }];
                    
                }]];
                [self presentViewController:alert animated:true completion:nil];
            }
        }
            break;
        case 113:
        {
            
            
        }
            break;
        case 114:
        {
            RelationShipViewController *rela = [[RelationShipViewController alloc]init];
            [self.navigationController pushViewController:rela animated:YES];
            
        }
            break;
        case 115:
        {
            
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
