//
//  PainterDrawingManager.m
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/24.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import "PainterDrawingManager.h"
#import "PainterDrawing.h"

@implementation PainterDrawingManager
{
    UIView *_hostView;
}

-(instancetype)initWithHostView:(UIView *)hostView{
    self = [super init];
    _hostView = hostView;
    _pathArray = [NSMutableArray arrayWithCapacity:0];
    _redoArray = [NSMutableArray arrayWithCapacity:0];
    _canRedo = NO;
    _canUndo = NO;
    return self;
}

/*
 ActionTypePencil = 0,
 ActionTypeCircle,
 ActionTypeRect,
 ActionTypeEraser,
 ActionTypeUndo,
 ActionTypeRedo
 */
-(PainterDrawing *)createLayerWithType:(ActionType)type startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    switch (type) {
        case ActionTypePencil:
            return [PainterDrawing initialPenWithStartPoint:startPoint];
            break;
        case ActionTypeCrayon:
            return [PainterDrawing initialCrayonWithStartPoint:startPoint];
            break;
        case ActionTypeCircle:
            return [PainterDrawing initialOvalInRectWithStartPoint:startPoint endPoint:endPoint];
            break;
        case ActionTypeRect:
            return [PainterDrawing initialRectWithStartPoint:startPoint endPoint:endPoint];
            break;
        case ActionTypeEraser:
            return [PainterDrawing initialEraserWithStartPoint:startPoint];
            break;
        default:
            return [PainterDrawing initialPenWithStartPoint:startPoint];
            break;
    }
}

-(void)undo{
    PainterDrawing *undoDrawing = self.pathArray.lastObject;
    [self.pathArray.lastObject removeFromSuperlayer];
    [self.pathArray removeLastObject];
    if (undoDrawing) {
        [self.redoArray addObject:undoDrawing];
    }
    self.canUndo = self.pathArray.count;
    self.canRedo = self.redoArray.count;
}

-(void)redo{
    PainterDrawing *redoDrawing = self.redoArray.lastObject;
    if (redoDrawing) {
        [self.pathArray addObject:redoDrawing];
        [_hostView.layer addSublayer:redoDrawing];
        [self.redoArray removeLastObject];
    }
    self.canUndo = self.pathArray.count;
    self.canRedo = self.redoArray.count;
}

-(void)touchBegan:(CGPoint)toucheP{
    PainterDrawing *painterLayer = [self createLayerWithType:_currentType startPoint:_startPoint endPoint:_startPoint];
    [_hostView.layer addSublayer:painterLayer];
    [self.pathArray addObject:painterLayer];
    self.canUndo = self.pathArray.count;
}

-(void)touchMove:(CGPoint)toucheP{
    if (_currentType != ActionTypePencil && _currentType != ActionTypeEraser && _currentType != ActionTypeCrayon) {
        [self undo];
        PainterDrawing *painterLayer = [self createLayerWithType:_currentType startPoint:_startPoint endPoint:toucheP];
        [_hostView.layer addSublayer:painterLayer];
        [self.pathArray addObject:painterLayer];
        self.canUndo = self.pathArray.count;
    }else{
        PainterDrawing *lastLayer = [self.pathArray lastObject];
        [lastLayer.bezierPath addLineToPoint:toucheP];
        lastLayer.path = lastLayer.bezierPath.CGPath;
    }
}

-(void)touchEnd:(CGPoint)toucheP{
    _startPoint = CGPointZero;
    _endPoint = CGPointZero;
}
@end
