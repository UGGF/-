//
//  DeviceBindingViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/3.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceBindingViewController : UIViewController<ZBarReaderDelegate,ZBarReaderViewDelegate>

@property (nonatomic , assign)BOOL isLight;
@property (nonatomic , strong)ZBarReaderView *readview;


@end
