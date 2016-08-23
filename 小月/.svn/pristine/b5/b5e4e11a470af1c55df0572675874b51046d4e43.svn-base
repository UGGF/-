//
//  sleepDrawView.m
//  moonletScience
//
//  Created by 苏 on 16/5/3.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "sleepDrawView.h"

@implementation sleepDrawView

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
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
//        //启动定时器
//        [self.timer fire];
    }
    return self;
}

//-(void)timerChange
//{
//    static int i = 75;
//    static int x = 0;
//    int num = arc4random() % 2 + 1;
//    if (num == 1) {
//        
//        int changes = arc4random() % 2 + 1;
//        if (changes == 1) {
//            i = i + 30;
//        }else
//        {
//            i = i - 30;
//        }
//        
//    }else
//    {
//        num = arc4random() % 2 + 1;
//        int change = arc4random() % 20;
//        if (num == 1) {
//            i = i + change;
//        }else
//        {
//            i = i - change;
//        }
//    }
//    if (x > WIDTH - 50 ) {
//        x = 0;
//        [self.linesArray removeAllObjects];
//    }
//    CGPoint point = CGPointMake(x, i);
//    NSValue *pointValue = [NSValue valueWithCGPoint:point];
//    [self.linesArray addObject:pointValue];
//    [self setNeedsDisplay];
//    x = x + 3;
//    
//    if (i > 125 || i < 25) {
//        i = 75;
//    }
//}

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
