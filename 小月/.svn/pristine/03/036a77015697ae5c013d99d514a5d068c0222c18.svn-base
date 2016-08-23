//
//  ShopDetailViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "SelectGoodsViewController.h"
#import "CarSelectGoodViewController.h"
#import "ShopCarViewController.h"

// 弹出分享菜单需要导入的头文件
#import <ShareSDKUI/ShareSDK+SSUI.h>
// 自定义分享菜单栏需要导入的头文件
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
//#自定义分享编辑界面所需要导入的头文件
#import <ShareSDKUI/SSUIEditorViewStyle.h>


@interface ShopDetailViewController ()<UIScrollViewDelegate>
{
    UIImageView *_cicView;
    UIScrollView *_ScrollView;
    UIView *_popView;
    CGFloat contentOffsetY;
    CGFloat oldContentOffsetY;
    CGFloat newContentOffsetY;
    UIImageView *navBar;
    UILabel *zanLab;
}
@property(nonatomic,weak)UIView *MyView;
@property(nonatomic,strong)UIView *IntroView;
@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self creatShopDetailView];
    [self createNavBar];
    [self creatBottomView];
    [self creatPopView];
    [self createIntroView];
    [self createBuyUser];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - 商品详情视图
- (void)creatShopDetailView{
    _ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-50)];
    //    _ScrollView.pagingEnabled = YES;
    _ScrollView.scrollEnabled = YES;
    _ScrollView.showsHorizontalScrollIndicator = NO;
    _ScrollView.showsVerticalScrollIndicator = NO;
    _ScrollView.delegate = self;
    _ScrollView.bounces = NO;
    _ScrollView.contentSize = CGSizeMake(WIDTH, (HEIGHT-120)*3/2);
    [self.view addSubview:_ScrollView];
    
    _cicView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, (HEIGHT-80)/2)];
    _cicView.clipsToBounds = YES;
    _cicView.backgroundColor = REDCOLOR;
    _cicView.alpha = 0.5;
    [_ScrollView addSubview:_cicView];
    
    
    
    
    //    UIView *SecondView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-120, WIDTH, HEIGHT-120)];
    //    SecondView.backgroundColor = REDCOLOR;
    //    [_ScrollView addSubview:SecondView];
    
}

