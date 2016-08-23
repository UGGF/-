//
//  CommentPermissonViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "CommentPermissonViewController.h"
#import "CommentPermissonTableViewCell.h"
#import "ForbidGroupViewController.h"

@interface CommentPermissonViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_array;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation CommentPermissonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    _array = @[@"禁止所有人评论",@"禁止他(她)评论"];
    [self createNavBar];
    [self createTableView];
}

//** 下面状态栏修改的进阶版 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
  //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"评论权限";
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
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createTableView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = HEIGHT/14;
    [self.view addSubview:self.tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CommentPermissonTableViewCell";
    CommentPermissonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.forbidLab.text = _array[indexPath.row];
    if (indexPath.row == 0) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-60, 0, 60, HEIGHT/14-2)];
        bgView.backgroundColor = WHITECOLOR;
        [cell addSubview:bgView];
        
        UISwitch *swi = [[UISwitch alloc]initWithFrame:CGRectMake(0, 4, 0, 0)];
        [swi setOn:YES];
        [swi addTarget:self action:@selector(swiChange:) forControlEvents:UIControlEventValueChanged];
        [bgView addSubview:swi];
    }
    
    
    return cell;
}

- (void)swiChange:(UISwitch *)sender{
    BOOL isSwiOn = [sender isOn];
    if (isSwiOn) {
        NSLog(@"芝麻芝麻,开门");
    }else{
        NSLog(@"芝麻芝麻,关门");
    }
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:
        {
            ForbidGroupViewController *forbid = [[ForbidGroupViewController alloc]init];
            [self.navigationController pushViewController:forbid animated:YES];
            
        }
            break;
            
        default:
            break;
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
