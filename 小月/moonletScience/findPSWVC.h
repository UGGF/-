//
//  findPSWVC.h
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface findPSWVC : UIViewController<UITextFieldDelegate>

{
    int time ;
}
@property (nonatomic , strong)UITextField *phoneTF;
@property (nonatomic , strong)UITextField *identifyingTF;
@property (nonatomic , strong)NSTimer *timer;
@property (nonatomic , strong)UIView *identifingBg;
@property (nonatomic , strong)UILabel *timeLabel;

@end
