//
//  SR-SelectExpertController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/7/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SR-SelectExpertController.h"
#import "SR-SelectExpertCell.h"

@interface SR_SelectExpertController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)UIImageView * imaInfoView;
@property(nonatomic,strong)UIView *BGview;
@end

@implementation SR_SelectExpertController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    self.dataArr = @[@"好友专家",@"关注专家"];
    [self createNavBar];
    [self creatContent];
    [self createTableView];
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
    navBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"选择专家";
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
    writeBtn.frame = CGRectMake(WIDTH-50, 11, 40, 30);
    //[writeBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 35, 35)];
    [writeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [writeBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    writeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    [writeBtn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:writeBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 69, WIDTH, 1)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 内容视图
- (void)creatContent{
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT/9)];
    cicView.backgroundColor = WHITECOLOR;
    [self.view addSubview:cicView];
    
    self.imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, (HEIGHT/9-20)/2, 20, 20)];
    [self.imaInfoView setImage:[UIImage imageNamed:@"contacts_arrow"]];
    self.imaInfoView.layer.cornerRadius = 3;
    self.imaInfoView.clipsToBounds = YES;
    self.imaInfoView.contentMode = UIViewContentModeCenter;
    [cicView addSubview:self.imaInfoView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(45, 0, WIDTH/2, HEIGHT/9)];
    lab.text = @"专家团";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];
    
    UIButton *seleExpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seleExpBtn.frame = CGRectMake(WIDTH-40, (HEIGHT/9-20)/2, 20, 20);
    seleExpBtn.layer.cornerRadius = 10;
    seleExpBtn.layer.borderColor = LINECOLOR.CGColor;
    seleExpBtn.layer.borderWidth = 1.0;
    seleExpBtn.adjustsImageWhenHighlighted = NO;
    [seleExpBtn addTarget:self action:@selector(seleExpBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:seleExpBtn];
    
    UIButton *expertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    expertBtn.frame = CGRectMake(0, 0, WIDTH-40, HEIGHT/9);
    expertBtn.backgroundColor = [UIColor clearColor];
    expertBtn.adjustsImageWhenHighlighted = NO;
    expertBtn.selected = NO;
    [expertBtn addTarget:self action:@selector(expertBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:expertBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/9, WIDTH, 1)];
    line.backgroundColor = LINECOLOR;
    [cicView addSubview:line];

}

- (void)expertBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.imaInfoView.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.tableView.hidden = NO;
    }else{
        self.imaInfoView.transform =  CGAffineTransformIdentity;
        self.tableView.hidden = YES;
    }
}

- (void)seleExpBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        
    }else{
        [sender setImage:nil forState:UIControlStateNormal];
        
    }
}



#pragma mark - tableView的创建
- (void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70+HEIGHT/9+1, WIDTH, HEIGHT - HEIGHT/9 - 71)] ;
    self.tableView.backgroundColor = WHITECOLOR;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.tableView.hidden = YES;
}

/**
 *  tableView相关代理
 */

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HEIGHT/7/2;
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/7)];
    cicView.backgroundColor = WHITECOLOR;
    [self.tableView addSubview:cicView];
    
    UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(30, (HEIGHT/7/2-20)/2, 20, 20)];
    [imaInfoView setImage:[UIImage imageNamed:@"contacts_arrow"]];
    imaInfoView.layer.cornerRadius = 3;
    imaInfoView.clipsToBounds = YES;
    imaInfoView.contentMode = UIViewContentModeCenter;
    if (_flagArr[section]) {
        imaInfoView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        imaInfoView.transform = CGAffineTransformIdentity;
    }
    [cicView addSubview:imaInfoView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(55, 0, WIDTH/2, HEIGHT/7/2)];
    lab.text = self.dataArr[section];
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentLeft;
    [cicView addSubview:lab];
    
    UIButton *seleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seleBtn.frame = CGRectMake(WIDTH-40, (HEIGHT/7/2-20)/2, 20, 20);
    seleBtn.layer.cornerRadius = 10;
    seleBtn.layer.borderColor = LINECOLOR.CGColor;
    seleBtn.layer.borderWidth = 1.0;
    seleBtn.adjustsImageWhenHighlighted = NO;
    seleBtn.adjustsImageWhenHighlighted = NO;
    [seleBtn addTarget:self action:@selector(seleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:seleBtn];
    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(0, 0, WIDTH-40, HEIGHT/7/2);
    clickBtn.backgroundColor = [UIColor clearColor];
    clickBtn.tag = 1992 + section;
    clickBtn.adjustsImageWhenHighlighted = NO;
    [clickBtn addTarget:self action:@selector(clickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cicView addSubview:clickBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(30, HEIGHT/7/2-1, WIDTH-20, 1)];
    line.backgroundColor = LINECOLOR;
    [cicView addSubview:line];
    
    return cicView;
}


- (void)seleBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];

    }else{
        [sender setImage:nil forState:UIControlStateNormal];

    }
}

- (void)clickBtnClick:(UIButton *)sender{
    _flagArr[sender.tag - 1992] = !_flagArr[sender.tag - 1992];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_flagArr[section]) {
        return 3;
    }else{
        return 0;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return HEIGHT/9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"SR_SelectExpertCell";
    SR_SelectExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[SR_SelectExpertCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
 
    cell.imageView.image = [UIImage imageNamed:@"weibo"];
    cell.textLabel.text = @"思密达";
    cell.detailTextLabel.text = @"哥哥";
    [cell.seleCellBtn addTarget:self action:@selector(seleCellBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    return cell;
}

- (void)seleCellBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        
    }else{
        [sender setImage:nil forState:UIControlStateNormal];
        
    }

}


@end