- (void)createIntroView{
    self.IntroView = [[UIView alloc]initWithFrame:CGRectMake(0, (HEIGHT-40)/2, WIDTH, HEIGHT)];
    self.IntroView.backgroundColor = [UIColor whiteColor];
    [_ScrollView addSubview:self.IntroView ];
    
    UILabel *PinkageLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 30)];
    PinkageLab.text = @"【 包邮 】SEELEEP 小月智能枕";
    PinkageLab.textColor = TEXTCOLOR;
    PinkageLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    PinkageLab.textAlignment = NSTextAlignmentCenter;
    [self.IntroView addSubview:PinkageLab];
    
    NSMutableAttributedString *botString = [[NSMutableAttributedString alloc]initWithString:PinkageLab.text];
    NSRange range1 = [[botString string]rangeOfString:@"【 包邮 】"];
    [botString addAttribute:NSForegroundColorAttributeName value:REDCOLOR range:range1];
    PinkageLab.attributedText = botString;
    
    UILabel *IntroLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, WIDTH, 30)];
    IntroLab.text = @"全球首款柔性多点传感智能枕";
    IntroLab.textColor = TEXTCOLOR;
    IntroLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    IntroLab.textAlignment = NSTextAlignmentCenter;
    [self.IntroView addSubview:IntroLab];
    
    UILabel *PriceLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, WIDTH, 30)];
    PriceLab.text = @"¥2980";
    PriceLab.textColor = REDCOLOR;
    PriceLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    PriceLab.textAlignment = NSTextAlignmentCenter;
    [self.IntroView addSubview:PriceLab];
    
    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(WIDTH/2-100, 110, 100, 30);
    unBindBtn.clipsToBounds = YES;
    [unBindBtn setImage:[UIImage imageNamed:@"danbaojiaoyi"] forState:UIControlStateNormal];
    unBindBtn.adjustsImageWhenHighlighted = NO;
    [unBindBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [unBindBtn setTitle:@"担保交易" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.IntroView addSubview:unBindBtn];
    
    UIButton *exchangeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    exchangeBtn.frame = CGRectMake(WIDTH/2, 110, 100, 30);
    exchangeBtn.clipsToBounds = YES;
    [exchangeBtn setImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
    exchangeBtn.adjustsImageWhenHighlighted = NO;
    [exchangeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [exchangeBtn setTitle:@"7天退换货" forState:UIControlStateNormal];
    [exchangeBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    exchangeBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.IntroView addSubview:exchangeBtn];
    
    UIButton *HBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    HBtn.frame = CGRectMake(WIDTH/2-150, 140, 300, 30);
    HBtn.clipsToBounds = YES;
    [HBtn setImage:[UIImage imageNamed:@"baoyou"] forState:UIControlStateNormal];
    HBtn.adjustsImageWhenHighlighted = NO;
    [HBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [HBtn setTitle:@"包邮,偏远地区以及港澳台海外地区除外" forState:UIControlStateNormal];
    [HBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    HBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.IntroView addSubview:HBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 190, WIDTH, 5)];
    line.backgroundColor = LINECOLOR;
    [self.IntroView addSubview:line];
}


- (void)createBuyUser{
    UILabel *IntroLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, WIDTH/2, 30)];
    IntroLab.text = @"购买用户";
    IntroLab.textColor = TEXTCOLOR;
    IntroLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    IntroLab.textAlignment = NSTextAlignmentLeft;
    [self.IntroView addSubview:IntroLab];
    
    UIButton *zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zanBtn.frame = CGRectMake(WIDTH-120, 200, 100, 30);
    zanBtn.clipsToBounds = YES;
    [zanBtn setImage:[UIImage imageNamed:@"yizan"] forState:UIControlStateNormal];
    zanBtn.adjustsImageWhenHighlighted = NO;
    [zanBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [zanBtn setTitle:@"1369人" forState:UIControlStateNormal];
    [zanBtn setTitleColor:TEXTTINTCOLOR forState:UIControlStateNormal];
    zanBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.IntroView addSubview:zanBtn];
    
    UIScrollView *imaScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 235, WIDTH, 40)];
    imaScroll.scrollEnabled = YES;
    imaScroll.showsHorizontalScrollIndicator = NO;
    imaScroll.showsVerticalScrollIndicator = NO;
    imaScroll.delegate = self;
    imaScroll.bounces = NO;
    imaScroll.contentSize = CGSizeMake(WIDTH *2, 0);
    [self.IntroView addSubview:imaScroll];
    
    for (int i = 0; i < (WIDTH-20)/50; i++) {
        UIImageView * imaInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(20+(40+10)*i, 0, 40, 40)];
        [imaInfoView setImage:[UIImage imageNamed:@"weibo"]];
        imaInfoView.layer.cornerRadius = 20;
        imaInfoView.clipsToBounds = YES;
        [imaScroll addSubview:imaInfoView];
    }
    
}


//开始拖拽视图
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    contentOffsetY = scrollView.contentOffset.y;//scrollview开始滚动时的已经偏移的Y值（没动是0  动了就是懂了以后停下来的那个位置）
}

// 滚动时调用此方法
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    newContentOffsetY = scrollView.contentOffset.y;//scrollview上下相加相减后的偏移量的值(包含手指离开屏幕后的自己滑动的值)
    [UIView beginAnimations:nil context:nil];
    
    if (newContentOffsetY > oldContentOffsetY ) {
        [UIView animateWithDuration:2.0 animations:^{
            navBar.backgroundColor = WHITECOLOR;
        }];
        
    }else if (newContentOffsetY < oldContentOffsetY){
        [UIView animateWithDuration:2.0 animations:^{
            navBar.backgroundColor = [UIColor clearColor];
        }];
        
    }
    
    [UIView commitAnimations];
}

// 完成拖拽(滚动停止时调用此方法，手指离开屏幕前)
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    oldContentOffsetY = scrollView.contentOffset.y;//在手指离开屏幕前 scrollview上下相加相减的值
}


//** 下面状态栏修改的进阶版 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
    navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"商品详情";
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
    
    NSArray *ImagArr = @[@"gouwuche.png",@"share-icon.png"];
    for (int i = 0; i < 2; i++) {
        UIButton *shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shopBtn.frame = CGRectMake(WIDTH-80+i*40, 15,20,20);
        [shopBtn setBackgroundImage:[UIImage imageNamed:ImagArr[i]] forState:UIControlStateNormal];
        shopBtn.layer.cornerRadius = 3;
        shopBtn.clipsToBounds = YES;
        shopBtn.tag = i;
        [shopBtn addTarget:self action:@selector(shopBtn:) forControlEvents:UIControlEventTouchUpInside];
        [navBar addSubview:shopBtn];
    }
    
}

