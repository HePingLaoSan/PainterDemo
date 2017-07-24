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
    CGPoint lastPoint;
}

+(instancetype)initialDefaultLayer{
    PainterDrawing * slayer = [PainterDrawing layer];
    slayer.backgroundColor = [UIColor clearColor].CGColor;
    slayer.fillColor = [UIColor clearColor].CGColor;
    slayer.lineCap = kCALineCapRound;
    slayer.lineJoin = kCALineJoinRound;
    slayer.strokeColor = [UIColor blackColor].CGColor;
    return slayer;
}

/**
 init Pen CAShaperLayer
 
 @param startP startPoint
 @return PainterDrawing instance
 */
+(instancetype)initialPenWithStartPoint:(CGPoint)startP{
    
    PainterDrawing * slayer = [PainterDrawing initialDefaultLayer];
    slayer->startPoint = startP;
    slayer->lastPoint = startP;
    UIBezierPath *test = [PainterDrawing initialPenBezierPath:startP];
    slayer.bezierPath = test;
    slayer.path = test.CGPath;
    slayer.lineWidth = test.lineWidth;
    return slayer;
}

/**
 init Crayon CAShaperLayer
 
 @param startP startPoint
 @return PainterDrawing instance
 */
+(instancetype)initialCrayonWithStartPoint:(CGPoint)startP{
    
    PainterDrawing * slayer = [PainterDrawing initialDefaultLayer];
    UIImage *crayonImage = [UIImage imageNamed:@"PencilTexture"];
    slayer.strokeColor = [UIColor colorWithPatternImage:crayonImage].CGColor;
    slayer->startPoint = startP;
    slayer->lastPoint = startP;
    [slayer configWithBezierPath:[PainterDrawing initialPenBezierPath:startP]];
    return slayer;
}

/**
 init Rounded CAShaperLayer

 @param startP startPoint
 @param endP endPoint
 @return PainterDrawing instance
 */
+(instancetype)initialOvalInRectWithStartPoint:(CGPoint)startP endPoint:(CGPoint)endP{
    
    PainterDrawing * slayer = [PainterDrawing initialDefaultLayer];
    slayer->startPoint = startP;
    slayer->lastPoint = endP;
    [slayer configWithBezierPath:[PainterDrawing initialBezierPathOvalInRect:startP endPoint:endP]];
    return slayer;
}

/**
 init Rect CAShaperLayer
 
 @param startP startPoint
 @param endP endPoint
 @return PainterDrawing instance
 */
+(instancetype)initialRectWithStartPoint:(CGPoint)startP endPoint:(CGPoint)endP{
    
    PainterDrawing * slayer = [PainterDrawing initialDefaultLayer];
    slayer->startPoint = startP;
    slayer->lastPoint = endP;
    [slayer configWithBezierPath:[PainterDrawing initialBezierPathRect:startP endPoint:endP]];
    return slayer;
}

+(instancetype)initialEraserWithStartPoint:(CGPoint)startP{
    PainterDrawing * slayer = [PainterDrawing initialDefaultLayer];
    slayer->startPoint = startP;
    slayer->lastPoint = startP;
    UIBezierPath *test = [PainterDrawing initialPenBezierPath:startP];
    [slayer configWithBezierPath:test];
    slayer.strokeColor = [UIColor whiteColor].CGColor;
    return slayer;
}

#pragma mark - UIBezierPath Initial Method


+(UIBezierPath *)initialPenBezierPath:(CGPoint)startP{
    UIBezierPath *tempPath = [UIBezierPath bezierPath];
    tempPath.lineWidth = 10.0f;
    tempPath.lineCapStyle = kCGLineCapRound; //线条拐角
    tempPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [tempPath moveToPoint:startP];
    return tempPath;
}
/**
 init Rounded UIBezierPath
 
 @param startP startPoint
 @param endP endPoint
 @return UIBezierPath instance
 */
+(UIBezierPath *)initialBezierPathOvalInRect:(CGPoint)startP endPoint:(CGPoint)endP{
    CGFloat distance = MIN(endP.x - startP.x, endP.y - startP.y);
    UIBezierPath *tempPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(startP.x, startP.y, distance, distance)];
    tempPath.lineCapStyle = kCGLineCapRound; //线条拐角
    tempPath.lineJoinStyle = kCGLineCapRound; //终点处理
    return tempPath;
    
}

/**
 init Rect UIBezierPath
 
 @param startP startPoint
 @param endP endPoint
 @return UIBezierPath instance
 */
+(UIBezierPath *)initialBezierPathRect:(CGPoint)startP endPoint:(CGPoint)endP{
//    CGFloat distance = MIN(endP.x - startP.x, endP.y - startP.y);
    UIBezierPath *tempPath = [UIBezierPath bezierPathWithRect:CGRectMake(startP.x, startP.y, endP.x - startP.x, endP.y - startP.y)];
    tempPath.lineCapStyle = kCGLineCapRound; //线条拐角
    tempPath.lineJoinStyle = kCGLineCapRound; //终点处理
    return tempPath;
}


-(void)configWithBezierPath:(UIBezierPath *)bezierPath{
    self.bezierPath = bezierPath;
    self.path = bezierPath.CGPath;
    self.lineWidth = bezierPath.lineWidth;
}


@end
