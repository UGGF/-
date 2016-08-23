//
//  moonletForumViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/5.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "moonletForumViewController.h"
#import "ExpertWriteViewController.h"
#import "moonLetTableViewCell.h"
#import "DetailViewController.h"

@interface moonletForumViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView *_tableView;
    NSArray *_dataArray;
    UIView *BgView;

}
@property(nonatomic,strong)UIView *blueLine;;
@property(nonatomic,strong)UIButton *redCicBtn;
@property (nonatomic , strong)UIView *myTempView;

@end

@implementation moonletForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor brownColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.resourceArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.tagArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.hotspot = @"";
    self.selectType = @"0";
    [self createNavBar];
    [self creatCircleFriend];
    [self creatTableView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self requestResouce];
}

-(void)requestResouce
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:FINDALL_ARTICLE(danLi.token, @"", self.selectType, self.hotspot, @"") Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            self.resourceArray = [dict objectForKey:@"data"];
            [_tableView reloadData];
        }
    }];
    
    [ZYHTTPRequest request:FINDALL_TAG Completion:^(NSDictionary *dict) {
        if ([[dict objectForKey:@"code"] intValue] == 200) {
        self.tagArray = [dict objectForKey:@"data"];
        [self.tagArray addObject:@"全部"];
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
    title.text = @"小月论坛";
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
    
    //导航头像
    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtn.frame = CGRectMake(WIDTH-50, 5, 40, 40);
    imageBtn.backgroundColor = [UIColor redColor];
    [imageBtn setImage:[UIImage imageNamed:@"touxiang"] forState:UIControlStateNormal];
    imageBtn.layer.cornerRadius = 20;
    imageBtn.layer.masksToBounds = YES;
    imageBtn.clipsToBounds = YES;
    [imageBtn addTarget:self action:@selector(touxiang) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:imageBtn];
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touxiang
{
    session *danLi = [session getInstance];
    ExpertWriteViewController *exper = [[ExpertWriteViewController alloc]init];
    exper.userId = danLi.userId;
    [self.navigationController pushViewController:exper animated:YES];
}





#pragma mark - 朋友圈分类
- (void)creatCircleFriend{
    BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT-70)];
    BgView.backgroundColor = LINECOLOR;
    [self.view addSubview:BgView];
    
    //朋友圈背景视图
    UIView *statusCirFriView = [[UIView alloc]initWithFrame:CGRectMake(0, 2, WIDTH, 40)];
    statusCirFriView.backgroundColor = [UIColor whiteColor];
//    statusCirFriView.layer.shadowColor = [UIColor greenColor].CGColor;//阴影颜色
//    statusCirFriView.layer.shadowOffset = CGSizeMake(0, 0);//偏移距离
//    statusCirFriView.layer.shadowOpacity = 0.5;//不透明度
//    statusCirFriView.layer.shadowRadius = 10.0;//半径
    [BgView addSubview:statusCirFriView];
    
    NSArray *ForumArr = @[@"小月说",@"亲友圈",@"专家团"];
    for (int i = 0; i < 3; i++) {
        UIButton *foBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [foBtn setTitle:ForumArr[i] forState:UIControlStateNormal];
        [foBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        foBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        foBtn.backgroundColor = WHITECOLOR;
        foBtn.layer.cornerRadius = 8;
        foBtn.frame = CGRectMake((WIDTH-200)/5*(i+1)+i*55, 7, 50, 20);
        foBtn.tag = i+204;
        [foBtn addTarget:self action:@selector(foBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [BgView addSubview:foBtn];        
    }
    
    self.blueLine = [[UIView alloc]initWithFrame:CGRectMake((WIDTH-200)/5, 27, 50, 3)];
    self.blueLine.backgroundColor = BGCOLOR;
    [BgView addSubview:self.blueLine];
    
    self.redCicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.redCicBtn.frame = CGRectMake((WIDTH-200)/5+50,8, 6,6);
    [ self.redCicBtn setBackgroundColor:REDCOLOR];
     self.redCicBtn.layer.cornerRadius = 3;
     self.redCicBtn.clipsToBounds = YES;
    [BgView addSubview: self.redCicBtn];

    //热点
    UIButton *hotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hotBtn.frame = CGRectMake((WIDTH-200)/5*4+150,7,60, 20);
    [hotBtn setTitle:@"热点>>" forState:UIControlStateNormal];
    [hotBtn setTitleColor: REDCOLOR forState:UIControlStateNormal];
    hotBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    hotBtn.layer.cornerRadius = 8;
    hotBtn.selected = NO;
    [hotBtn addTarget:self action:@selector(hotBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [hotBtn setBackgroundColor:[UIColor whiteColor]];
    [BgView addSubview:hotBtn];

}

-(void)createTag
{
    self.myTempView = [[UIView alloc]initWithFrame:CGRectMake(5, 33, WIDTH-10, 5+self.tagArray.count/4*(20+10) + 30)];
    self.myTempView.backgroundColor = WHITECOLOR;
    self.myTempView.layer.cornerRadius = 5;
    [BgView addSubview:self.myTempView];
    
    for (int i = 0; i < self.tagArray.count ; i++) {
        UIButton *resonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        resonBtn.frame = CGRectMake(((WIDTH - 10 - 240) / 5) + (i%4)*((WIDTH - 10 - 260) / 5 + 65), 5+(i/4)*(20+10), 65, 20);
        resonBtn.backgroundColor = WHITECOLOR;
        resonBtn.layer.cornerRadius = 3;
        resonBtn.clipsToBounds = NO;
        resonBtn.layer.borderWidth = 1;
        resonBtn.layer.borderColor = [UIColor grayColor].CGColor;
        [resonBtn setTitle:self.tagArray[i] forState:UIControlStateNormal];
        [resonBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        resonBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [resonBtn addTarget:self action:@selector(resonBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.myTempView addSubview:resonBtn];
    }

}

-(void)hotBtnClick:(UIButton *)sender
{
    [UIView animateWithDuration:0.4 animations:^{
        sender.selected = !sender.selected;
        if (sender.selected) {
             _tableView.frame = CGRectMake(0, 33 + 5+(self.tagArray.count /4)*(20+10) + 30 + 5, WIDTH, HEIGHT-100);
            [self createTag];
           
            
            NSLog(@"11111111");
        }else
        {
            _tableView.frame = CGRectMake(0, 33, WIDTH, HEIGHT-100);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.myTempView removeFromSuperview];
            });
            NSLog(@"22222222");
        }
    }];
  
}

- (void)foBtnClick:(UIButton *)sender{
    [UIView animateWithDuration:0.4 animations:^{
        self.blueLine.center = CGPointMake(sender.center.x, sender.center.y + 12);
    }];
    self.hotspot = @"";
    switch (sender.tag - 204) {
        case 0:
        {
            if (![self.selectType isEqualToString:@"0"]) {
                self.selectType = @"0";
            }
            break;
        }
        case 1:
        {
            if (![self.selectType isEqualToString:@"1"]) {
                self.selectType = @"1";
            }
            break;
        }
        case 2:
        {
            if (![self.selectType isEqualToString:@"2"]) {
                self.selectType = @"2";
            }
            break;
        }
            
        default:
            break;
    }
    [self requestResouce];

}





- (void)resonBtnClick:(UIButton *)resonBtn{
    self.hotspot = resonBtn.titleLabel.text;
    if ([self.hotspot isEqualToString:@"全部"]) {
        self.hotspot = @"";
    }
    _tableView.frame = CGRectMake(0, 33, WIDTH, HEIGHT-100);
    [self.myTempView removeFromSuperview];
    [self requestResouce];
//        XYSViewController *write = [[XYSViewController alloc]init];
//        [self.navigationController pushViewController:write animated:YES];
}





#pragma mark - tableView
//论坛说说栏
- (void)creatTableView{
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 33, WIDTH, HEIGHT-100) style:UITableViewStylePlain];
     _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [BgView addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"moonLetTableViewCell";
    moonLetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    self.dataDict = self.resourceArray[indexPath.row];
    
    cell.timeLab.text = [NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"hdt"]];
    [cell.signBtn setTitle:[NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"tag"]] forState:UIControlStateNormal] ;
    cell.reviewNumLab.text = [NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"commentCount"]];
    
    if (![[self.dataDict objectForKey:@"imgs"] isEqualToString:@""]) {
        NSArray  *array = [[self.dataDict objectForKey:@"imgs"] componentsSeparatedByString:@","];
        if (array.count < 1) {
            cell.contentLab.text = [NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"ct"]];
            cell.contentLab.hidden = NO;
            cell.imaV.hidden = YES;
            cell.imaV1.hidden = YES;
            cell.imaV2.hidden = YES;
            cell.imaV3.hidden = YES;
            
        }else
        {
            cell.contentLab.hidden = YES;
            if (array.count == 1) {
                cell.imaV.hidden = NO;
                cell.imaV1.hidden = YES;
                cell.imaV2.hidden = YES;
                cell.imaV3.hidden = YES;
                [cell.imaV setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[0]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
            }else if (array.count == 2) {
                cell.imaV.hidden = NO;
                cell.imaV1.hidden = NO;
                cell.imaV2.hidden = YES;
                cell.imaV3.hidden = YES;
                [cell.imaV setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[0]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
                [cell.imaV1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[1]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
            }else if (array.count == 3) {
                cell.imaV.hidden = NO;
                cell.imaV1.hidden = NO;
                cell.imaV2.hidden = NO;
                cell.imaV3.hidden = YES;
                [cell.imaV setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[0]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
                [cell.imaV1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[1]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
                [cell.imaV2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[2]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
            }else if (array.count >= 4) {
                cell.imaV.hidden = NO;
                [cell.imaV setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[0]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
                cell.imaV1.hidden = NO;
                [cell.imaV1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[1]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
                cell.imaV2.hidden = NO;
                [cell.imaV2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[2]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
                cell.imaV3.hidden = NO;
                [cell.imaV3 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,array[3]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
            }
        }
    }
    
    cell.titleLab.text = [NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"title"]];
    cell.reviewNumLab.text = @"100";
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[self.dataDict objectForKey:@"user"] objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
    [cell.collectBtn setTitle:[NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"collect"]] forState:UIControlStateNormal];
    [cell.praiseBtn setTitle:[NSString stringWithFormat:@"%@",[self.dataDict objectForKey:@"like"]] forState:UIControlStateNormal];
    cell.collectBtn.selected = [[self.dataDict objectForKey:@"collected"] boolValue];
    cell.praiseBtn.selected = [[self.dataDict objectForKey:@"liked"] boolValue];
    cell.collectBtn.tag = 1345 + indexPath.row;
    cell.praiseBtn.tag = 2345 + indexPath.row;
    [cell.myBtn addTarget:self action:@selector(myBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.myBtn.tag = 3345 + indexPath.row;
    cell.myBtn.backgroundColor = [UIColor redColor];
    return cell;
}

-(void)myBtnClick:(UIButton *)sender
{
    ExpertWriteViewController *expert = [[ExpertWriteViewController alloc]init];
    expert.userId = [[[self.resourceArray objectAtIndex:sender.tag - 3345] objectForKey:@"user"] objectForKey:@"id"];
    [self.navigationController pushViewController:expert animated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.articleId = [[self.resourceArray objectAtIndex:indexPath.row] objectForKey:@"id"];
    [self.navigationController pushViewController:detail animated:YES];
    
//        switch (indexPath.row) {
//            case 0:
//            {
//               DetailViewController *detail = [[DetailViewController alloc]init];
//                [self.navigationController pushViewController:detail animated:YES];
//            }
//                break;
//            case 1:
//            {
//                XYSViewController *write = [[XYSViewController alloc]init];
//                [self.navigationController pushViewController:write animated:YES];
//            }
//                break;
//    
//            default:
//                break;
//        }
//


}



//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//}







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
