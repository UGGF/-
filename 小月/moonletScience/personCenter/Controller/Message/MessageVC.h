//
//  MessageVC.h
//  moonletScience
//
//  Created by 苏 on 16/4/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSString *seletedStr;
@property (nonatomic , strong)UIView *blueView;
@property (nonatomic , strong)UIScrollView *bgScrollerView;
@property (nonatomic , strong)UITableView *myMessageForTB;
@property (nonatomic , strong)NSMutableArray *resouceArray;
@end
