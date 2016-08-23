//
//  ShopCarTableViewCell.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/20.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCarTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * imaInfoView;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *lab ;
@property(nonatomic,strong)UILabel *moonLab;
@property(nonatomic,strong)UILabel *sizeLab;
@property(nonatomic,strong)UILabel *editionLab;
@property(nonatomic,strong)UILabel *typeLab;
@property(nonatomic,strong)UILabel *colorLab;
@property(nonatomic,strong)UILabel *signLab;
@property(nonatomic,strong)UILabel *priceLab;
@property(nonatomic,strong)UILabel *numLab;
@property(nonatomic,strong)UILabel *signNumLab ;
@property(nonatomic,strong)UIButton *deleteBtn;
@end
