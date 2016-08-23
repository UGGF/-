//
//  ExpertWriteViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/5.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpertWriteViewController : UIViewController
{
    BOOL _flagArrar[100];
}

@property (nonatomic , strong ) NSDictionary *userInfoDict;
@property (nonatomic , strong ) NSMutableArray *articleArray;
@property (nonatomic , strong ) UITableView *tableView;
@property (nonatomic , strong ) NSMutableArray *are;
@property (nonatomic , strong ) NSArray *keyArray;
@property (nonatomic , strong ) NSString *userId;
@property (nonatomic , strong ) UILabel *adressLB;
@property (nonatomic , strong ) UILabel *sexLabel;
@property (nonatomic , strong ) UILabel *ageLabel;
@property (nonatomic , strong ) UILabel *sinLabel;
@property (nonatomic , strong ) UILabel *nameLabel;

@end
