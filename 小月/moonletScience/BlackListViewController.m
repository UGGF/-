//
//  BlackListViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/7.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "BlackListViewController.h"
#import "InfoTableViewCell.h"
#import "FixRemarkViewController.h"
#import "RemoveBlaListViewController.h"

@interface BlackListViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UIImageView *myTempView;
    UIButton *_hypnosisBtn;
    UIView *_hypnosisView;
}
@property (nonatomic,weak)UIImageView *myView;


@end

@implementation BlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self creatImageInfo];
    _array = @[@"身份关系",@"权限管理",@"小月之家",@"好友来源"];
    [self creatTableView];
    [self creatHypnosisView];
    [self creatClickView];
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
    UIButton *MoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    MoreBtn.frame = CGRectMake(WIDTH-25, 10, 8, 28);
    //    MoreBtn.backgroundColor = [UIColor yellowColor];
    [MoreBtn setBackgroundImage:[UIImage imageNamed:@"more.png"] forState:UIControlStateNormal];
    MoreBtn.layer.cornerRadius = 1;
    MoreBtn.clipsToBounds = YES;
    MoreBtn.selected = YES;
    [MoreBtn addTarget:self action:@selector(MoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:MoreBtn];
    
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
    self.myView.hidden = YES;

}
- (void)creatClickView{
    myTempView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 90, 60,90, 90)];
    myTempView.image = [UIImage imageNamed:@"menuBackground"];
    myTempView.layer.cornerRadius = 5;
    myTempView.userInteractionEnabled = YES;
    
    [self.view addSubview:myTempView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"修改备注" forState:UIControlStateNormal];
    [button1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:14];
    button1.frame = CGRectMake(0, 0, 70, 30);
    //    [button1 addTarget:self action:@selector(menuButton1:) forControlEvents:UIControlEventTouchUpInside];
    [myTempView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"移出黑名单" forState:UIControlStateNormal];
    [button2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:14];
    button2.frame = CGRectMake(5, 30, 70, 30);
    [button2 addTarget:self action:@selector(menuButton2) forControlEvents:UIControlEventTouchUpInside];
    [myTempView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"添加关系" forState:UIControlStateNormal];
    [button3 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:14];
    button3.frame = CGRectMake(0, 60, 70, 30);
    //    [button1 addTarget:self action:@selector(menuButton1:) forControlEvents:UIControlEventTouchUpInside];
    [myTempView addSubview:button3];
    
//    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button4 setTitle:@"删除好友" forState:UIControlStateNormal];
//    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    button4.titleLabel.font = [UIFont systemFontOfSize:14];
//    button4.frame = CGRectMake(0, 90, 70, 30);
//    //    [button1 addTarget:self action:@selector(menuButton1:) forControlEvents:UIControlEventTouchUpInside];
//    [myTempView addSubview:button4];
//    
//    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button5 setTitle:@"加入黑名单" forState:UIControlStateNormal];
//    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    button5.titleLabel.font = [UIFont systemFontOfSize:14];
//    button5.frame = CGRectMake(5, 120, 70, 30);
//    [button5 addTarget:self action:@selector(menuButton5:) forControlEvents:UIControlEventTouchUpInside];
//    [myTempView addSubview:button5];
    
    
    
    myTempView.hidden = YES;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(3, 30, 120, 1)];
    line.backgroundColor = LINECOLOR;
    [myTempView addSubview:line];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(3, 30 + 30, 120, 1)];
    line1.backgroundColor = LINECOLOR;
    [myTempView addSubview:line1];
    
//    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(3, 30 + 30+30, 120, 1)];
//    line2.backgroundColor = [UIColor grayColor];
//    [myTempView addSubview:line2];
//    
//    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(3, 30 + 30+30+30-2, 120, 1)];
//    line3.backgroundColor = [UIColor grayColor];
//    [myTempView addSubview:line3];
//    
    
}

- (void)MoreBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected == NO) {
        myTempView.hidden = NO;
    }else{
        myTempView.hidden = YES;
    }
    
}
- (void)menuButton2{
    RemoveBlaListViewController *recover = [[RemoveBlaListViewController alloc]init];
    [self.navigationController pushViewController:recover animated:YES];
    self.myView.hidden = YES;

}

//
//- (void)menuButton5:(UIButton *)button5{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"加入黑名单，对方通讯录中将直接删除你的资料，且不能主动加你为好友" preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //点击确定按钮后弹出的弹框
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"删除好友，双方通讯录中将直接删除对方的资料！" preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
//        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            //点击按钮的响应事件
//        }]];
//        [self presentViewController:alert animated:true completion:nil];
//    }]];
//    [self presentViewController:alert animated:true completion:nil];
//}

