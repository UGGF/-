//
//  groupManageVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "groupManageVC.h"
#import "groupCell.h"

@interface groupManageVC ()

@end

@implementation groupManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self createKit];
    [self requestGroup];
    
}

-(void)requestGroup
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:FINDALLGROUP(danLi.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        self.groupNameArray = [dict objectForKey:@"data"];
        [self.groupTB reloadData];
    }];
}

-(void)createKit
{
    self.view.backgroundColor = WHITECOLOR;
    
    self.groupTB = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70)];
    self.groupTB.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.groupTB.dataSource = self;
    self.groupTB.delegate = self;
    [self.view addSubview:self.groupTB];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    bgView.backgroundColor = WHITECOLOR;
    
        
        UIImageView *addImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 5, 30, 30)];
        addImageView.image = [UIImage imageNamed:@"fenzuzengjia"];
        [bgView addSubview:addImageView];
    
        UILabel *groupLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, WIDTH - 70, 20)];
        groupLabel.text = @"添加分组";
        groupLabel.font = [UIFont systemFontOfSize:16];
        [bgView addSubview:groupLabel];
    
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39, WIDTH, 1)];
        lineView.backgroundColor = GRAYCOLOR;
        [bgView addSubview:lineView];
    
        UIButton *addGroupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addGroupBtn.frame = CGRectMake(0, 5, WIDTH, 40);
        [addGroupBtn addTarget:self action:@selector(addGroupBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:addGroupBtn];

    
    return bgView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupNameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cellID";
    
    groupCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[groupCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.groupNameLB.text = [self.groupNameArray[indexPath.row] objectForKey:@"name"];
    cell.deleteBtn.tag = 2013 + indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteGroupClick:) forControlEvents:1<<6];
    cell.editBtn.tag = 3030 + indexPath.row;
    [cell.editBtn addTarget:self action:@selector(setGroup:) forControlEvents:1<<6];
    return cell;
}

