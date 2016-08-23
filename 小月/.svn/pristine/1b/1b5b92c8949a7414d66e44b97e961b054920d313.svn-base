//
//  MessageVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MessageVC.h"
#import "noticeMessageTBCell.h"
#import "PersonInfoViewController.h"

@interface MessageVC ()

@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.]
    self.seletedStr = @"0";
    [self createNavBar];
    [self createKit];
    [self requestMessage];
    
    
}

-(void)requestMessage
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:FIND_MESSAGE(danLi.token, @"", @"", @"", @"", self.seletedStr) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        self.resouceArray = [dict objectForKey:@"data"];
        [self.myMessageForTB reloadData];
    }];
}

-(void)createKit
{
    self.view.backgroundColor = WHITECOLOR;
    
    NSArray *titlteArray = @[@"提醒",@"申请",@"评论",@"专家"];
    
    for (int i = 0; i < titlteArray.count; i++) {
        UIButton *kindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        kindBtn.frame = CGRectMake(WIDTH / 4 * i, 70, WIDTH / 4, 40);
        kindBtn.tag = 1314 + i;
        [kindBtn setTitle:titlteArray[i] forState:UIControlStateNormal];
        [kindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        kindBtn.layer.cornerRadius = 3;
        kindBtn.clipsToBounds = YES;
        kindBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [kindBtn addTarget:self action:@selector(kindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:kindBtn];
    }
    
    self.blueView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH / 16, 102, WIDTH / 8, 2)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    self.bgScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, WIDTH, HEIGHT - 110)];
    self.bgScrollerView.showsHorizontalScrollIndicator = NO;
    self.bgScrollerView.showsVerticalScrollIndicator = NO;
    self.bgScrollerView.pagingEnabled = YES;
    self.bgScrollerView.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.bgScrollerView];
    
    self.myMessageForTB = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, WIDTH, HEIGHT - 155)];
    self.myMessageForTB.delegate = self;
    self.myMessageForTB.dataSource = self;
    self.myMessageForTB.rowHeight = 65;
    self.myMessageForTB.backgroundColor = GRAYCOLOR;
    self.myMessageForTB.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bgScrollerView addSubview:self.myMessageForTB];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resouceArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cellID";
    
    noticeMessageTBCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[noticeMessageTBCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[[self.resouceArray[indexPath.row] objectForKey:@"extData"] objectForKey:@"user"] objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
    cell.nameLabel.text = [[[self.resouceArray[indexPath.row] objectForKey:@"extData"] objectForKey:@"user"] objectForKey:@"nick"];
    cell.detailsLabel.text = [[self.resouceArray[indexPath.row] objectForKey:@"extData"] objectForKey:@"msg"] ;
    cell.timeLabel.text = [self.resouceArray[indexPath.row] objectForKey:@"hdt"];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.seletedStr isEqualToString:@"1"]) {
        PersonInfoViewController *person = [[PersonInfoViewController alloc]init];
        person.resource = @"111";
        if ([[[self.resouceArray[indexPath.row] objectForKey:@"dr"] stringValue] isEqualToString:@"1"]) {
            person.userID = [[self.resouceArray[indexPath.row] objectForKey:@"extData"] objectForKey:@"userId"];
        }else
        {
            person.userID = [[[self.resouceArray[indexPath.row] objectForKey:@"extData"] objectForKey:@"other"]objectForKey:@"id"];

        }
                [self.navigationController pushViewController:person animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)kindBtnClick:(UIButton *)sender
{
    self.blueView.frame = CGRectMake(WIDTH / 16 + WIDTH / 4 * (sender.tag - 1314), 102, WIDTH / 8, 2);
    switch (sender.tag - 1314) {
        case 0:
        {
            self.seletedStr = @"0";
            break;
        }
        case 1:
        {
            self.seletedStr = @"1";
            break;
        }
        case 2:
        {
            self.seletedStr = @"2";
            break;
        }
        case 3:
        {
            self.seletedStr = @"3";
            break;
        }
            
        default:
            break;
    }
    [self requestMessage];
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
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"消息";
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
    lineView.backgroundColor = GRAYCOLOR;
    [navBar addSubview:lineView];
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
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
