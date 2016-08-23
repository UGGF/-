//
//  groupManageVC.h
//  moonletScience
//
//  Created by 苏 on 16/4/8.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupManageVC : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>


@property (nonatomic , strong)UIView *bgView;
@property (nonatomic , strong)UIView *whiteBGView;
@property (nonatomic , strong)UITextField *groupTF;
@property (nonatomic , strong)NSArray *groupNameArray;
@property (nonatomic , strong)UITableView *groupTB;
@end
