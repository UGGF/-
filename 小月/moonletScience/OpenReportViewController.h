//
//  OpenReportViewController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenReportViewController : UIViewController
{
    BOOL _flagOpenArrar[100];
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,copy)NSString *recordOpenStr;

@end
