//
//  DetailViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "DetailViewController.h"
#import "PulisherViewController.h"
#import "ExpertWriteViewController.h"

#import "PersonDataViewController.h"
#import "MySettingViewController.h"
#import "MoonletShopViewController.h"
#import "MyPillowViewController.h"
#import "ReportViewController.h"
#import "ArticleDetailCell.h"


@interface DetailViewController ()<UITextViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    UIView *_detailView;
    UILabel *_collectNumLab;
}
@property(nonatomic,weak)UIImageView *myView;
@property(nonatomic,strong)UIView *inputBgView;
@property(nonatomic,strong)UITextView *message;
@property(nonatomic,strong)UITextField *textF;
@property(nonatomic,strong)UILabel *PLlab;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *PopView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.targetUserId = @"";
    self.nameStr = @"";
    self.view.backgroundColor = WHITECOLOR;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self creatUI];
//    [self createCommentView];
    [self requestArticleInfo];
    
}

-(void)requestArticleInfo
{
    session *danli = [session getInstance];
    
    [ZYHTTPRequest request:FINDBYID_ARTICLE(danli.token, self.articleId) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
        self.resourceDict = [dict objectForKey:@"article"];
        self.commentArray = [dict objectForKey:@"comments"];
        [self.tableView reloadData];
        }
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
    title.text = @"详情";
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
    
    //发布按钮
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(WIDTH-50, 10, 30, 30);
    //writeBtn.backgroundColor = [UIColor redColor];
    [writeBtn setImage:[UIImage imageNamed:@"fatie.png"] forState:UIControlStateNormal];
    //[writeBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 35, 35)];
    [writeBtn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:writeBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    line.backgroundColor = LINECOLOR;
    [navBar addSubview:line];
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)publish
{
    PulisherViewController *publish = [[PulisherViewController alloc]init];
    [self.navigationController pushViewController:publish animated:YES];
}

#pragma mark - 评论背景视图
- (void)creatUI{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70 - 50) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = WHITECOLOR;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    self.inputBgView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT - 50, WIDTH, 50)];
    self.inputBgView.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.inputBgView];
    
    
    //评论input
    self.message = [[UITextView alloc]initWithFrame:CGRectMake(10, 5, WIDTH-30-40, 40)];
    self.message.textColor = TEXTCOLOR;
    self.message.font = [UIFont systemFontOfSize:14];
    self.message.layer.borderWidth = 1;
    self.message.layer.borderColor = TEXTTINTCOLOR.CGColor;
    self.message.layer.masksToBounds = YES;
    self.message.delegate = self;
    [self.inputBgView addSubview:self.message];
    
    self.PLlab = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, WIDTH / 2, 40)];
    self.PLlab.text = @"评论(最多150字)";
    self.PLlab.font = [UIFont systemFontOfSize:14];
    self.PLlab.textColor = TEXTTINTCOLOR;
    [self.message addSubview:self.PLlab];
    
    //发送
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(WIDTH-50, 5 ,45, 40);
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [sendBtn setBackgroundColor:SLIVERYCOLOR];
    sendBtn.layer.cornerRadius = 3;
    sendBtn.clipsToBounds = YES;
    [sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.inputBgView addSubview:sendBtn];
    
    
}

