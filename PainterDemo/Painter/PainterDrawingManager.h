//
//  PainterDrawingManager.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/24.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PainterKit.h"

@class PainterDrawing;

@interface PainterDrawingManager : NSObject

@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, assign) CGPoint endPoint;

@property (nonatomic, assign) ActionType currentType;

@property (nonatomic, strong) NSMutableArray *pathArray;

@property (nonatomic, strong) NSMutableArray *redoArray;

@property (nonatomic, assign) BOOL canUndo;

@property (nonatomic, assign) BOOL canRedo;

-(instancetype)initWithHostView:(UIView *)hostView;

-(PainterDrawing *)getCurrentLayer;

-(void)undo;

-(void)redo;

-(void)move;

-(void)touchBegan:(CGPoint)toucheP;

-(void)touchMove:(CGPoint)toucheP;

-(void)touchEnd:(CGPoint)toucheP;

@end
