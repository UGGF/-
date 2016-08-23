//
//  headerImage.h
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headerImage : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate>

@property (nonatomic , strong)UIButton *manBtn;
@property (nonatomic , strong)UIButton *womenBtn;
@property (nonatomic , strong)UIImageView *headerImage;
@property (nonatomic , strong)UIImagePickerController *pickerImage;

@end
