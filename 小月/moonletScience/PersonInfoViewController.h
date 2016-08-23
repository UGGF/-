//
//  PersonInfoViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInfoViewController : UIViewController
@property (nonatomic , strong)NSString *userID;
@property (nonatomic , strong)NSString *resource;
@property (nonatomic , strong)NSArray *valueArray;
@property (nonatomic , strong)NSArray *typeArr;
@property (nonatomic , strong)UIButton *MoreBtn;

@end
