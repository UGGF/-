//
//  session.m
//  Che  Bao Bao
//
//  Created by 苏 on 15/6/26.
//  Copyright (c) 2015年 Che  Bao Bao. All rights reserved.
//

#import "session.h"

@implementation session

static session *instance;

// 单例
+ (session *) getInstance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [[self alloc] init];
            
        }
    }
    return instance;
}
-(id) init
{
    if (self = [super init]) {
        self.userId = [[NSString alloc] init];
        self.headerPic = @"";
        self.token = @"";
        self.isLogoin = NO;
    }
    return self;
}

@end
