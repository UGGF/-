//
//  RemoveBlaListViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/7.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "RemoveBlaListViewController.h"
#import "AddFriendTableViewCell.h"
#import "FixRemarkViewController.h"
#import "AddFriendViewController.h"
#import "RelationShipViewController.h"


@interface RemoveBlaListViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UIImageView *myTempView;
    UIButton *_hypnosisBtn;
    UIView *_hypnosisView;
    UIView *_hideView;
}
@property (nonatomic,weak)UIImageView *myView;



@end

@implementation RemoveBlaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self creatImageInfo];
    _array = @[@"身份关系",@"分组管理",@"权限管理",@"小月之家",@"好友来源"];
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
    [MoreBtn addTarget:self action:@selector(MoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:MoreBtn];
    
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
    self.myView.hidden = YES;

}
- (void)creatClickView{
    NSArray *typeArr = @[@"修改备注",@"添加关系",@"权限管理",@"分组管理"];
    myTempView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 90, 60,90, 30*typeArr.count+5)];
    myTempView.image = [UIImage imageNamed:@"menuBackground"];
    myTempView.layer.cornerRadius = 5;
    myTempView.userInteractionEnabled = YES;
    
    for (int i = 0; i < typeArr.count; i++) {
        UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [typeBtn setTitle:typeArr[i] forState:UIControlStateNormal];
        [typeBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        typeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        typeBtn.frame = CGRectMake(8, i*30, 70, 30);
        typeBtn.tag = 120+i;
        [typeBtn addTarget:self action:@selector(typeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [myTempView addSubview:typeBtn];
        
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(3, 30+30*i, 120, 1)];
        line.backgroundColor = LINECOLOR;
        [myTempView addSubview:line];
    }
  
    self.myView = myTempView;
    myTempView.hidden = YES;
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window] ;
    [window addSubview:myTempView];
    
}

- (void)MoreBtnClick{
    
    if (self.menuIsopen == NO) {
        self.myView.hidden = NO;
        self.menuIsopen = YES;
    }else if (self.menuIsopen == YES){
        self.myView.hidden = YES;
        self.menuIsopen = NO;
    }
    
}


- (void)typeBtn:(UIButton *)sender{
    switch (sender.tag) {
        case 120:
        {
        
        }
            break;
        case 121:
        {
            RelationShipViewController *relation = [[RelationShipViewController alloc]init];
            [self.navigationController pushViewController:relation animated:YES];
            self.myView.hidden = YES;
        }
            break;
        case 122:
        {
            
        }
            break;
        case 123:
        {
            
        }
            break;
        default:
            break;
    }


}

- (void)menuButton4:(UIButton *)button5{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"加入黑名单，对方通讯录中将直接删除你的资料，且不能主动加你为好友" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击确定按钮后弹出的弹框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"删除好友，双方通讯录中将直接删除对方的资料！" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮的响应事件
            self.myView.hidden = YES;

        }]];
        [self presentViewController:alert animated:true completion:nil];
    }]];
    [self presentViewController:alert animated:true completion:nil];
}

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
    lab.textColor =TEXTCOLOR;
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
    fbtn.backgroundColor = DARKCOLOR;
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
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 129+70, WIDTH, 40 *_array.count) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.backgroundColor = WHITECOLOR;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"AddFriendTableViewCell";
    AddFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.detailLabel.text =_array[indexPath.row];
    cell.detailLabel.font = [UIFont systemFontOfSize:15];
    cell.detailLabel.textColor = TEXTCOLOR;
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            RelationShipViewController *relation = [[RelationShipViewController alloc]init];
            [self.navigationController pushViewController:relation animated:YES];
            self.myView.hidden = YES;
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;

    }
}

#pragma mark - 申请超出次数弹出的视图
- (void)createOverRunView{
    _hideView = [[UIView alloc]initWithFrame:CGRectMake(10, 80, WIDTH-20, 40)];
    _hideView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    [self.view addSubview:_hideView];
    _hideView.hidden = YES;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10,0, WIDTH-40, 20)];
    lab.numberOfLines = 0;
    lab.text = @"今天申请加对方为好友已超3次,请明天再申请或等待对方通过!";
    lab.textColor = WHITECOLOR;
    lab.font = [UIFont systemFontOfSize:13];
    lab.textAlignment = NSTextAlignmentLeft;
    [_hideView addSubview:lab];

}


#pragma mark - 催睡View
- (void)creatHypnosisView{
    UIView *hypnosisView = [[UIView alloc]initWithFrame:CGRectMake(0, 129+70+200, WIDTH, HEIGHT-399)];
    hypnosisView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:hypnosisView];
    
    UILabel *desLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 9, 60, 30)];
    desLab.text = @"描述简介";
    desLab.font = [UIFont systemFontOfSize:15];
    desLab.textColor = TEXTCOLOR;
    [hypnosisView addSubview:desLab];
    
    UILabel *conLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 3, WIDTH-79-30, 60)];
    conLable.textColor = TEXTCOLOR;
    conLable.text = @"颐养生命、增强体质、预防疾病，从而达到延年益寿。";
    conLable.lineBreakMode = NSLineBreakByWordWrapping;
    conLable.numberOfLines = 0;
    conLable.clipsToBounds = YES;
    conLable.font = [UIFont systemFontOfSize:15];
    [hypnosisView addSubview:conLable];
    
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(15, HEIGHT-399-100, WIDTH-30, 40);
    [addBtn setTitle:@"加为好友" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    addBtn.clipsToBounds = YES;
    addBtn.layer.cornerRadius = 1;
    addBtn.backgroundColor = GREENCOLOR;
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [hypnosisView addSubview:addBtn];
}

- (void)addBtnClick:(UIButton *)sender{
        AddFriendViewController *add = [[AddFriendViewController alloc]init];
        [self.navigationController pushViewController:add animated:YES];
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
