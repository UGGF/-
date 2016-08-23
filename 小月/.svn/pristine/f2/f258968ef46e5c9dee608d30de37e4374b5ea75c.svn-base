//
//  linkManVC.m
//  moonletScience
//
//  Created by 苏 on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "linkManVC.h"
#import "myCareForCell.h"
#import "groupManageVC.h"

@interface linkManVC ()

@end

@implementation linkManVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self createKit];
    [self requeseLinkMan];
}

-(void)requeseLinkMan
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:CONTACTlIST(danLi.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            self.myMindArray = [[dict objectForKey:@"data"] objectForKey:@"isubscribe"];
            self.mindMeArray = [[dict objectForKey:@"data"] objectForKey:@"subscribeme"];
            self.professorArray = [[dict objectForKey:@"data"] objectForKey:@"expert"];
            self.myFriendArray = [[dict objectForKey:@"data"] objectForKey:@"relatives"];
            [self.myCareForTB reloadData];
            
        }else
        {
            ALERTVIEW(@"发生未知错误,请重试!");
        }
    }];

}

-(void)createKit
{
    self.view.backgroundColor = RGBCOLOR(242, 242, 242);
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 80)];
    bgView.backgroundColor = WHITECOLOR;
    [self.view addSubview:bgView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [bgView addSubview:lineView];
    
    UISearchBar *seach = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 5, WIDTH - 20, 30)];
    seach.placeholder = @"搜索";
    seach.backgroundColor = RGBCOLOR(242, 242, 242);
    seach.backgroundImage = [self imageWithColor:WHITECOLOR size:seach.bounds.size];
    seach.layer.borderWidth = 2;
    seach.layer.borderColor = GREENCOLOR.CGColor;
    seach.layer.cornerRadius = 3;
    seach.clipsToBounds = YES;
    [bgView addSubview:seach];
    
    NSArray *titlteArray = @[@"我关心",@"关心我",@"专家团",@"亲友圈"];
    
    for (int i = 0; i < titlteArray.count; i++) {
        UIButton *kindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        kindBtn.frame = CGRectMake(WIDTH / 4 * i, 35, WIDTH / 4, 40);
        kindBtn.tag = 1314 + i;
        [kindBtn setTitle:titlteArray[i] forState:UIControlStateNormal];
        [kindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        kindBtn.layer.cornerRadius = 3;
        kindBtn.clipsToBounds = YES;
        kindBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [kindBtn addTarget:self action:@selector(kindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:kindBtn];
    }
    
    self.blueView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH / 16, 73, WIDTH / 8, 2)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [bgView addSubview:self.blueView];
    
    self.seletedStr = @"1";
    
    self.bgScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 145, WIDTH, HEIGHT - 150)];
    self.bgScrollerView.showsHorizontalScrollIndicator = NO;
    self.bgScrollerView.showsVerticalScrollIndicator = NO;
    self.bgScrollerView.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.bgScrollerView];
    
    self.myCareForTB = [[UITableView alloc]initWithFrame:CGRectMake(0, 3, WIDTH, HEIGHT - 155)];
    self.myCareForTB.delegate = self;
    self.myCareForTB.dataSource = self;
    self.myCareForTB.rowHeight = 63;
    self.myCareForTB.backgroundColor = GRAYCOLOR;
    self.myCareForTB.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bgScrollerView addSubview:self.myCareForTB];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if ([self.seletedStr isEqualToString:@"0"] || [self.seletedStr isEqualToString:@"1"]) {
        return 1;
    }else if ([self.seletedStr isEqualToString:@"2"])
    {
        return self.professorArray.count;
    }else
    {
        return self.myFriendArray.count;
    }
}

