//
//  FamilyCell.h
//  moonletScience
//
//  Created by 苏 on 16/8/6.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyCell : UITableViewCell

@property (nonatomic , strong)UIImageView *headerImage;
@property (nonatomic , strong)UILabel *nameLabel;
@property (nonatomic , strong)UILabel *relationLabel;
@property (nonatomic , strong)UIImageView *deleteImgView;

@end
