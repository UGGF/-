//
//  MoonletShopViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "MoonletShopViewController.h"
#import "ShopDetailViewController.h"
#import "ShopCarViewController.h"
#import "MyOrderViewController.h"

@interface MoonletShopViewController ()<UIScrollViewDelegate>

@end

@implementation MoonletShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatBGView];
    
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
    title.text = @"小月商城";
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
    
    NSArray *ImagArr = @[@"gouwuche.png",@"dingdan.png"];
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
    [self.navigationController popViewControllerAnimated:YES];
}


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
            MyOrderViewController *oder = [[MyOrderViewController alloc]init];
            [self.navigationController pushViewController:oder animated:YES];
        }
            break;
       
    }
}

#pragma mark - 产品View
- (void)creatBGView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT-5-5-(WIDTH-20)/3)];
    _scrollView.pagingEnabled = YES;
//    _scrollView.contentSize = CGSizeMake(WIDTH*3, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    [_scrollView setContentSize:CGSizeMake(WIDTH*3, HEIGHT-70-5-5-(WIDTH-20)/3-5)];
    [self.view addSubview:_scrollView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    for (int i = 0; i < 3; i++) {
        _mainImageView = [[UIView alloc]initWithFrame:CGRectMake(10+WIDTH*i, 5, WIDTH-20, HEIGHT-70-5-5-(WIDTH-20)/3-5)];
        _mainImageView.backgroundColor = [UIColor grayColor];
        [_scrollView addSubview:_mainImageView];
 
        UIButton *smallBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        smallBtn.frame = CGRectMake(5+i*((WIDTH-20)/3+5),HEIGHT-5-(WIDTH-20)/3, (WIDTH-20)/3, (WIDTH-20)/3);
        smallBtn.backgroundColor = [UIColor grayColor];
        smallBtn.layer.cornerRadius = 3;
        smallBtn.clipsToBounds =YES;
        smallBtn.adjustsImageWhenHighlighted = NO;
        [smallBtn addTarget:self action:@selector(smallBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:smallBtn];
        
        UIButton *mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        mainBtn.frame = CGRectMake(0, 0, WIDTH-20, HEIGHT-70-5-5-(WIDTH-20)/3-5);
        mainBtn.backgroundColor = [UIColor clearColor];
        mainBtn.layer.cornerRadius = 3;
        mainBtn.clipsToBounds = YES;
        mainBtn.tag = i;
        mainBtn.adjustsImageWhenHighlighted = NO;
        [mainBtn addTarget:self action:@selector(mainBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mainImageView addSubview:mainBtn];
    }
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(WIDTH/2-90, HEIGHT-5-40-(WIDTH-20)/3, 200, 30)];
    _pageControl.numberOfPages = 3;
//    _pageControl.backgroundColor = REDCOLOR;
    [_pageControl addTarget:self action:@selector(changeP:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pageControl];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [_pageControl setCurrentPage:_scrollView.contentOffset.x/_scrollView.frame.size.width];
}


- (void)changeP:(id)sender{
//    UIPageControl *pag = (UIPageControl *)sender;
    int i = (int)_pageControl.currentPage;
    [self.scrollView setContentOffset:CGPointMake(WIDTH*i, 0) animated:YES];
}

- (void)smallBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        default:
            break;
    }
}


- (void)mainBtnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
        {
            ShopDetailViewController *shop = [[ShopDetailViewController alloc]init];
            [self.navigationController pushViewController:shop animated:YES];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
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
