//
//  addFameilyList.h
//  moonletScience
//
//  Created by 苏 on 16/8/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addFameilyList : UIViewController<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong)UITableView *FamilyTB;
@property (nonatomic , strong)NSArray *resourceArray;

@end