// 自定义区头的
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.seletedStr isEqualToString:@"0"] || [self.seletedStr isEqualToString:@"1"]) {
        UIView *vie = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        return vie;
    }else
    {
    UIView *vie = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    vie.backgroundColor = WHITECOLOR;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 10, 18)];
    imageView.image = [UIImage imageNamed:@"contacts_arrow"];
        if (_flagArray[section]) {
            // 箭头往下
            imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
            // 让imageView 顺时针旋转90度
        }
        else
        {
            // 箭头往右
            imageView.transform = CGAffineTransformIdentity;// 回到最初位置
        }
    [vie addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, WIDTH  - 20, 20)];
    nameLabel.numberOfLines = 0;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = RGBCOLOR(52, 52, 52);
    nameLabel.font = [UIFont systemFontOfSize:14];
    [vie addSubview:nameLabel];
        
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2, 10, WIDTH / 2 - 30, 20)];
       
    detailLabel.textColor = TEXTCOLOR;
        detailLabel.font = [UIFont systemFontOfSize:16];
        detailLabel.textAlignment = NSTextAlignmentRight;
        [vie addSubview:detailLabel];
        
        if ([self.seletedStr isEqualToString:@"2"]) {
            nameLabel.text = [self.professorArray[section] objectForKey:@"name"] ;
             detailLabel.text = [NSString stringWithFormat:@"%@/%@",[self.professorArray[section] objectForKey:@"online"],[self.professorArray[section] objectForKey:@"total"]];
        }else
        {
            nameLabel.text = [self.myFriendArray[section] objectForKey:@"name"] ;
             detailLabel.text = [NSString stringWithFormat:@"%@/%@",[self.myFriendArray[section] objectForKey:@"online"],[self.myFriendArray[section] objectForKey:@"total"]];
        }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, WIDTH - 30,30);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.tag = 10 + section;
    [btn addTarget:self action:@selector(openOrClose:) forControlEvents:UIControlEventTouchUpInside];
    [vie addSubview:btn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [vie addSubview:lineView];
    return vie;

    }
}

