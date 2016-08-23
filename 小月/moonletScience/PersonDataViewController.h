//
//  PersonDataViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonDataViewController : UIViewController

@property (nonatomic , strong)UITextField *phoneNumTF;
@property (nonatomic , strong)UITextField *ageTF;
@property (nonatomic , strong)NSDictionary *resouceDict;
@property (nonatomic , strong)UIButton *signBtn;
@property (nonatomic , strong)UILabel *nameLable;
@property (nonatomic , strong)NSArray *keyArray;
@property (nonatomic , strong)UILabel *textLable;
@property (nonatomic , strong)UILabel *detailLabel;
@property (nonatomic , strong)NSString *identity;
@property (nonatomic , strong)UITableView *tableView;
@property (nonatomic , strong)UIButton *imaBtn;;
@property (nonatomic , strong)UIImageView *headerImage;
@property (nonatomic , strong)NSString *base64Decoded;
@property (nonatomic , strong)NSString *picName;


@end
