//
//  AddForbidViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "AddForbidViewController.h"
#import "OpenReportTableViewCell.h"

@interface AddForbidViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_array;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation AddForbidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _array = @[@"驴友",@"牌友党",@"大学同学",@"非好友"];
    [self createNavBar];
    [self createSearchView];
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
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 100 , 10, 200, 30)];
    title.text = @"添加禁止评论";
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
    
    //添加按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-50, 0, 40, 50);
    [saveBtn setTitle:@"添加" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    saveBtn.clipsToBounds = YES;
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveBtnClick{
    
}

#pragma mark - 搜索框搜索信息
- (void)createSearchView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT/16+10)];
    bgView.backgroundColor = WHITECOLOR;
    [self.view addSubview:bgView];
    
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(5, 5, WIDTH-10, HEIGHT/16)];
    search.placeholder =  @"搜索朋友";
    search.backgroundColor = REDCOLOR;
    search.backgroundImage = [self imageWithColor:WHITECOLOR size:search.bounds.size];
    search.layer.borderColor = CAOGREENCOLOR.CGColor;
    search.layer.borderWidth = 2;
    search.layer.cornerRadius = 3;
    search.clipsToBounds = YES;
    [bgView addSubview:search];
    
}

/** 搜索框背景图片的封装方法 */
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect recte = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(recte.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, recte);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (void)createTableView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/16+10, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/16+10+2, WIDTH, HEIGHT-84-HEIGHT/16)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _array.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HEIGHT/14;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/14)];
    sectionView.backgroundColor = [UIColor whiteColor];
    [self.tableView addSubview:sectionView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/14-2, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [sectionView addSubview:line];
    
    UIImageView * arrow = [[UIImageView alloc]initWithFrame:CGRectMake(15, (HEIGHT/14-15)/2, 15, 15)];
    arrow.contentMode = UIViewContentModeCenter;
    [arrow setImage:[UIImage imageNamed:@"contacts_arrow.png"]];
    if (_flagArr[section]) {
        arrow.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        arrow.transform = CGAffineTransformIdentity;
    }
    [sectionView addSubview:arrow];
    
    UILabel *groupLab = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, WIDTH/2-35, HEIGHT/14)];
    groupLab.text = _array[section];
    groupLab.textColor = TEXTCOLOR;
    groupLab.font = [UIFont systemFontOfSize:16];
    groupLab.textAlignment = NSTextAlignmentLeft;
    [sectionView addSubview:groupLab];
    
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2-43, HEIGHT/14)];
    numLab.text = @"8/13";
    numLab.textColor = TEXTCOLOR;
    numLab.font = [UIFont systemFontOfSize:16];
    numLab.textAlignment = NSTextAlignmentRight;
    [sectionView addSubview:numLab];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBtn.frame = CGRectMake(WIDTH-33, (HEIGHT/14-18)/2, 18, 18);
    deleteBtn.layer.cornerRadius = 9;
    deleteBtn.clipsToBounds = YES;
    deleteBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    deleteBtn.layer.borderWidth = 1;
    deleteBtn.adjustsImageWhenHighlighted = NO;
    [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:deleteBtn];
    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(0, 0, WIDTH-35,HEIGHT/14);
    clickBtn.layer.cornerRadius = 9;
    clickBtn.tag = 180 + section;
    clickBtn.clipsToBounds = YES;
    clickBtn.adjustsImageWhenHighlighted = NO;
    [clickBtn addTarget:self action:@selector(clickBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:clickBtn];
    
    return sectionView;
}

- (void)deleteBtnClick:(UIButton *)sender{
    
}

- (void)clickBtnBtnClick:(UIButton *)sender{
    _flagArr[sender.tag-180] = !_flagArr[sender.tag-180];

    [self.tableView reloadData];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_flagArr[section]) {
        return 3;
    }else{
        return 0;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"OpenReportTableViewCell";
    OpenReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.OpenImageBtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    cell.OpenNameLab.text = @"呵呵";
    cell.OpenSignLab.text = @"阿弥陀佛";
    
    return cell;
}



#pragma mark - 点击屏幕缩回键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
