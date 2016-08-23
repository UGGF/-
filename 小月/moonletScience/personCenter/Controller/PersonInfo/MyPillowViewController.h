//
//  MyPillowViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/29.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPillowViewController : UIViewController
@property(nonatomic,strong)UILabel *deviceLabel;
@property(nonatomic,strong)NSString *infoStr;
@property(nonatomic,strong)NSString *nameStr;
@property (nonatomic , strong)UILabel *desLab;
@property (nonatomic , strong)NSArray *resouceArray;
//@property (nonatomic , strong)
@property (nonatomic , strong)NSArray *muMangerArray;
@property (nonatomic , strong)UIScrollView *bgScrollView;
@property (nonatomic , strong)UIView *bgView;
@property (nonatomic , strong)UIImageView *headerImage;
@property (nonatomic , strong)UILabel *nickName;
@end