- (void)openOrClose:(id)sender
{
    [self.view endEditing:YES];
    UIButton *btn = (UIButton *)sender;
    int section = btn.tag - 10;
    
    for (int i = 0; i < 100; i++) {
        if (i == btn.tag - 10) {
            _flagArray[i] = !_flagArray[i];
            [self.myCareForTB reloadSections:[NSIndexSet indexSetWithIndex:i] withRowAnimation:UITableViewRowAnimationNone];
        }
    }
    
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.seletedStr isEqualToString:@"0"] || [self.seletedStr isEqualToString:@"1"]) {
        return 0;
    }else
    {
    return 40;
    }
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if ([self.seletedStr isEqualToString:@"0"] || [self.seletedStr isEqualToString:@"1"]) {
        return 0;
    }else
    {
        return 1;
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.seletedStr isEqualToString:@"0"]) {
        
        return self.myMindArray.count;;
    }else if ([self.seletedStr isEqualToString:@"1"]) {
            
            return self.mindMeArray.count;;
    }else if ([self.seletedStr isEqualToString:@"2"]) {
        
        if (_flagArray[section]) {
            NSArray *Array = [self.professorArray[section] objectForKey:@"list"];
            return Array.count;
        }else
        {
            return 0;
        }
        
    }else
    {
        if (_flagArray[section]) {
            NSArray *Array = [self.myFriendArray[section] objectForKey:@"list"];
            return Array.count;
        }else
        {
            return 0;
        }

    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cellID";
    
    myCareForCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[myCareForCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if ([self.seletedStr isEqualToString:@"0"]) {
        self.resourceDict = self.myMindArray[indexPath.row];
    }else if ([self.seletedStr isEqualToString:@"1"]) {
        self.resourceDict = self.mindMeArray[indexPath.row];
    }else if ([self.seletedStr isEqualToString:@"2"]) {
        
        self.resourceDict = [[[self.professorArray objectAtIndex:indexPath.section] objectForKey:@"list"] objectAtIndex:indexPath.row];
        
    }else
    {
        self.resourceDict = [[[self.myFriendArray objectAtIndex:indexPath.section] objectForKey:@"list"] objectAtIndex:indexPath.row];
    }
    
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[self.resourceDict objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiangfang"]];
    cell.nameLabel.text = [self.resourceDict objectForKey:@"nick"];
    if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"0"]) {
        cell.statLabel.hidden = NO;
        cell.impowerBtn.hidden = YES;
        cell.declareLabel.hidden = YES;
        cell.statImageView.hidden = YES;
    }else if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"1"])
    {
        cell.statLabel.hidden = YES;
        cell.impowerBtn.hidden = NO;
        cell.declareLabel.hidden = YES;
        cell.statImageView.hidden = YES;
    }else if ([[[self.resourceDict objectForKey:@"status"] stringValue] isEqualToString:@"2"])
    {
        cell.statLabel.hidden = YES;
        cell.impowerBtn.hidden = YES;
        cell.declareLabel.hidden = NO;
        cell.statImageView.hidden = NO;
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"妈妈已连续离床%@h%@min",[self.resourceDict objectForKey:@"hour"],[self.resourceDict objectForKey:@"minute"]]];
        NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"m"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(224, 128, 0) range:redRange];
        redRange = NSMakeRange(1, [[noteStr string] rangeOfString:@"h"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:TEXTGRAYCOLOR range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"h"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(224, 128, 0) range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"床"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:TEXTGRAYCOLOR range:redRange];
        [cell.declareLabel setAttributedText:noteStr] ;
    }else
    {
        cell.statLabel.hidden = YES;
        cell.impowerBtn.hidden = YES;
        cell.declareLabel.hidden = NO;
        cell.statImageView.hidden = NO;
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"妈妈已连续入睡%@h20%@",[self.resourceDict objectForKey:@"hour"],[self.resourceDict objectForKey:@"minute"]]];
        NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"m"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(224, 128, 0) range:redRange];
        redRange = NSMakeRange(1, [[noteStr string] rangeOfString:@"h"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:TEXTGRAYCOLOR range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"h"].location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(224, 128, 0) range:redRange];
        redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@"睡"].location + 1);
        [noteStr addAttribute:NSForegroundColorAttributeName value:TEXTGRAYCOLOR range:redRange];
        [cell.declareLabel setAttributedText:noteStr] ;
    }
   
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}



-(void)kindBtnClick:(UIButton *)sender
{
    [self.view endEditing:YES];
    self.blueView.frame = CGRectMake(WIDTH / 16 + WIDTH / 4 * (sender.tag - 1314), 73, WIDTH / 8, 2);
    switch (sender.tag - 1314) {
        case 0:
        {
            self.seletedStr = @"0";
            self.groupBtn.hidden = YES;
            break;
        }
        case 1:
        {
            self.seletedStr = @"1";
            self.groupBtn.hidden = YES;
            break;
        }
        case 2:
        {
            self.seletedStr = @"2";
            self.groupBtn.hidden = NO;
            break;
        }
        case 3:
        {
            self.seletedStr = @"3";
            self.groupBtn.hidden = NO;
            break;
        }
            
        default:
            break;
    }
    
    for (int i = 0; i < 100; i++) {
            _flagArray[i] = NO;
    }
    [self.myCareForTB reloadData];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
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
    title.text = @"通讯录";
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
    
    self.groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.groupBtn.frame = CGRectMake(WIDTH - 70, 15, 60, 20);
    [self.groupBtn setTitle:@"分组" forState:UIControlStateNormal];
    [self.groupBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    self.groupBtn.layer.cornerRadius = 3;
    self.groupBtn.clipsToBounds = YES;
    self.groupBtn.hidden = YES;
    self.groupBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.groupBtn addTarget:self action:@selector(goupBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:self.groupBtn];
    
}

-(void)goupBtnClick
{
    groupManageVC *groupManage = [[groupManageVC alloc]init];
    [self.navigationController pushViewController:groupManage animated:YES];
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