#pragma mark - 个人信息头像
- (void)creatImageInfo{
    //创建View背景
    UIView *ImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT-70)];
    ImageView.backgroundColor = LINECOLOR;
    [self.view addSubview:ImageView];
    
    //创建头像背景
    UIView *sonImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 2, WIDTH, 80)];
    sonImageView.backgroundColor = [UIColor whiteColor];
    [ImageView addSubview:sonImageView];
    
    UIButton *ImaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ImaBtn.frame = CGRectMake(10, 10, 60, 60);
    ImaBtn.layer.cornerRadius = 30;
    ImaBtn.clipsToBounds = YES;
    ImaBtn.backgroundColor = [UIColor yellowColor];
    [sonImageView addSubview:ImaBtn];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, 50, 10)];
    lab.text = @"奥巴马";
    //    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:12];
    lab.textColor = TEXTCOLOR;
    [sonImageView addSubview:lab];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, 30, 10)];
    //  lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:9];
    lable.textColor = TEXTTINTCOLOR;
    lable.text = @" 39岁";
    [sonImageView addSubview:lable];
    NSArray *arr = @[@"男",@"浙江",@"宁波"];
    for (int i = 0; i <3; i++) {
        UILabel *ilab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3+10+i*25, 45, 20, 10)];
        ilab.text = arr[i];
        ilab.font = [UIFont systemFontOfSize:9];
        ilab.textColor = TEXTTINTCOLOR;
        [sonImageView addSubview:ilab];
    }
    UIButton *sbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sbtn.frame = CGRectMake(WIDTH/3+20, 45, 10, 10);
    [sbtn setBackgroundImage:[UIImage imageNamed:@"men_icon.png"]  forState:UIControlStateNormal];
    sbtn.clipsToBounds = YES;
    [sonImageView addSubview:sbtn];
    
    UIButton *fbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fbtn.frame = CGRectMake(WIDTH-70, 15, 50, 20);
    fbtn.backgroundColor = SLIVERYCOLOR;
    [fbtn setTitle:@"修改备注" forState:UIControlStateNormal];
    [fbtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    fbtn.layer.cornerRadius = 3;
    fbtn.titleLabel.font = [UIFont systemFontOfSize:9];
    [fbtn addTarget:self action:@selector(fixBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [sonImageView addSubview:fbtn];
    
    //创建关注背景
    UIView *careView = [[UIView alloc]initWithFrame:CGRectMake(0, 84, WIDTH, 40)];
    careView.backgroundColor = [UIColor whiteColor];
    [ImageView addSubview:careView];
    
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 40, 10)];
    la.text = @"  关注:";
    la.textColor = TEXTTINTCOLOR;
    la.font = [UIFont systemFontOfSize:11];
    [careView addSubview:la];
    
    UILabel *numla = [[UILabel alloc]initWithFrame:CGRectMake(50, 14, 80, 10)];
    numla.text = @"1209";
    numla.textColor = TEXTTINTCOLOR;
    numla.font = [UIFont systemFontOfSize:12];
    [careView addSubview:numla];
    
    UILabel *tuila = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-100, 15, 50, 10)];
    tuila.text = @"推荐指数:";
    tuila.textColor = TEXTTINTCOLOR;
    tuila.font = [UIFont systemFontOfSize:11];
    [careView addSubview:tuila];
    
    UILabel *numlable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-45, 14, 80, 10)];
    numlable.text = @"1869";
    numlable.textColor = TEXTTINTCOLOR;
    numlable.font = [UIFont systemFontOfSize:12];
    [careView addSubview:numlable];
}

- (void)fixBtnClick{
    FixRemarkViewController *fix = [[FixRemarkViewController alloc]init];
    [self.navigationController pushViewController:fix animated:YES];
    
}

#pragma mark - tableView
- (void)creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 129+70, WIDTH, 160) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"InfoTableViewCell";
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.InLabel.text =_array[indexPath.row];
    cell.InLabel.textColor = TEXTCOLOR;
    cell.InLabel.font = [UIFont systemFontOfSize:15];
    return cell;
    
}

#pragma mark - 催睡View
- (void)creatHypnosisView{
    _hypnosisView = [[UIView alloc]initWithFrame:CGRectMake(0, 359, WIDTH, HEIGHT-359)];
    _hypnosisView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_hypnosisView];
    
    UILabel *desLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 9, 60, 30)];
    desLab.text = @"描述简介";
    desLab.font = [UIFont systemFontOfSize:15];
    desLab.textColor = TEXTCOLOR;
    [_hypnosisView addSubview:desLab];
    
    UILabel *conLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 3, WIDTH-79-30, 60)];
    conLable.textColor = TEXTCOLOR;
    conLable.text = @"颐养生命、增强体质、预防疾病，从而达到延年益寿。";
    conLable.lineBreakMode = NSLineBreakByWordWrapping;
    conLable.numberOfLines = 0;
    conLable.clipsToBounds = YES;
    conLable.font = [UIFont systemFontOfSize:15];
    [_hypnosisView addSubview:conLable];
    
    
    _hypnosisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hypnosisBtn.frame = CGRectMake(15, HEIGHT-399-100, WIDTH-30, 40);
    [_hypnosisBtn setTitle:@"移出黑名单" forState:UIControlStateNormal];
    _hypnosisBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _hypnosisBtn.clipsToBounds = YES;
    _hypnosisBtn.layer.cornerRadius = 1;
    _hypnosisBtn.backgroundColor = GREENCOLOR;
    [_hypnosisBtn addTarget:self action:@selector(hypnosisBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_hypnosisView addSubview:_hypnosisBtn];
    
}


- (void)hypnosisBtnClick{
    RemoveBlaListViewController *recover1 = [[RemoveBlaListViewController alloc]init];
    [self.navigationController pushViewController:recover1 animated:YES];
    self.myView.hidden = YES;

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