- (void)fanHuiBtnClick{
    _popView.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 弹出视图
- (void)creatPopView{
    //弹出视图的背景视图
    _popView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-225, WIDTH, 225)];
    _popView.backgroundColor = SLIVERYCOLOR;
    //    [self.view addSubview:_popView];
    
    //弹出视图的取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 180, WIDTH, 50);
    cancelBtn.backgroundColor = WHITECOLOR;
    cancelBtn.clipsToBounds = YES;
    cancelBtn.adjustsImageWhenHighlighted = NO;
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_popView addSubview:cancelBtn];
    
    //弹出视图的QQ、微信、微博按钮
    NSArray *imaArr = @[@"pengyouquan",@"weixinhaoyou",@"QQhaoyou",@"QQkongjian",@"xinlangweibo",@"duanxin"];
    NSArray *nameArr = @[@"朋友圈",@"微信",@"QQ",@"QQ空间",@"微博",@"短信"];
    for (int i = 0; i < imaArr.count; i++) {
        UIButton *contactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        contactBtn.frame = CGRectMake((WIDTH-150)/4+(50+(WIDTH-150)/4)*(i % 3) , 10 + (10+50+20)*(i/3), 50, 50);
        
        //        contactBtn.backgroundColor = REDCOLOR;
        contactBtn.layer.cornerRadius = 25;
        contactBtn.clipsToBounds = YES;
        contactBtn.tag = i+11;
        [contactBtn setImage:[UIImage imageNamed:imaArr[i]] forState:UIControlStateNormal];
        contactBtn.adjustsImageWhenHighlighted = NO;
        [contactBtn addTarget:self action:@selector(shareMessage:) forControlEvents:UIControlEventTouchUpInside];
        [_popView addSubview:contactBtn];
        
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-150)/4+(50+(WIDTH-150)/4)*(i % 3), 65 + (30+50)*(i/3), 50, 20)];
        lab.text = nameArr[i];
        lab.textColor = TEXTCOLOR;
        lab.font = [UIFont systemFontOfSize:14];
        lab.textAlignment = NSTextAlignmentCenter;
        [_popView addSubview:lab];
    }
    
    self.MyView = _popView;
    _popView.hidden = YES;
    
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window addSubview:_popView];
    
}

//取消按钮点击事件
- (void)cancelBtnClick{
    _popView.hidden = YES;
    self.menuIsopen = NO;
}

//购物车和分享按钮点击事件
- (void)shopBtn:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
        {
            ShopCarViewController *shop = [[ShopCarViewController alloc]init];
            [self.navigationController pushViewController:shop animated:YES];
        }
            break;
        case 1:
        {
            _popView.hidden = NO;
            //            //1、创建分享参数
            //            NSArray* imageArray = @[@"weibo"];
            //            //            （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
            //            if (imageArray) {
            //
            //                NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            //                [shareParams SSDKSetupShareParamsByText:@""
            //                                                 images:[UIImage imageNamed:@"weibo"]
            //                                                    url:[NSURL URLWithString:@"http://www.baidu.com"]
            //                                                  title:@"哇塞"
            //                                                   type:SSDKContentTypeAuto];
            //                //自定义
            ////                // 定制新浪微博的分享内容
            ////                [shareParams SSDKSetupSinaWeiboShareParamsByText:@"定制新浪微博的分享内容" title:nil image:[UIImage imageNamed:@"传入的图片名"] url:nil latitude:0 longitude:0 objectID:nil type:SSDKContentTypeAuto];
            //                // 定制微信好友的分享内容
            ////                [shareParams SSDKSetupWeChatParamsByText:@"定制微信的分享内容" title:@"title" url:[NSURL URLWithString:@"http://mob.com"] thumbImage:nil image:[UIImage imageNamed:@"传入的图片名"] musicFileURL:nil extInfo:nil fileData:nil emoticonData:nil type:SSDKContentTypeAuto forPlatformSubType:SSDKPlatformSubTypeWechatSession];// 微信好友子平台
            //
            //
            //
            //                //2、分享（可以弹出我们的分享菜单和编辑界面）
            //                [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
            //                                         items:nil
            //                                   shareParams:shareParams
            //                           onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
            //
            //                               switch (state) {
            //                                   case SSDKResponseStateSuccess:
            //                                   {
            //                                       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
            //                                                                                           message:nil
            //                                                                                          delegate:nil
            //                                                                                 cancelButtonTitle:@"确定"
            //                                                                                 otherButtonTitles:nil];
            //                                       [alertView show];
            //                                       break;
            //                                   }
            //                                   case SSDKResponseStateFail:
            //                                   {
            //                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
            //                                                                                       message:[NSString stringWithFormat:@"%@",error]
            //                                                                                      delegate:nil
            //                                                                             cancelButtonTitle:@"OK"
            //                                                                             otherButtonTitles:nil, nil];
            //                                       [alert show];
            //                                       break;
            //                                   }
            //                                   default:
            //                                       break;
            //                               }
            //                           }
            //                 ];}
            
        }
            break;
    }
}


