//
//  FixRemarkViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FixRemarkViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic , strong)UILabel *placeHold;
@property (nonatomic , strong)UILabel *groupNmae;
@property (nonatomic , strong)NSString *groupNmaeStr;
@property (nonatomic , strong)UITextView *decText;
@property (nonatomic , strong)UIView *bgView;
@property (nonatomic , strong)UIView *chooseBG;
@property (nonatomic , strong)NSArray *groupNameArray;
@property (nonatomic , strong)NSString *groupId;
@property (nonatomic , strong)NSString *relationId;
@property (nonatomic , strong)UITextField *remarkText;
@property (nonatomic , strong)UITextField *phoneText;
@property (nonatomic , strong)UITextField *relationShipTF;

@end
