//
//  ManegeDeviceTableViewCell.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/3.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManegeDeviceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UILabel *useLab;
@property (weak, nonatomic) IBOutlet UILabel *manageLab;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *managerLabel;
@property (weak, nonatomic) IBOutlet UIButton *manageDeviceBtn;

@end
