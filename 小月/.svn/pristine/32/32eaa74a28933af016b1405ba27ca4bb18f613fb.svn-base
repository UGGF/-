//
//  addFameilyList.m
//  moonletScience
//
//  Created by 苏 on 16/8/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "addFameilyList.h"
#import "FamilyCell.h"

@interface addFameilyList ()

@end

@implementation addFameilyList

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self createKit];
    [self requestMyMind];
}

-(void)requestMyMind
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:RELATION_MYFRIENDS(danLi.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        self.resourceArray = [dict objectForKey:@"data"];
        [self.FamilyTB reloadData];
    }];
}

-(void)createKit
{
    self.view.backgroundColor = WHITECOLOR;
    self.FamilyTB = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70) style:UITableViewStylePlain];
    self.FamilyTB.dataSource = self;
    self.FamilyTB.delegate = self;
    self.FamilyTB.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.FamilyTB];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resourceArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cellID";
    
    FamilyCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[FamilyCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.deleteImgView.hidden = YES;
    }
    
    cell.headerImage.frame = CGRectMake(10, 5, 40, 40);
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[self.resourceArray objectAtIndex:indexPath.row] objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiangfang"]];
    NSString *url = [NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[self.resourceArray objectAtIndex:indexPath.row] objectForKey:@"icon"]];
    NSLog(@"%@",url);
    
    cell.nameLabel.frame = CGRectMake(60, 5, WIDTH - 70, 20);
    cell.relationLabel.frame = CGRectMake(60, 25, WIDTH - 70, 20);
    
    cell.nameLabel.text = [[self.resourceArray objectAtIndex:indexPath.row] objectForKey:@"nick"];
    cell.relationLabel.text = [[self.resourceArray objectAtIndex:indexPath.row] objectForKey:@"relationship"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:ADD_FAMILY(danLi.token,[self.resourceArray[indexPath.row] objectForKey:@"other"]) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            [self.navigationController popViewControllerAnimated:YES];
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
    title.text = @"我关心";
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
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [navBar addSubview:lineView];
}

- (void)fanhui
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
