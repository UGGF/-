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
    
    _cicView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, (HEIGHT-120)/2)];
    _cicView.clipsToBounds = YES;
    _cicView.backgroundColor = REDCOLOR;
    _cicView.alpha = 0.5;
    [_ScrollView addSubview:_cicView];
    
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, (HEIGHT-80)/2, WIDTH, HEIGHT)];
    BgView.backgroundColor = [UIColor yellowColor];
    BgView.alpha = 0.5;
    [_ScrollView addSubview:BgView];
    
    //    UIView *SecondView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-120, WIDTH, HEIGHT-120)];
    //    SecondView.backgroundColor = REDCOLOR;
    //    [_ScrollView addSubview:SecondView];
    
    
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
        navBar.backgroundColor = WHITECOLOR;


    }else if (newContentOffsetY < oldContentOffsetY){
        navBar.backgroundColor = [UIColor clearColor];

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
    _popView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-120, WIDTH, 120)];
    _popView.backgroundColor = SLIVERYCOLOR;
//    [self.view addSubview:_popView];
    
    //弹出视图的取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 80, WIDTH, 40);
    cancelBtn.backgroundColor = WHITECOLOR;
    cancelBtn.clipsToBounds = YES;
    cancelBtn.adjustsImageWhenHighlighted = NO;
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_popView addSubview:cancelBtn];
    
    //弹出视图的QQ、微信、微博按钮
    NSArray *imaArr = @[@"组-1.png",@"组-2.png",@"组-3.png"];
    for (int i = 0; i < 3; i++) {
        UIButton *contactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        contactBtn.frame = CGRectMake((WIDTH-36*3)/4+i*(36+(WIDTH-36*3)/4), 15, 50, 50);
//        contactBtn.backgroundColor = REDCOLOR;
        contactBtn.layer.cornerRadius = 25;
        contactBtn.clipsToBounds = YES;
        contactBtn.tag = i;
        [contactBtn setImage:[UIImage imageNamed:imaArr[i]] forState:UIControlStateNormal];
        contactBtn.adjustsImageWhenHighlighted = NO;
//        [contactBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
        [_popView addSubview:contactBtn];
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
            if (self.menuIsopen == NO) {
                _popView.hidden = NO;
                self.menuIsopen = YES;
            }else if (self.menuIsopen == YES){
                _popView.hidden = YES;
                self.menuIsopen = NO;
            }
            
        }
            break;
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
        line.backgroundColor = SLIVERYCOLOR;
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
