//
//  huXiZouShi.m
//  moonletScience
//
//  Created by 苏 on 16/7/26.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "huXiZouShi.h"

@implementation huXiZouShi

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.linesArray = [[NSMutableArray alloc] initWithCapacity:0];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if ([self.linesArray count] == 0) {
        return;
    }
    
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    
    CGPoint start = [[self.linesArray objectAtIndex:0] CGPointValue];
    
    CGContextSetRGBStrokeColor(ctr, 0, 1, 0, 1);
    CGContextMoveToPoint(ctr, start.x, start.y);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(),2);
    //连接每一个点
    for (NSValue*value  in self.linesArray) {
        CGPoint point = [value CGPointValue];
        
        CGContextAddLineToPoint(ctr, point.x, point.y);
    }
    CGContextStrokePath(ctr);
    
    
}


@end