-(void)addGroupBtnClick
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70)];
    self.bgView.backgroundColor = [UIColor grayColor];
    self.bgView.alpha = 0.8;
    [self.view addSubview:self.bgView];
    
    self.whiteBGView = [[UIView alloc]initWithFrame:CGRectMake(10, HEIGHT / 2 - 100, WIDTH - 20, 200)];
    self.whiteBGView.backgroundColor = WHITECOLOR;
    self.whiteBGView.layer.cornerRadius = 3;
    self.whiteBGView.clipsToBounds = YES;
    [self.view addSubview:self.whiteBGView];
    
    UILabel *kindLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH - 20, 20)];
    kindLabel.text = @"编辑分组";
    kindLabel.textColor = TEXTCOLOR;
    kindLabel.font = [UIFont systemFontOfSize:16];
    kindLabel.textAlignment = NSTextAlignmentCenter;
    [self.whiteBGView addSubview:kindLabel];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, WIDTH - 20, 20)];
    detailLabel.text = @"请输入新的分组名称";
    detailLabel.textColor = TEXTCOLOR;
    detailLabel.font = [UIFont systemFontOfSize:14];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [self.whiteBGView addSubview:detailLabel];
    
    self.groupTF = [[UITextField alloc]initWithFrame:CGRectMake(30, 80, WIDTH - 80, 40)];
    self.groupTF.layer.borderColor = GRAYCOLOR.CGColor;
    self.groupTF.layer.borderWidth = 1;
    self.groupTF.layer.cornerRadius = 3;
    self.groupTF.clipsToBounds = YES;
    self.groupTF.placeholder = @"最多6字";
    self.groupTF.delegate = self;
    self.groupTF.textColor = TEXTCOLOR;
    self.groupTF.font = [UIFont systemFontOfSize:16];
    [self.whiteBGView addSubview:self.groupTF];
    
    UIButton *addGroupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addGroupBtn.frame = CGRectMake(30, 130, WIDTH / 2 - 55, 40);
    [addGroupBtn setTitle:@"确定" forState:UIControlStateNormal];
    [addGroupBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    addGroupBtn.layer.cornerRadius = 3;
    addGroupBtn.clipsToBounds = YES;
    [addGroupBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteBGView addSubview:addGroupBtn];
    
    UIButton *noBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noBtn.frame = CGRectMake(WIDTH / 2 + 5, 130, WIDTH / 2 - 55, 40);
    [noBtn setTitle:@"取消" forState:UIControlStateNormal];
    [noBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    noBtn.layer.cornerRadius = 3;
    noBtn.clipsToBounds = YES;
    [noBtn addTarget:self action:@selector(noBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteBGView addSubview:noBtn];
}

-(void)addBtnClick
{
    [self.bgView removeFromSuperview];
    [self.whiteBGView removeFromSuperview];
    if (self.groupTF.text.length > 0) {
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:CREATE_GROUP(danLi.token, self.groupTF.text) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
    NSLog(@"添加了");
    ;
    }
}

-(void)deleteGroupClick:(UIButton *)sender
{
        NSLog(@"删除第%d个分组",sender.tag - 2013);
    if ([[self.groupNameArray[sender.tag - 2013] objectForKey:@"type"] intValue] == 0) {
        ALERTVIEW(@"系统默认分组,不可删除!")
    }else
    {
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:DELETE_GROUP(danLi.token, [self.groupNameArray[sender.tag - 2013] objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
    }
    
}

-(void)setGroup:(UIButton *)sender
{
    if ([[self.groupNameArray[sender.tag - 3030] objectForKey:@"type"] intValue] == 0) {
        ALERTVIEW(@"系统默认分组,不能编辑!")
    }else
    {
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70)];
    self.bgView.backgroundColor = [UIColor grayColor];
    self.bgView.alpha = 0.8;
    [self.view addSubview:self.bgView];
    
    self.whiteBGView = [[UIView alloc]initWithFrame:CGRectMake(10, HEIGHT / 2 - 100, WIDTH - 20, 200)];
    self.whiteBGView.backgroundColor = WHITECOLOR;
    self.whiteBGView.layer.cornerRadius = 3;
    self.whiteBGView.clipsToBounds = YES;
    [self.view addSubview:self.whiteBGView];
    
    UILabel *kindLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH - 20, 20)];
    kindLabel.text = @"编辑分组";
    kindLabel.textColor = TEXTCOLOR;
    kindLabel.font = [UIFont systemFontOfSize:16];
    kindLabel.textAlignment = NSTextAlignmentCenter;
    [self.whiteBGView addSubview:kindLabel];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, WIDTH - 20, 20)];
    detailLabel.text = @"请输入新的分组名称";
    detailLabel.textColor = TEXTCOLOR;
    detailLabel.font = [UIFont systemFontOfSize:14];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [self.whiteBGView addSubview:detailLabel];
    
    self.groupTF = [[UITextField alloc]initWithFrame:CGRectMake(30, 80, WIDTH - 80, 40)];
    self.groupTF.layer.borderColor = GRAYCOLOR.CGColor;
    self.groupTF.layer.borderWidth = 1;
    self.groupTF.layer.cornerRadius = 3;
    self.groupTF.clipsToBounds = YES;
    self.groupTF.placeholder = @"最多6字";
    self.groupTF.delegate = self;
    self.groupTF.textColor = TEXTCOLOR;
    self.groupTF.font = [UIFont systemFontOfSize:16];
    [self.whiteBGView addSubview:self.groupTF];
    
    UIButton *yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    yesBtn.frame = CGRectMake(30, 130, WIDTH / 2 - 55, 40);
    yesBtn.tag = sender.tag + 1000;
    [yesBtn setTitle:@"确定" forState:UIControlStateNormal];
    [yesBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    yesBtn.layer.cornerRadius = 3;
    yesBtn.clipsToBounds = YES;
    [yesBtn addTarget:self action:@selector(yesBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteBGView addSubview:yesBtn];
    
    UIButton *noBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noBtn.frame = CGRectMake(WIDTH / 2 + 5, 130, WIDTH / 2 - 55, 40);
    noBtn.tag = sender.tag + 1000;
    [noBtn setTitle:@"取消" forState:UIControlStateNormal];
    [noBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    noBtn.layer.cornerRadius = 3;
    noBtn.clipsToBounds = YES;
    [noBtn addTarget:self action:@selector(noBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteBGView addSubview:noBtn];
    }

}

-(void)yesBtnClick:(UIButton *)sender
{
    session *danLi = [session getInstance];
    [self.bgView removeFromSuperview];
    [self.whiteBGView removeFromSuperview];
    
    [ZYHTTPRequest request:EDIT_GROUP(danLi.token,[self.groupNameArray[sender.tag - 1000 - 3030] objectForKey:@"id"], self.groupTF.text) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    }];
}

-(void)noBtnClick
{
    [self.bgView removeFromSuperview];
    [self.whiteBGView removeFromSuperview];
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    
    statusBarView.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:statusBarView];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    navBar.image = [UIImage imageNamed:@"navbg.png"];
    [self.view addSubview:navBar];
    navBar.backgroundColor = [UIColor whiteColor];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"分组管理";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:fanHuiBtn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [navBar addSubview:lineView];
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
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
