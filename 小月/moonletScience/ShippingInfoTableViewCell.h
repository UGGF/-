//
//  ShippingInfoTableViewCell.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/19.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShippingInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *myLable;
@property (weak, nonatomic) IBOutlet UILabel *myPhoneLable;
@property (weak, nonatomic) IBOutlet UILabel *myAdressLable;
@property (weak, nonatomic) IBOutlet UILabel *InfoNameLable;
@property (weak, nonatomic) IBOutlet UILabel *InfoAdressLable;
@property (weak, nonatomic) IBOutlet UILabel *InfoNumLable;

@end
