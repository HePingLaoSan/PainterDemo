//
//  PainterDrawing.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PainterKit.h"


@interface PainterDrawing : CAShapeLayer

@property (nonatomic, strong)UIBezierPath *bezierPath;

/**
 Pen
 */
+(instancetype)initialPenWithStartPoint:(CGPoint)startP;

/**
 Crayon
 */
+(instancetype)initialCrayonWithStartPoint:(CGPoint)startP;

/**
 Rounded
 */
+(instancetype)initialOvalInRectWithStartPoint:(CGPoint)startP endPoint:(CGPoint)endP;

/**
 Rect
 */
+(instancetype)initialRectWithStartPoint:(CGPoint)startP endPoint:(CGPoint)endP;

/**
 Eraser
 */
+(instancetype)initialEraserWithStartPoint:(CGPoint)startP;


@end

