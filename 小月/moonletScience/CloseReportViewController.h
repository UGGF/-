//
//  CloseReportViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CloseReportViewController : UIViewController
{
    BOOL _flagCloseArrar[100];
}
@property(nonatomic,strong)UITableView *CloseTableview;
@property(nonatomic,copy)NSString *recordCloseStr;

@end
