//
//  RelationShipViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/12.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "RelationShipViewController.h"

@interface RelationShipViewController ()

@property(nonatomic,strong)UIView *popView;
@property(nonatomic,strong)UIView *oldView;
@property(nonatomic,strong)UIView *peerView;
@property(nonatomic,strong)UIView *youngView;
@property(nonatomic,strong)UIView *glideView;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *SLineView;
@property(nonatomic,strong)UIView *cicView;
@property(nonatomic,strong)UIButton *relaBtn;
@property(nonatomic,strong)UIView *friView;
@property(nonatomic,strong)UIButton *friBtn;
@end

@implementation RelationShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createContentView];
    [self createBgLine];
    [self createPopView];
    [self createFriGlideView];
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
    title.text = @"添加好友";
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
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 传说中的背景分割线
- (void)createBgLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = LINECOLOR;
    [self.view addSubview:line];
    
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14-2, WIDTH, 2)];
    self.lineView.backgroundColor = LINECOLOR;
    [self.view addSubview:self.lineView];
    
    self.SLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14+HEIGHT/14-2, WIDTH, 2)];
    self.SLineView.backgroundColor = LINECOLOR;
    [self.view addSubview:self.SLineView];
}


#pragma mark - 亲属的弹出视图
- (void)createPopView{
    self.popView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14, WIDTH,60)];
    self.popView.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.popView];
    self.popView.hidden = YES;
    
    UILabel *customLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 110, 20)];
    customLab.text = @"自定义身份关系:";
    customLab.textColor = TEXTCOLOR;
    customLab.font = [UIFont systemFontOfSize:15];
    customLab.textAlignment = NSTextAlignmentLeft;
    [self.popView addSubview:customLab];

    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(135, 0, WIDTH-40-110, 20)];
    textF.placeholder = @"最多四个字";
    textF.font = [UIFont systemFontOfSize:10];
    [self.popView addSubview:textF];
    
    UIView *underLine = [[UIView alloc]initWithFrame:CGRectMake(135, 20, WIDTH-40-110, 1)];
    underLine.backgroundColor = SLIVERYCOLOR;
    [self.popView addSubview:underLine];
    
    UILabel *selectLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 95, 20)];
    selectLab.text = @"身份关系选择:";
    selectLab.textColor = TEXTCOLOR;
    selectLab.font = [UIFont systemFontOfSize:15];
    selectLab.textAlignment = NSTextAlignmentLeft;
    [self.popView addSubview:selectLab];
    
    NSArray *idenArr = @[@"长辈",@"同辈",@"晚辈"];
    for (int i = 0; i < idenArr.count; i++) {
        UIButton *idenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        idenBtn.frame = CGRectMake(120 + i*60, 40, 50, 20);
        idenBtn.layer.cornerRadius = 3;
        idenBtn.clipsToBounds = YES;
        [idenBtn setTitle:idenArr[i] forState:UIControlStateNormal];
        if (i == 0) {
            idenBtn.selected = YES;
            [idenBtn setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
        }else{
            idenBtn.selected = NO;
            [idenBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        }
        idenBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        idenBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        idenBtn.layer.borderWidth = 1;
        idenBtn.tag = 150 + i;
        [idenBtn addTarget:self action:@selector(idenBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.popView addSubview:idenBtn];
    }
    
    self.oldView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14+70, WIDTH, HEIGHT/2-80)];
    self.oldView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.oldView];
    self.oldView.hidden = YES;
    
    NSArray *shipArr = @[@"爸爸",@"妈妈",@"岳父",@"岳母",@"爷爷",@"奶奶",@"外公",@"外婆",@"叔叔",@"婶婶",@"伯父",@"伯母",@"阿姨",@"姨夫",@"姑母",@"姑父"];
    for (int i = 0; i < shipArr.count; i++) {
        UIButton *shipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shipBtn.frame = CGRectMake(20 + (i%4)*((WIDTH-20-15)/4+5), (i/4)*(30 + 20), 50, 30);
        shipBtn.layer.cornerRadius = 3;
        shipBtn.clipsToBounds = YES;
        [shipBtn setTitle:shipArr[i] forState:UIControlStateNormal];
        [shipBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        shipBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        shipBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        shipBtn.layer.borderWidth = 1;
        shipBtn.tag = 150 + i;
        [shipBtn addTarget:self action:@selector(shipBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.oldView addSubview:shipBtn];
    }
}

/** 身份关系选择按钮  */
- (void)idenBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 150:
        {
            UIButton *btn1 = [self.view viewWithTag:151];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:152];
            btn2.selected = !sender.selected;
            if (sender.selected) {
                [sender setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                [btn2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            }else{
                [sender setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                if (btn1.selected) {
                    [btn1 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                    [btn2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                }else{
                    [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                    [btn2 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                }
            }
            self.oldView.hidden = NO;
            self.peerView.hidden = YES;
            self.youngView.hidden = YES;
            self.lineView.frame = CGRectMake(0, 72+HEIGHT/14+HEIGHT/2, WIDTH, 2);
            self.friView.frame =  CGRectMake(0, 72+HEIGHT/14+HEIGHT/2+2, WIDTH, HEIGHT/14);
            self.SLineView.frame = CGRectMake(0, 72+HEIGHT/14+HEIGHT/2+HEIGHT/14, WIDTH, 2);
        }
            break;
        case 151:
        {
            UIButton *btn1 = [self.view viewWithTag:150];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:152];
            btn2.selected = !sender.selected;
            if (sender.selected) {
                [sender setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                [btn2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            }else{
                [sender setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                if (btn1.selected) {
                    [btn1 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                    [btn2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                }else{
                    [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                    [btn2 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                }
            }
            
            NSArray *peerArr = @[@"姐妹",@"兄弟",@"老婆",@"老公"];
            self.peerView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14+70, WIDTH, 40)];
            self.peerView.backgroundColor = WHITECOLOR;
            [self.view addSubview:self.peerView];
            
            for (int i = 0; i < peerArr.count; i++) {
                UIButton *peerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                peerBtn.frame = CGRectMake(20 + (i%4)*((WIDTH-20-15)/4+5), (i/4)*(30 + 20), 50, 30);
                peerBtn.layer.cornerRadius = 3;
                peerBtn.clipsToBounds = YES;
                [peerBtn setTitle:peerArr[i] forState:UIControlStateNormal];
                [peerBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                peerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                peerBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
                peerBtn.layer.borderWidth = 1;
                peerBtn.tag = 170 + i;
                [peerBtn addTarget:self action:@selector(peerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.peerView addSubview:peerBtn];
            }
            
            self.oldView.hidden = YES;
            self.youngView.hidden = YES;
            self.lineView.frame = CGRectMake(0, 72+HEIGHT/14+70+60, WIDTH, 2);
            self.friView.frame =  CGRectMake(0, 72+HEIGHT/14+130+2, WIDTH, HEIGHT/14);
            self.SLineView.frame = CGRectMake(0, 72+HEIGHT/14+130+HEIGHT/14, WIDTH, 2);
            
        }
            break;
        case 152:
        {
            UIButton *btn1 = [self.view viewWithTag:151];
            btn1.selected = !sender.selected;
            UIButton *btn2 = [self.view viewWithTag:150];
            btn2.selected = !sender.selected;
            if (sender.selected) {
                [sender setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                [btn2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            }else{
                [sender setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                if (btn1.selected) {
                    [btn1 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                    [btn2 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                }else{
                    [btn1 setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                    [btn2 setTitleColor:CAOGREENCOLOR forState:UIControlStateNormal];
                }
            }
            
            self.youngView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14+70, WIDTH, 140)];
            self.youngView.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:self.youngView];
            
            NSArray *youngArr = @[@"儿子",@"女儿",@"儿媳",@"女婿",@"孙子",@"孙女",@"外孙",@"外孙女",@"侄子",@"侄女",@"外甥",@"外甥女"];
            for (int i = 0; i < youngArr.count; i++) {
                UIButton *youngBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                youngBtn.frame = CGRectMake(20 + (i%4)*((WIDTH-20-15)/4+5), (i/4)*(30 + 20), 50, 30);
                youngBtn.layer.cornerRadius = 3;
                youngBtn.clipsToBounds = YES;
                [youngBtn setTitle:youngArr[i] forState:UIControlStateNormal];
                [youngBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
                youngBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                youngBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
                youngBtn.layer.borderWidth = 1;
                youngBtn.tag = 150 + i;
                [youngBtn addTarget:self action:@selector(youngBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.youngView addSubview:youngBtn];
            }

            self.oldView.hidden = YES;
            self.peerView.hidden = YES;
            self.lineView.frame = CGRectMake(0, 72+HEIGHT/14+70+160, WIDTH, 2);
            self.friView.frame =  CGRectMake(0, 72+HEIGHT/14+70+160+2, WIDTH, HEIGHT/14);
            self.SLineView.frame = CGRectMake(0, 72+HEIGHT/14+70+160+HEIGHT/14, WIDTH, 2);
            
        }
            break;
    }
}

/** 长辈 身份关系选择按钮  */
- (void)shipBtnClick:(UIButton *)sender{
    
}

/** 同辈 身份关系选择按钮  */
- (void)peerBtnClick:(UIButton *)sender{
    
}

/** 晚辈 身份关系选择按钮  */
- (void)youngBtnClick:(UIButton *)sender{
    
}


#pragma mark - 朋友的弹出视图
- (void)createFriGlideView{
    /** 朋友按钮弹出视图 */
    self.glideView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14+HEIGHT/14, WIDTH,110)];
    self.glideView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.glideView];
    self.glideView.hidden = YES;
    
    UILabel *customLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 110, 20)];
    customLab.text = @"自定义身份关系:";
    customLab.textColor = TEXTCOLOR;
    customLab.font = [UIFont systemFontOfSize:15];
    customLab.textAlignment = NSTextAlignmentLeft;
    [self.glideView addSubview:customLab];
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(135, 0, WIDTH-40-110, 20)];
    textF.placeholder = @"最多四个字";
    textF.font = [UIFont systemFontOfSize:10];
    [self.glideView addSubview:textF];
    
    UIView *underLine = [[UIView alloc]initWithFrame:CGRectMake(135, 20, WIDTH-40-110, 1)];
    underLine.backgroundColor = SLIVERYCOLOR;
    [self.glideView addSubview:underLine];
    
    UILabel *selectLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 95, 20)];
    selectLab.text = @"身份关系选择:";
    selectLab.textColor = TEXTCOLOR;
    selectLab.font = [UIFont systemFontOfSize:15];
    selectLab.textAlignment = NSTextAlignmentLeft;
    [self.glideView addSubview:selectLab];
    
    NSArray *friArr = @[@"知心朋友",@"纯真同学",@"死党闺蜜",@"普通朋友"];
    for (int i = 0; i < friArr.count; i++) {
        UIButton *friSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        friSelectBtn.frame = CGRectMake(20 + (i%4)*((WIDTH-30-15)/4+5), 70+(i/4)*(30 + 20), 60, 30);
        friSelectBtn.layer.cornerRadius = 3;
        friSelectBtn.clipsToBounds = YES;
        [friSelectBtn setTitle:friArr[i] forState:UIControlStateNormal];
        [friSelectBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        friSelectBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        friSelectBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        friSelectBtn.layer.borderWidth = 1;
        friSelectBtn.tag = 170 + i;
        [friSelectBtn addTarget:self action:@selector(friSelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.glideView addSubview:friSelectBtn];
    }
}

- (void)friSelectBtnClick:(UIButton *)sender{


}

#pragma mark - 创建内容视图
- (void)createContentView{
    self.cicView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT/14)];
    self.cicView.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.cicView];

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, HEIGHT/14)];
    lab.text = @"亲属";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.cicView addSubview:lab];

    self.relaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.relaBtn.frame = CGRectMake(WIDTH-40, (HEIGHT/14-20)/2, 20, 20);
    self.relaBtn.layer.cornerRadius = 10;
    self.relaBtn.adjustsImageWhenHighlighted = NO;
    self.relaBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
    self.relaBtn.layer.borderWidth = 1;
    [self.relaBtn addTarget:self action:@selector(relaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.cicView addSubview:self.relaBtn];
    
    self.friView = [[UIView alloc]initWithFrame:CGRectMake(0, 72+HEIGHT/14, WIDTH, HEIGHT/14)];
    self.friView.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.friView];
    
    UILabel *friLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, HEIGHT/14)];
    friLab.text = @"朋友";
    friLab.textColor = TEXTCOLOR;
    friLab.font = [UIFont systemFontOfSize:15];
    friLab.textAlignment = NSTextAlignmentLeft;
    [self.friView addSubview:friLab];
    
    self.friBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.friBtn.frame = CGRectMake(WIDTH-40, (HEIGHT/14-20)/2, 20, 20);
    self.friBtn.layer.cornerRadius = 10;
    self.friBtn.selected = YES;
    self.friBtn.adjustsImageWhenHighlighted = NO;
    self.friBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
    self.friBtn.layer.borderWidth = 1;
    [self.friBtn addTarget:self action:@selector(friBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.friView addSubview:self.friBtn];
}

/** 亲属按钮点击事件  */
- (void)relaBtnClick:(UIButton *)sender{
    [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    [self.friBtn setImage:nil forState:UIControlStateNormal];

    
    self.glideView.hidden = YES;
    self.oldView.hidden = NO;
    self.popView.hidden = NO;
    self.lineView.frame = CGRectMake(0, 72+HEIGHT/14+HEIGHT/2, WIDTH, 2);
    self.friView.frame =  CGRectMake(0, 72+HEIGHT/14+HEIGHT/2+2, WIDTH, HEIGHT/14);
    self.SLineView.frame = CGRectMake(0, 72+HEIGHT/14+HEIGHT/2+HEIGHT/14, WIDTH, 2);

}


/** 朋友按钮点击事件  */
- (void)friBtnClick:(UIButton *)sender{
    [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    [self.relaBtn setImage:nil forState:UIControlStateNormal];

    self.oldView.hidden = YES;
    self.popView.hidden = YES;
    self.youngView.hidden = YES;
    self.peerView.hidden = YES;
    
    self.lineView.frame = CGRectMake(0, 72+HEIGHT/14-2, WIDTH, 2);
    self.friView.frame =  CGRectMake(0, 72+HEIGHT/14, WIDTH, HEIGHT/14);

    self.glideView.hidden = NO;
    self.SLineView.frame = CGRectMake(0, 72+HEIGHT/14+HEIGHT/14+120, WIDTH, 2);

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
