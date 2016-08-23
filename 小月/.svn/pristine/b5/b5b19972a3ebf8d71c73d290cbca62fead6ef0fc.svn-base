//
//  CitierViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/12.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "CitierViewController.h"
#import "InfoTableViewCell.h"
#import "FixRemarkViewController.h"
#import "BlackListViewController.h"

@interface CitierViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UIImageView *myTempView;
}
@property (nonatomic,weak)UIImageView *myView;


@end

@implementation CitierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self creatImageInfo];
    _array = @[@"身份关系",@"分组管理",@"权限管理",@"小月之家",@"好友来源",@"联系方式"];
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
    NSArray *typeArr = @[@"修改备注",@"权限管理",@"删除好友",@"加入黑名单",@"添加关系",@"分组管理"];
    myTempView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 90, 60,90, 31 * typeArr.count)];
    myTempView.image = [UIImage imageNamed:@"menuBackground"];
    myTempView.layer.cornerRadius = 5;
    myTempView.userInteractionEnabled = YES;
    
    for (int i = 0; i < typeArr.count; i++) {
        UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [typeBtn setTitle:typeArr[i] forState:UIControlStateNormal];
        [typeBtn setTitleColor:RGBCOLOR(51, 51, 51) forState:UIControlStateNormal];
        typeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        typeBtn.frame = CGRectMake(8, 0+i*30, 70, 30);
        typeBtn.tag = 110+i;
        [typeBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [myTempView addSubview:typeBtn];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(3, 30+i*30, 120, 1)];
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

- (void)typeBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 110:
        {
            
        }
            break;
        case 111:
        {
            
        }
            break;
        case 112:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"删除好友,双方通讯录将直接删除对方的资料!" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击确定按钮后弹出的弹框
                
            }]];
            [self presentViewController:alert animated:true completion:nil];
            
        }
            break;
        case 113:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警示" message:@"加入黑名单，对方通讯录中将直接删除你的资料，且不能主动加你为好友" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击确定按钮后弹出的弹框
                self.myView.hidden = YES;
                BlackListViewController *black = [[BlackListViewController alloc]init];
                [self.navigationController pushViewController:black animated:YES];
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
        case 114:
        {
            
        }
            break;
        case 115:
        {
            
        }
            break;
            
    }
}

#pragma mark - 个人信息头像
- (void)creatImageInfo{
    //创建View背景
    UIView *ImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT-70)];
    ImageView.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:ImageView];
    
    //创建头像背景
    UIView *sonImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 2, WIDTH, 80)];
    sonImageView.backgroundColor = [UIColor whiteColor];
    [ImageView addSubview:sonImageView];
    
    UIButton *ImaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ImaBtn.frame = CGRectMake(10, 10, 60, 60);
    [ImaBtn setBackgroundImage:[UIImage imageNamed:@"add_head_photo.png"] forState:UIControlStateNormal];
    ImaBtn.adjustsImageWhenHighlighted = NO;
    ImaBtn.layer.cornerRadius = 30;
    ImaBtn.clipsToBounds = YES;
    ImaBtn.backgroundColor = [UIColor yellowColor];
    [sonImageView addSubview:ImaBtn];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, 50, 10)];
    lab.text = @"奥巴马";
    lab.textColor = TEXTCOLOR;
    //    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:12];
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
        ilab.textColor =  TEXTTINTCOLOR;
        [sonImageView addSubview:ilab];
    }
    UIButton *sbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sbtn.frame = CGRectMake(WIDTH/3+20, 45, 10, 10);
    [sbtn setBackgroundImage:[UIImage imageNamed:@"men_icon.png"]  forState:UIControlStateNormal];
    sbtn.clipsToBounds = YES;
    [sonImageView addSubview:sbtn];
    
    UIButton *fbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fbtn.frame = CGRectMake(WIDTH-70, 15, 50, 20);
    fbtn.backgroundColor = RGBCOLOR(208, 208, 208);
    [fbtn setTitle:@"修改备注" forState:UIControlStateNormal];
    [fbtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    fbtn.layer.cornerRadius = 3;
    fbtn.titleLabel.font = [UIFont systemFontOfSize:9];
    [fbtn addTarget:self action:@selector(fixBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [sonImageView addSubview:fbtn];
    
    //创建关注背景
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
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 129+70, WIDTH, 240) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
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
    cell.InLabel.textColor = TEXTGRAYCOLOR;
    cell.InLabel.font = [UIFont systemFontOfSize:15];
    return cell;
    
}

#pragma mark - 催睡View
- (void)creatHypnosisView{
    UIView *hypnosisView = [[UIView alloc]initWithFrame:CGRectMake(0, 439, WIDTH, HEIGHT-399)];
    hypnosisView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:hypnosisView];
    
    UILabel *desLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 9, 60, 30)];
    desLab.text = @"描述简介";
    desLab.font = [UIFont systemFontOfSize:15];
    desLab.textColor = TEXTGRAYCOLOR;
    [hypnosisView addSubview:desLab];
    
    UILabel *conLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 3, WIDTH-79-30, 60)];
    conLable.textColor = TEXTGRAYCOLOR;
    conLable.text = @"颐养生命、增强体质、预防疾病，从而达到延年益寿。";
    conLable.lineBreakMode = NSLineBreakByWordWrapping;
    conLable.numberOfLines = 0;
    conLable.clipsToBounds = YES;
    conLable.font = [UIFont systemFontOfSize:15];
    [hypnosisView addSubview:conLable];
    
    
    UIButton *hypnosisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hypnosisBtn.frame = CGRectMake(15, HEIGHT-399-100, WIDTH-30, 40);
    [hypnosisBtn setTitle:@"催睡/叫醒" forState:UIControlStateNormal];
    hypnosisBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    hypnosisBtn.clipsToBounds = YES;
    hypnosisBtn.layer.cornerRadius = 1;
    hypnosisBtn.backgroundColor = RGBCOLOR(106, 195, 53);
    [hypnosisView addSubview:hypnosisBtn];
    
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
