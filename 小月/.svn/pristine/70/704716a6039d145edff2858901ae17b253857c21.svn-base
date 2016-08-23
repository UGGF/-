//
//  TradeViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "TradeViewController.h"
#import "TradeTableViewCell.h"

@interface TradeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    UIView *_bgView;
    UIButton *_tempBtn;
}
@end

@implementation TradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    _array = @[@"信息IT业",@"医疗卫生",@"教育文体",@"餐饮业",@"机关事业",@"金融证券保险",@"批发零售",@"农林牧副",@"房地产及建筑",@"交通仓储运输",@"水利环境及公共设施管理",@"科研、技术及地址勘察"];
    [self creatTableView];
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
    title.text = @"行业";
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
    
//    //保存按钮
//    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    saveBtn.frame = CGRectMake(WIDTH-50, 15, 40, 20);
//    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
//    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
//    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    saveBtn.clipsToBounds = YES;
//    [navBar addSubview:saveBtn];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - tableView
- (void)creatTableView{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 100)];
    _bgView.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:_bgView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT-72) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"TradeTableViewCell";
    TradeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = _array[indexPath.row];
    
//    _tempBtn = cell.GouBtn;
//    _tempBtn.tag = indexPath.row + 1;
////    _tempBtn.hidden = YES;
//    if (indexPath.row == 0) {
//        _tempBtn.selected = YES;
//        [_tempBtn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//    }
//    [_tempBtn addTarget:self action:@selector(tempBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;

}

//- (void)tempBtnClick:(UIButton *)sender{
//    sender.selected = !sender.selected;
//    switch (sender.tag) {
//        case 1:
//        {
//            UIButton *btn = [self.view viewWithTag:2];
//            btn.selected = !sender.selected;
//            UIButton *btn1 = [self.view viewWithTag:3];
//            btn1.selected = !sender.selected;
//            UIButton *btn2 = [self.view viewWithTag:4];
//            btn2.selected = !sender.selected;
//            if (sender.selected) {
//                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                [btn setImage:nil forState:UIControlStateNormal];
//                [btn1 setImage:nil forState:UIControlStateNormal];
//                [btn2 setImage:nil forState:UIControlStateNormal];
//            }else{
//                [sender setImage:nil forState:UIControlStateNormal];
//                if (btn.selected) {
//                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                    [btn1 setImage:nil forState:UIControlStateNormal];
//                    [btn2 setImage:nil forState:UIControlStateNormal];
//                }else{
//                    [btn setImage:nil forState:UIControlStateNormal];
//                    if (btn1.selected) {
//                        [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn2 setImage:nil forState:UIControlStateNormal];
//                    }else{
//                        [btn2 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn1 setImage:nil forState:UIControlStateNormal];
//                    }
//                }
//                
//                
//            }
//        }
//            break;
//        case 2:
//        {
//            UIButton *btn = [self.view viewWithTag:1];
//            btn.selected = !sender.selected;
//            UIButton *btn1 = [self.view viewWithTag:3];
//            btn1.selected = !sender.selected;
//            UIButton *btn2 = [self.view viewWithTag:4];
//            btn2.selected = !sender.selected;
//            if (sender.selected) {
//                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                [btn setImage:nil forState:UIControlStateNormal];
//                [btn1 setImage:nil forState:UIControlStateNormal];
//                [btn2 setImage:nil forState:UIControlStateNormal];
//            }else{
//                [sender setImage:nil forState:UIControlStateNormal];
//                if (btn.selected) {
//                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                    [btn1 setImage:nil forState:UIControlStateNormal];
//                    [btn2 setImage:nil forState:UIControlStateNormal];
//                }else{
//                    [btn setImage:nil forState:UIControlStateNormal];
//                    if (btn1.selected) {
//                        [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn2 setImage:nil forState:UIControlStateNormal];
//                    }else{
//                        [btn2 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn1 setImage:nil forState:UIControlStateNormal];
//                    }
//                }
//            }
//        }
//            break;
//        case 3:
//        {
//            UIButton *btn = [self.view viewWithTag:2];
//            btn.selected = !sender.selected;
//            UIButton *btn1 = [self.view viewWithTag:1];
//            btn1.selected = !sender.selected;
//            UIButton *btn2 = [self.view viewWithTag:4];
//            btn2.selected = !sender.selected;
//            if (sender.selected) {
//                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                [btn setImage:nil forState:UIControlStateNormal];
//                [btn1 setImage:nil forState:UIControlStateNormal];
//                [btn2 setImage:nil forState:UIControlStateNormal];
//            }else{
//                [sender setImage:nil forState:UIControlStateNormal];
//                if (btn.selected) {
//                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                    [btn1 setImage:nil forState:UIControlStateNormal];
//                    [btn2 setImage:nil forState:UIControlStateNormal];
//                }else{
//                    [btn setImage:nil forState:UIControlStateNormal];
//                    if (btn1.selected) {
//                        [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn2 setImage:nil forState:UIControlStateNormal];
//                    }else{
//                        [btn2 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn1 setImage:nil forState:UIControlStateNormal];
//                    }
//                }
//            }
//        }
//            break;
//        case 4:
//        {
//            UIButton *btn = [self.view viewWithTag:2];
//            btn.selected = !sender.selected;
//            UIButton *btn1 = [self.view viewWithTag:3];
//            btn1.selected = !sender.selected;
//            UIButton *btn2 = [self.view viewWithTag:1];
//            btn2.selected = !sender.selected;
//            if (sender.selected) {
//                [sender setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                [btn setImage:nil forState:UIControlStateNormal];
//                [btn1 setImage:nil forState:UIControlStateNormal];
//                [btn2 setImage:nil forState:UIControlStateNormal];
//            }else{
//                [sender setImage:nil forState:UIControlStateNormal];
//                if (btn.selected) {
//                    [btn setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                    [btn1 setImage:nil forState:UIControlStateNormal];
//                    [btn2 setImage:nil forState:UIControlStateNormal];
//                }else{
//                    [btn setImage:nil forState:UIControlStateNormal];
//                    if (btn1.selected) {
//                        [btn1 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn2 setImage:nil forState:UIControlStateNormal];
//                    }else{
//                        [btn2 setImage:[UIImage imageNamed:@"组-4.png"] forState:UIControlStateNormal];
//                        [btn1 setImage:nil forState:UIControlStateNormal];
//                    }
//                }
//                
//            }
//
//        }
//            break;
//    }
//}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

