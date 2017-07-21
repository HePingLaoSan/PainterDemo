//
//  PainterDrawing.m
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import "PainterDrawing.h"

@implementation PainterDrawing
{
    CGPoint startPoint;
    int currentType;
    CGPoint lastPoint;
}

+(instancetype)initialWithType:(int)type startPoint:(CGPoint)startP{
    
    PainterDrawing * slayer = [PainterDrawing layer];
    slayer->startPoint = startP;
    slayer->lastPoint = startP;
    slayer->currentType = type;
    slayer.bezierPath = [PainterDrawing initialBezierPath:startP];
    slayer.path = slayer.bezierPath.CGPath;
    slayer.backgroundColor = [UIColor clearColor].CGColor;
    slayer.fillColor = [UIColor clearColor].CGColor;
    slayer.lineCap = kCALineCapRound;
    slayer.lineJoin = kCALineJoinRound;
    slayer.strokeColor = [UIColor blackColor].CGColor;
    slayer.lineWidth = slayer.bezierPath.lineWidth;
    return slayer;
}

+(UIBezierPath *)initialBezierPath:(CGPoint)startP{
    UIBezierPath *tempPath = [UIBezierPath bezierPath];
    tempPath.lineCapStyle = kCGLineCapRound; //线条拐角
    tempPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [tempPath moveToPoint:startP];
    return tempPath;

}


-(void)moveToPoint:(CGPoint)endPoint{
    
    switch (currentType) {
        case 0:
        {
            [self.bezierPath addLineToPoint:endPoint];
            self.path = self.bezierPath.CGPath;
        }

            break;
        case 1:
        {
            CGAffineTransform translation = CGAffineTransformMakeTranslation((endPoint.x - lastPoint.x), (endPoint.y - lastPoint.y));
            self.bezierPath.CGPath = CGPathCreateCopyByTransformingPath(self.bezierPath.CGPath, &translation);
            self.path = self.bezierPath.CGPath;
        }
            break;
            
        default:
            break;
    }
    lastPoint = endPoint;

}

@end