-(void)sendBtnClick
{
    session *danLi = [session getInstance];
    NSString *str = [self.message.text stringByReplacingOccurrencesOfString:self.nameStr withString:@""];
    [ZYHTTPRequest request:COMMENT_ARTICLE(danLi.token, self.articleId, str, self.targetUserId) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            self.PLlab.hidden = NO;
            self.message.text = @"";
            [self.view endEditing:YES];
            [self requestArticleInfo];
        }
    }];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _detailView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT-70)];
    _detailView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_detailView];
    
    UIImageView *headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    [headerImg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[self.resourceDict objectForKey:@"user"] objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
    [_detailView addSubview:headerImg];
    
    //头像
    UIButton *myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myBtn.frame = CGRectMake(10, 10, 40, 40);
    //    myBtn.layer.masksToBounds =YES;
    [myBtn addTarget:self action:@selector(myBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_detailView addSubview:myBtn];
    
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signBtn setBackgroundImage:[UIImage imageNamed:@"expert_icon.png"] forState:UIControlStateNormal];
    signBtn.frame = CGRectMake(0, 25, 15, 15);
    signBtn.adjustsImageWhenHighlighted = NO;
    signBtn.layer.cornerRadius =1;
    signBtn.clipsToBounds =YES;
    [myBtn addSubview:signBtn];
    
    //昵称
    UILabel *myLable2 = [[UILabel alloc]init];
    myLable2.frame = CGRectMake(10+50, 10,160, 20);
    myLable2.font = [UIFont systemFontOfSize:16];
    myLable2.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"title"]];
    myLable2.textColor =  TEXTCOLOR;
    [_detailView addSubview:myLable2];
    
    UIFont  *font = [UIFont systemFontOfSize:14];
    CGSize size = [[NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"ct"]] sizeWithFont:font constrainedToSize:CGSizeMake(WIDTH - 70, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    
    UILabel *myLable3 = [[UILabel alloc]init];
    myLable3.font = [UIFont systemFontOfSize:14];
    myLable3.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"ct"]];
    myLable3.textColor = TEXTCOLOR;
    myLable3.lineBreakMode = NSLineBreakByWordWrapping;
    myLable3.numberOfLines = 0;
    myLable3.frame = CGRectMake(60, 15+20, WIDTH - 70 , size.height);
    [_detailView addSubview:myLable3];
    
    self.imgArray = [[self.resourceDict objectForKey:@"imgs"] componentsSeparatedByString:@","];
  
    
    for (int i = 0; i < self.imgArray.count ; i++) {
        int x = 60 + 74 * (i % 3);
        int y = 15 + 20 + size.height + 10 + 74 * ( i / 3);
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 64, 64)];
        [image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,self.imgArray[i]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
        [_detailView addSubview:image];
        
        UIButton *imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, 64, 64)];
        imageBtn.tag = 123 + i;
        [imageBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_detailView addSubview:imageBtn];
    }
   
    //收藏
    UIButton *moonletBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moonletBtn.frame = CGRectMake(WIDTH-120, 10, 80, 20);
    [moonletBtn setTitle:[NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"collect"]] forState:UIControlStateNormal];
    [moonletBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shouchang" ofType:@"png"]] forState:UIControlStateNormal];
    [moonletBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shoucang" ofType:@"png"]] forState:UIControlStateSelected];
    CGSize titleSize1 = moonletBtn.titleLabel.bounds.size;
    [moonletBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize1.width - 2, 0,-titleSize1.width + 2)];
    [moonletBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    moonletBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    moonletBtn.selected = [[self.resourceDict objectForKey:@"collected"] boolValue];
    [moonletBtn addTarget:self action:@selector(collectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_detailView addSubview:moonletBtn];
    
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(WIDTH - 40,10, 30, 20);
    [shareBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"share-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [shareBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0,-5)];
    [_detailView addSubview:shareBtn];
    
    int picHeight;
    
    if (self.imgArray.count > 0) {
        if (self.imgArray.count % 3) {
            picHeight = 74 * ( self.imgArray.count / 3) + 74;
        }else
        {
            picHeight = 74 * ( self.imgArray.count / 3);
        }
        
    }else
    {
        picHeight = 74 * ( self.imgArray.count / 3) + 0;
    }
    
    
    //发布时间
    UILabel *myLable1 = [[UILabel alloc]init];
    myLable1.frame = CGRectMake(10, 15 + 20 + size.height + 10 + picHeight , 70, 20);
    myLable1.font = [UIFont systemFontOfSize:13];
    myLable1.text = [NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"hdt"]];
    myLable1.textColor = TEXTTINTCOLOR;
    [_detailView addSubview:myLable1];
    
    //点赞
    UIButton *dianzanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dianzanBtn.frame = CGRectMake(90, 15 + 20 + size.height + 10 + picHeight, 80, 20);
    [dianzanBtn setTitle:[NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"like"]] forState:UIControlStateNormal];
    [dianzanBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"meizan" ofType:@"png"]] forState:UIControlStateNormal];
    [dianzanBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zan" ofType:@"png"]] forState:UIControlStateSelected];
    titleSize1 = dianzanBtn.titleLabel.bounds.size;
    [dianzanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize1.width - 2, 0,-titleSize1.width + 2)];
    [dianzanBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    dianzanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    dianzanBtn.selected = [[self.resourceDict objectForKey:@"liked"] boolValue];
    [dianzanBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_detailView addSubview:dianzanBtn];
    
    //评论
    UIButton *pinglunBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pinglunBtn.frame = CGRectMake(180, 15 + 20 + size.height + 10 + picHeight, 80, 20);
    [pinglunBtn setTitle:[NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"commentCount"]] forState:UIControlStateNormal];
    [pinglunBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pinglun" ofType:@"png"]] forState:UIControlStateNormal];
    titleSize1 = pinglunBtn.titleLabel.bounds.size;
    [pinglunBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize1.width - 2, 0,-titleSize1.width + 2)];
    [pinglunBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    pinglunBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [pinglunBtn addTarget:self action:@selector(pinglunBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_detailView addSubview:pinglunBtn];
    
    UIButton *reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reportBtn.frame = CGRectMake(WIDTH-50,  15 + 20 + size.height + 10 + picHeight, 40, 20);
    [reportBtn setTitle:@"举报" forState:UIControlStateNormal];
    [reportBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    reportBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [reportBtn addTarget:self action:@selector(reportBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_detailView addSubview:reportBtn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 15 + 20 + size.height + 10 + picHeight + 29, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [_detailView addSubview:lineView];
    
    return _detailView;
}

-(void)imageBtnClick:(UIButton *)sender
{
    [self.view endEditing:YES];
    self.picScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70)];
    [self.picScroll setContentSize:CGSizeMake(WIDTH * self.imgArray.count, HEIGHT - 70)];
    self.picScroll.pagingEnabled = YES;
    self.picScroll.showsHorizontalScrollIndicator = NO;
    self.picScroll.showsVerticalScrollIndicator = NO;
    self.picScroll.bounces = NO;
    [self.view addSubview:self.picScroll];
    
    for (int i = 0; i < self.imgArray.count ; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT - 70)];
        [imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,self.imgArray[i]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
        [self.picScroll addSubview:imageView];
        
        UIButton *picBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        picBtn.frame = CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT - 70);
        [picBtn addTarget:self action:@selector(picBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.picScroll addSubview:picBtn];
    }
    
    self.picScroll.contentOffset = CGPointMake(WIDTH * (sender.tag - 123), 0);
    
}

-(void)picBtnClick
{
    [self.picScroll removeFromSuperview];
}

-(void)collectBtnClick:(UIButton *)sender
{
    session *danLi = [session getInstance];
    sender.selected = !sender.selected;
    int i = [sender.titleLabel.text intValue];
    if (sender.selected) {
        i++;
        [ZYHTTPRequest request:COLLECT_ARTICLE(danLi.token, [self.resourceDict  objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
            
        }];
        
        
    }else
    {
        i--;
        [ZYHTTPRequest request:UNCOLLECT_ARTICLE(danLi.token, [self.resourceDict objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
        }];
    }
    [sender setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
    
}

-(void)praiseBtnClick:(UIButton *)sender
{
    session *danLi = [session getInstance];
    sender.selected = !sender.selected;
    int i = [sender.titleLabel.text intValue];
    if (sender.selected) {
        i++;
        [ZYHTTPRequest request:LIKE_ARTICLE(danLi.token, [self.resourceDict objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
            
        }];
        
        
    }else
    {
        i--;
        [ZYHTTPRequest request:LIKE_ARTICLE(danLi.token, [self.resourceDict objectForKey:@"id"]) Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
        }];
    }
    [sender setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UIFont  *font = [UIFont systemFontOfSize:14];
    CGSize size = [[NSString stringWithFormat:@"%@",[self.resourceDict objectForKey:@"ct"]] sizeWithFont:font constrainedToSize:CGSizeMake(WIDTH - 70, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    self.imgArray = [[self.resourceDict objectForKey:@"imgs"] componentsSeparatedByString:@","];
    int picHeight;
    
    if (self.imgArray.count > 0) {
        picHeight = 74 * ( self.imgArray.count / 4) + 74;
    }else
    {
        picHeight = 74 * ( self.imgArray.count / 4) + 0;
    }
    return 15 + 20 + size.height + 10 + picHeight + 30;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cellID";
    
    ArticleDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[ArticleDetailCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    cell.backgroundColor = GRAYCOLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[self.commentArray[indexPath.row] objectForKey:@"user"] objectForKey:@"icon"]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
    self.targetUserIdDict = [[self.commentArray objectAtIndex:indexPath.row] objectForKey:@"targetUser"];
    cell.nickNameLB.textColor = BGCOLOR;
    if (self.targetUserIdDict) {
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@回复%@",[[self.commentArray[indexPath.row] objectForKey:@"user"] objectForKey:@"nick"],[self.targetUserIdDict objectForKey:@"nick"]]];
        NSRange range1 = [[noteStr string]rangeOfString:@"回复"];
        [noteStr addAttribute:NSForegroundColorAttributeName value:TEXTCOLOR range:range1];
        cell.nickNameLB.attributedText = noteStr;
    }else
    {
    cell.nickNameLB.text = [NSString stringWithFormat:@"%@",[[self.commentArray[indexPath.row] objectForKey:@"user"] objectForKey:@"nick"]];
    }
    NSString *timeStr = [NSString stringWithFormat:@"%@",[[[self.commentArray[indexPath.row] objectForKey:@"date"] stringByReplacingOccurrencesOfString:@"T" withString:@" "] stringByReplacingOccurrencesOfString:@"Z" withString:@""]];
    
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [df setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"] ];
    NSDate*date =[[NSDate alloc]init];
    date =[df dateFromString:timeStr];
    
    NSDateFormatter* df2 = [[NSDateFormatter alloc]init];
    [df2 setDateFormat:@"MM月dd日 HH:mm"];
    NSString* str1 = [df2 stringFromDate:date];
    cell.timeLabel.text = str1;
    
    
    cell.commentLB.text = [NSString stringWithFormat:@"%@",[self.commentArray[indexPath.row] objectForKey:@"data"]];
    UIFont  *font = [UIFont systemFontOfSize:14];
    CGSize size = [cell.commentLB.text sizeWithFont:font constrainedToSize:CGSizeMake(WIDTH - 70, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    cell.commentLB.frame = CGRectMake(60, 40, WIDTH - 70, size.height);
    cell.lineView.frame = CGRectMake(0, 40 + size.height + 9, WIDTH, 1);
    
    UILongPressGestureRecognizer *toucP = [[UILongPressGestureRecognizer alloc]init];
    [toucP addTarget:self action:@selector(longPcLICK:)];
    toucP.minimumPressDuration = 1;
    toucP.delegate = self;
    [cell.commentLB addGestureRecognizer:toucP];
    cell.commentLB.userInteractionEnabled = YES;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.message becomeFirstResponder];
    
    self.message.text = [NSString stringWithFormat:@"@%@  ",[[[self.commentArray objectAtIndex:indexPath.row] objectForKey:@"user"] objectForKey:@"nick"]];
    self.nameStr = self.message.text;
    self.targetUserId = [[self.commentArray objectAtIndex:indexPath.row] objectForKey:@"userId"] ;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFont  *font = [UIFont systemFontOfSize:14];
    CGSize size = [[NSString stringWithFormat:@"%@",[self.commentArray[indexPath.row] objectForKey:@"data"]] sizeWithFont:font constrainedToSize:CGSizeMake(WIDTH - 70, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    
    return 40 + size.height + 10;
}

- (void)moonletBtnClick{
    int temp = [_collectNumLab.text intValue];
    temp +=1;
    _collectNumLab.text = [NSString stringWithFormat:@"%d",temp];
}
- (void)reportBtnClick{
    ReportViewController *report = [[ReportViewController alloc]init];
    [self.navigationController pushViewController:report animated:YES];
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""] && range.length) {
        return YES;
    }else{
        if (textView.text.length - range.length + text.length > 300) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"超出最大可输入长度" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
            return NO;
        }else{
            return YES;
        }
    
    }

}

/**
 *  根据lable文字长度和字体大小设置labe的frame
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

- (void)longPcLICK:(UILongPressGestureRecognizer *)sender{
    [self.view endEditing:YES];
    self.fuZhiLabel = (UILabel *)sender.view;
   if (sender.state == UIGestureRecognizerStateBegan){
       [UIView animateWithDuration:0.5 animations:^{
           self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
           self.bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
           [self.view addSubview:self.bgView];
           
           UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
           tap.delegate = self;
           [self.bgView addGestureRecognizer:tap];
           
           self.PopView = [[UIView alloc]initWithFrame:CGRectMake(50, HEIGHT/2+20,WIDTH-100, HEIGHT/13*2)];
           self.PopView.backgroundColor = WHITECOLOR;
           self.PopView.layer.cornerRadius = 10;
           [self.bgView addSubview:self.PopView];
           
           NSArray *arr = @[@"复制",@"删除"];
           for (int i = 0; i < arr.count; i++) {
               UIButton *warnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
               warnBtn.frame = CGRectMake(0, i*(HEIGHT/13), WIDTH-100, HEIGHT/13);
               warnBtn.layer.cornerRadius = 1;
               warnBtn.clipsToBounds = YES;
               warnBtn.tag = i+1992;
               warnBtn.adjustsImageWhenHighlighted = NO;
               warnBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
               warnBtn.layer.borderWidth = 1;
               warnBtn.layer.masksToBounds = YES;
               [warnBtn setTitle:arr[i] forState:UIControlStateNormal];
               [warnBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
               warnBtn.titleLabel.font = [UIFont systemFontOfSize:16];
               [warnBtn addTarget:self action:@selector(warnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
               [self.PopView addSubview:warnBtn];
               
           }

       }];
    }
}

- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired== 1) {
        [UIView animateWithDuration:1.0 animations:^{
            [_bgView removeFromSuperview];
        }];
    }
}

- (void)warnBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1992:
        {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = self.fuZhiLabel.text;
            [self.bgView removeFromSuperview];
        }
            break;
        case 1993:
        {
            
        }
            break;
        default:
            break;
    }

}

//视图上移的方法
- (void) animateTextField: (UITextView *) textView up: (BOOL) up
{
    //设置视图上移的距离，单位像素
    const int movementDistance = 250; // tweak as needed
    //三目运算，判定是否需要上移视图或者不变
    int movement = (up ? -movementDistance : movementDistance);
    //设置动画的名字
    [UIView beginAnimations: @"Animation" context: nil];
    //设置动画的开始移动位置
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置动画的间隔时间
    [UIView setAnimationDuration: 0.20];
    //设置视图移动的位移
    self.inputBgView.frame = CGRectOffset(self.inputBgView.frame, 0, movement);
    //设置动画结束
    [UIView commitAnimations];
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.PLlab.hidden = YES;
    [self animateTextField: textView up: YES];

    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    self.targetUserId = @"";
    [self animateTextField: textView up: NO];
    
    return YES;
}






    //点击头像跳转
- (void)myBtnClick{
    ExpertWriteViewController *write = [[ExpertWriteViewController alloc]init];
    [self.navigationController pushViewController:write animated:YES];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    if (self.message.text.length > 0) {
        self.PLlab.hidden = YES;
    }else{
        self.PLlab.hidden =  NO;
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
