//
//  NumQuestionViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/15.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "NumQuestionViewController.h"
#import "NumQuestionTableViewCell.h"
#import "PersonDataViewController.h"

@interface NumQuestionViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    UITableView *_tableView;
    NSArray * _array;
    UIView *_bgView;
    UILabel *_questionLab;
    UITextField *_textF;
    UILabel *_lab;
}
@end

@implementation NumQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    _array = @[@"您就读的小学全名是?",@"你就读的初中全名是?",@"你就读的高中全名是",@"您父亲的全名?",@"您母亲的全名?",@"您配偶的全名?",@"您的出生地?",@"您父母称呼您什么?",@"您高中班主任的全名?",@"您最熟悉的童年好友名字?",@"您的身份证后6位?",@"您的车牌号?"];
    [self createNumQuesView];
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
    title.text = @"数字密码问答";
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

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveBtnClick{
    NSArray *controllersArray = [self.navigationController viewControllers];
    [self.navigationController popToViewController:controllersArray[controllersArray.count-3] animated:YES];
}


#pragma mark - 问题视图
- (void)createNumQuesView{
    UIView *questionView = [[UIView alloc]initWithFrame:CGRectMake(20, 70+20, WIDTH-40, 40)];
    questionView.layer.cornerRadius = 3 ;
    questionView.clipsToBounds = YES;
    questionView.backgroundColor = WHITECOLOR;
    questionView.layer.borderWidth = 2;
    questionView.layer.borderColor = SLIVERYCOLOR.CGColor;
    questionView.layer.masksToBounds =YES;
    [self.view addSubview:questionView];
    
    _questionLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, WIDTH-60, 40)];
    _questionLab.numberOfLines = 0;
    _questionLab.text = @"您就读的小学是?";
    _questionLab.textColor = TEXTCOLOR;
    _questionLab.font = [UIFont systemFontOfSize:13];
    _questionLab.textAlignment = NSTextAlignmentLeft;
    [questionView addSubview:_questionLab];
    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(WIDTH-40-10, 70+20, 20, 40);
    clickBtn.layer.cornerRadius = 30;
    clickBtn.clipsToBounds = YES;
    [clickBtn setImage:[UIImage imageNamed:@"open_up_icon.png"] forState:UIControlStateNormal];
    clickBtn.adjustsImageWhenHighlighted = NO;
    [clickBtn addTarget:self action:@selector(clickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];

    
    UIView *textFView = [[UIView alloc]initWithFrame:CGRectMake(20, 70+20+40+5, WIDTH-40, 40)];
    textFView.layer.cornerRadius = 3 ;
    textFView.clipsToBounds = YES;
    textFView.backgroundColor = WHITECOLOR;
    textFView.layer.borderWidth = 2;
    textFView.layer.borderColor = SLIVERYCOLOR.CGColor;
    textFView.layer.masksToBounds =YES;
    [self.view addSubview:textFView];

    
    _textF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, WIDTH-60, 40)];
    _textF.placeholder = @"请输入答案";
    _textF.delegate = self;
    _textF.layer.cornerRadius = 3;
    _textF.font = [UIFont systemFontOfSize:13];
    [textFView addSubview:_textF];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 70+20+40+5+5+40, WIDTH-40, 30)];
    lab.numberOfLines = 0;
    lab.text = @"当您忘记数字密码时，可以通过此处设置的问题答案重新设定数字密码。";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    //lab.textAlignment = NSTextAlignmentCenter;
    //lab.textAlignment = NSTextAlignmentRight;
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
}

#pragma mark - 弹出界面
- (void)clickBtnClick:(UIButton *)sender{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    _bgView.userInteractionEnabled = YES;
    [self.view addSubview:_bgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.numberOfTouchesRequired =1;
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    [_bgView addGestureRecognizer:tap];
    
    UIView *popView = [[UIView alloc]initWithFrame:CGRectMake(20, 80, WIDTH-40, 400)];
    popView.backgroundColor  = [UIColor whiteColor];
    [_bgView addSubview:popView];
 
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, WIDTH-40, 30)];
    _lab.numberOfLines = 0;
    _lab.text = @"问题";
    _lab.textColor = TEXTCOLOR;
    _lab.font = [UIFont systemFontOfSize:18];
    _lab.textAlignment = NSTextAlignmentCenter;
    [popView addSubview:_lab];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, WIDTH-40, 360)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [popView addSubview:_tableView];
    
    for (int i = 0; i < 12 ; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0+i*30, WIDTH-40, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [_tableView addSubview:line];
    }
   
}

- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired== 1) {
        [_bgView removeFromSuperview];
    }
}

//干嘛用的 干你用的 解决父视图与子视图冲突用的

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:_tableView]) {
        return NO;
    }
    return YES;
    
}

#pragma  mark - tableview实现方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"NumQuestionTableViewCell";
    NumQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        
    }
    cell.myLable.text = _array[indexPath.row];
    cell.myLable.textColor = BLACKTEXTCOLOR;
    cell.myLable.font = [UIFont systemFontOfSize:12];
    
  
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您就读的小学全名是?";
        }
            break;
        case 1:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您就读的初中全名是?";
        }
            break;
        case 2:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您就读的高中全名是?";
        }
            break;
        case 3:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您父母的全名是?";
        }
            break;
        case 4:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您母亲的全名是?";
        }
            break;
        case 5:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您配偶的全名是?";
        }
            break;
        case 6:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您的出生地?";
        }
            break;
        case 7:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您父母称呼您什么?";
        }
            break;
        case 8:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您高中班主任的全名是?";
        }
            break;
        case 9:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您最熟悉的童年好友名字是?";
        }
            break;
        case 10:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您的身份证后6位?";
        }
            break;
        case 11:
        {
            [_bgView removeFromSuperview];
            _questionLab.text = @"您的车牌号?";
        }
            break;
    }
    
}
//

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
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