- (void)shareMessage:(UIButton *)sender{
    switch (sender.tag) {
        case 11:
        {
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:[UIImage imageNamed:@"pengyouquan"] //传入要分享的图片
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"帅气不过三秒"
                                               type:SSDKContentTypeAuto];
            
            //进行分享
            [ShareSDK share:SSDKPlatformSubTypeWechatTimeline //传入分享的平台类型
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....}];
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         ALERTVIEW(@"分享成功")
                     }
                  
                     default:
                         break;
                 }
                 
             }];
        }
            break;
        case 12:
        {
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:[UIImage imageNamed:@"weibo"] //传入要分享的图片
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"分享标题"
                                               type:SSDKContentTypeAuto];
            
            //进行分享
            [ShareSDK share:SSDKPlatformSubTypeWechatSession //传入分享的平台类型
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....}];
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         ALERTVIEW(@"分享成功")
                     }
                         
                     default:
                         break;
                 }
                 
             }];
        }
            break;
        case 13:
        {
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:[UIImage imageNamed:@"weibo"] //传入要分享的图片
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"分享标题"
                                               type:SSDKContentTypeAuto];
            
            //进行分享
            [ShareSDK share:SSDKPlatformTypeQQ //传入分享的平台类型
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....}];
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         ALERTVIEW(@"分享成功")
                     }
                     
                     default:
                         break;
                 }

                 
             }];
        }
            break;
        case 14:
        {
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:[UIImage imageNamed:@"weibo"] //传入要分享的图片
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"分享标题"
                                               type:SSDKContentTypeAuto];
            
            //进行分享
            [ShareSDK share:SSDKPlatformSubTypeQZone //传入分享的平台类型
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....}];
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         ALERTVIEW(@"分享成功")
                     }
                         
                     default:
                         break;
                 }
                 
             }];
        }
            break;
        case 15:
        {
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:[UIImage imageNamed:@"weibo"] //传入要分享的图片
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"好像感冒了!"
                                               type:SSDKContentTypeAuto];
            
            //进行分享
            [ShareSDK share:SSDKPlatformTypeSinaWeibo //传入分享的平台类型
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....}];
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         ALERTVIEW(@"分享成功")
                     }
                         
                     default:
                         break;
                 }
                 
             }];
        }
            break;
        case 16:
        {
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:[UIImage imageNamed:@"weibo"] //传入要分享的图片
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"好像感冒了!"
                                               type:SSDKContentTypeAuto];
            
            //进行分享
            [ShareSDK share:SSDKPlatformTypeSMS //传入分享的平台类型
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....}];
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         ALERTVIEW(@"分享成功")
                     }
                         
                     default:
                         break;
                 }
                 
             }];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - 微博代理
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class]){
        // 这个代理方法好像是在新浪微博的客户端来启用的应用，然后你的应用在提供分享信息 没有升入研究，有兴趣的可以试试
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    NSString *message = @"何龙飞好帅";
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class]){
        if (WeiboSDKResponseStatusCodeSuccess == response.statusCode) {
            // 执行分享后的回调代理，就是分享后从新浪的客户端回到自己的应用会执行
        }
        
    }else if ([response isKindOfClass:WBAuthorizeResponse.class]){
        WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *)response;
        if (WeiboSDKResponseStatusCodeSuccess == authorizeResponse.statusCode) {
            // 使用授权会调用 授权的开发情况下面
        }
    }
    if (message != nil && ![@"" isEqualToString:message]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - 底部客户服务视图
- (void)creatBottomView{
    //底部背景视图
    UIView *BotoomView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT - 50, WIDTH, 50)];
    BotoomView.backgroundColor = WHITECOLOR;
    [self.view addSubview:BotoomView];
    
    
    NSArray *imaArr = @[@"customer_sevice_icon.png",@"like_opt_icon.png"];
    for (int i = 0; i < 2; i++) {
        //客服和点赞按钮
        UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        unBindBtn.frame = CGRectMake(10+30*i+15*i, 5, 30, 30);
        unBindBtn.layer.cornerRadius = 3;
        unBindBtn.clipsToBounds = YES;
        unBindBtn.tag = i;
        unBindBtn.selected = YES;
        [unBindBtn setImage:[UIImage imageNamed:imaArr[i]] forState:UIControlStateNormal];
        unBindBtn.adjustsImageWhenHighlighted = NO;
        [unBindBtn addTarget:self action:@selector(unBindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [BotoomView addSubview:unBindBtn];
        
        //间隔线
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(45+45*i, 5, 1, 40)];
        line.backgroundColor = LINECOLOR;
        [BotoomView addSubview:line];
    }
    
    //按钮下的lable
    UILabel *cusLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, 30, 10)];
    cusLab.text = @"客服";
    cusLab.textColor = CAOGREENCOLOR;
    cusLab.font = [UIFont systemFontOfSize:10];
    cusLab.textAlignment = NSTextAlignmentCenter;
    [BotoomView addSubview:cusLab];
    
    zanLab = [[UILabel alloc]initWithFrame:CGRectMake(55, 35, 30, 10)];
    zanLab.text = @"187";
    zanLab.textColor = REDCOLOR;
    zanLab.font = [UIFont systemFontOfSize:10];
    zanLab.textAlignment = NSTextAlignmentCenter;
    [BotoomView addSubview:zanLab];
    
    //加入购物车和立即购买
    UIButton *shopCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopCartBtn.frame = CGRectMake(100, 5, (WIDTH-100-10-5)/2, 40);
    shopCartBtn.backgroundColor = CAOGREENCOLOR;
    shopCartBtn.layer.cornerRadius = 3;
    shopCartBtn.clipsToBounds = YES;
    shopCartBtn.adjustsImageWhenHighlighted = NO;
    [shopCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [shopCartBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    shopCartBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [shopCartBtn addTarget:self action:@selector(shopCartBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [BotoomView addSubview:shopCartBtn];
    
    UIButton *BuyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BuyBtn.frame = CGRectMake(100+5+(WIDTH-100-10-5)/2, 5, (WIDTH-100-10-5)/2, 40);
    BuyBtn.backgroundColor = REDCOLOR;
    BuyBtn.layer.cornerRadius = 3;
    BuyBtn.clipsToBounds = YES;
    BuyBtn.adjustsImageWhenHighlighted = NO;
    [BuyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [BuyBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    BuyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [BuyBtn addTarget:self action:@selector(buyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [BotoomView addSubview:BuyBtn];
    
    
    
}

//客服按钮点击事件
- (void)unBindBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"400-801-4004" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //点击确定后出现的事件
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 1:
        {
            sender.selected = !sender.selected;
            if (sender.selected == NO) {
                int temp = [zanLab.text intValue];
                temp += 1;
                zanLab.text = [NSString stringWithFormat:@"%d",temp];
            }else{
                int temp = [zanLab.text intValue];
                temp -= 1;
                zanLab.text = [NSString stringWithFormat:@"%d",temp];
            }
            
        }
            break;
            
    }
}

//购物车按钮的点击事件
- (void)shopCartBtnClick{
    CarSelectGoodViewController *car = [[CarSelectGoodViewController alloc]init];
    [self.navigationController pushViewController:car animated:YES];
    
}

//立即购买的按钮点击事件
- (void)buyBtnClick{
    SelectGoodsViewController *select = [[SelectGoodsViewController alloc]init];
    [self.navigationController pushViewController:select animated:YES];
}





//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = NO;
//}
//
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    if (velocity.y > 0) {
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//    }else{
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//    }
//
//}

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
