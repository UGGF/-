//
//  SelectAdressViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/19.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SelectAdressViewController.h"
#import "CreateNewAdressViewController.h"
#import "EditAdressViewController.h"
#import "SelectAdressTableViewCell.h"

@interface SelectAdressViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    NSArray *_detailArr;
    NSString *str;
}

@end

@implementation SelectAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
        [self createTableView];
    [self createBgLineView];
    [self createNewAdressView];
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
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 75 , 10, 150, 30)];
    title.text = @"选择收货地址";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanHuiBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
    //完成按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-50, 15, 40, 20);
    [saveBtn setTitle:@"完成" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    saveBtn.clipsToBounds = YES;
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)saveBtnClick{
    if ([str isEqualToString:@"1"]) {
        NSLog(@"当前选择第一个地址");
        [self.navigationController popViewControllerAnimated:YES];

    }else if ([str isEqualToString:@"2"]){
        NSLog(@"当前选择第二个地址");

        [self.navigationController popViewControllerAnimated:YES];

    }
}

#pragma mark - 我是传说中的背景分割线
- (void)createBgLineView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
}

#pragma mark - tableView的创建和实现
- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT-70-50)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    _tableView.backgroundColor =SLIVERYCOLOR;
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"SelectAdressTableViewCell";
    SelectAdressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    cell.tickedBtn.tag = indexPath.row + 1;
    [cell.tickedBtn addTarget:self action:@selector(tickedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.defaultBtn.tag = indexPath.row + 10;
    [cell.defaultBtn addTarget:self action:@selector(defaultBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

//勾选圆圈的按钮点击事件
- (void)tickedBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    str = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    switch (sender.tag) {
        case 1:
        {
            
            UIButton *btn1 = [self.view viewWithTag:2];
            btn1.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setBackgroundImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                [btn1 setBackgroundImage:nil forState:UIControlStateNormal];
            }else{
                [sender setBackgroundImage:nil forState:UIControlStateNormal];
                [btn1 setBackgroundImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];

            }
        }
            break;
        case 2:
        {
            UIButton *btn1 = [self.view viewWithTag:1];
            btn1.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setBackgroundImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                [btn1 setBackgroundImage:nil forState:UIControlStateNormal];
            }else{
                [sender setBackgroundImage:nil forState:UIControlStateNormal];
                [btn1 setBackgroundImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
                
            }
        }
            break;
       
    }
    
}

//设为默认地址的按钮点击事件
- (void)defaultBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 10:
        {
            UIButton *btn1 = [self.view viewWithTag:11];
            btn1.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setTitle:@"[默认]" forState:UIControlStateNormal];
                [sender setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                [btn1 setTitle:@"[设为默认]" forState:UIControlStateNormal];
                [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            }else{
                [sender setTitle:@"[设为默认]" forState:UIControlStateNormal];
                [sender setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                [btn1 setTitle:@"[默认]" forState:UIControlStateNormal];
                [btn1 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
            }
        }
            break;
        case 11:
        {
            UIButton *btn1 = [self.view viewWithTag:10];
            btn1.selected = !sender.selected;
            if (sender.selected == NO) {
                [sender setTitle:@"[默认]" forState:UIControlStateNormal];
                [sender setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                [btn1 setTitle:@"[设为默认]" forState:UIControlStateNormal];
                [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            }else{
                [sender setTitle:@"[设为默认]" forState:UIControlStateNormal];
                [sender setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                [btn1 setTitle:@"[默认]" forState:UIControlStateNormal];
                [btn1 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
            }
        }
            break;

      
    }
   
    
}

//编辑的按钮的点击事件
- (void)editBtnClick{
    EditAdressViewController *edit = [[EditAdressViewController alloc]init];
    [self.navigationController pushViewController:edit animated:YES];
}



#pragma mark - 底部添加新地址视图
- (void)createNewAdressView{
    UIButton *newAdressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    newAdressBtn.frame = CGRectMake(0, HEIGHT-50, WIDTH, 50);
    newAdressBtn.clipsToBounds = YES;
    newAdressBtn.adjustsImageWhenHighlighted = NO;
    [newAdressBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
    [newAdressBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    newAdressBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [newAdressBtn addTarget:self action:@selector(newAdressBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newAdressBtn];

}

- (void)newAdressBtnClick{
    CreateNewAdressViewController *create = [[CreateNewAdressViewController alloc]init];
    [self.navigationController pushViewController:create animated:YES];
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
