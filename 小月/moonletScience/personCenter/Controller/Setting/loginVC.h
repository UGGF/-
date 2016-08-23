//
//  loginVC.h
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginVC : UIViewController<UITextFieldDelegate>


@property (nonatomic , strong)UITextField *phoneTF;
@property (nonatomic , strong)UITextField *passWordTF;
@property (nonatomic , strong)UIView *shareView;


@end
