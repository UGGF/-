//
//  MainViewController.h
//  moonletScience
//
//  Created by 苏 on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic , strong)UIView *headerBG;
@property (nonatomic , assign)int picWhith;
@property (nonatomic , strong)NSDictionary *devidceData;
@property (nonatomic , strong)UIImageView *headerImage;
@property (nonatomic , strong)CLLocationManager *myLocation;
@property(nonatomic,strong)CLGeocoder *geocoder;
@property (nonatomic , strong ) NSArray *familyArray;
@property (nonatomic , strong ) NSString *headerPicId;
@property (nonatomic , strong ) UILabel *numLab;
@property (nonatomic , strong ) UILabel *PLLab;
@property (nonatomic , strong ) UILabel *beatLab;
@property (nonatomic , strong ) UIView *colorView;
@property (nonatomic , strong ) UILabel *warnLeftLab;
@property (nonatomic , strong ) UIImageView * imaInfoView;
@property (nonatomic , strong ) UILabel *goodLab;
@property (nonatomic , strong ) UIView *cicView;

@end
