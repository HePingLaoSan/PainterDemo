//
//  PainterDrawing.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PainterDrawing : CAShapeLayer

@property (nonatomic, strong)UIBezierPath *bezierPath;

+(instancetype)initialWithType:(int)type startPoint:(CGPoint)startP;


-(void)moveToPoint:(CGPoint)endPoint;

@end

