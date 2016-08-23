//
//  BaseDataTableViewCell.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseDataTableViewCell : UITableViewCell

@property (nonatomic , strong)UILabel *nameLabel;
@property (nonatomic , strong)UILabel *detailLB;
@property (nonatomic , strong)UITextField *phoneTF;
@property (nonatomic , strong)UITextField *ageTF;
@property (nonatomic , strong)BBFlashCtntLabel *addressLabel;

@end
