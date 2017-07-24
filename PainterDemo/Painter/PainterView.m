//
//  PainterView.m
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import "PainterView.h"
#import "PainterDrawing.h"

@interface PainterView()

@property (nonatomic, strong) PainterDrawing * slayer;

@property (nonatomic, strong) NSMutableArray *redoStates;
@property (nonatomic, strong) NSMutableArray *undoStates;

@property (nonatomic, assign) ActionType currentType;


@end


@implementation PainterView

-(void)awakeFromNib{
    [super awakeFromNib];
    _drawingManager = [[PainterDrawingManager alloc]initWithHostView:self];
    self.clipsToBounds = YES;
}


#pragma mark - Public

-(void)redo{
    [_drawingManager redo];
}

-(void)undo{
    [_drawingManager undo];
}


#pragma mark - Draw 
CGPoint startP;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    startP = [self pointWithTouches:touches];
    _drawingManager.startPoint = startP;
    _drawingManager.currentType = _currentType;
    
    if ([event allTouches].count == 1) {
        [_drawingManager touchBegan:[self pointWithTouches:touches]];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取移动点
    
    if ([event allTouches].count > 1){
        
        [self.superview touchesMoved:touches withEvent:event];
        
    }else if ([event allTouches].count == 1) {
        [_drawingManager touchMove:[self pointWithTouches:touches]];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_drawingManager touchEnd:[self pointWithTouches:touches]];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_drawingManager touchEnd:[self pointWithTouches:touches]];
}

// 根据touches集合获取对应的触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

#pragma mark - mode changed
-(void)selectedActionType:(ActionType)type{
    if (type==ActionTypeUndo || type==ActionTypeRedo) {
    }else{
        _currentType = type;
    }
    switch (type) {
        case ActionTypeUndo:
            [self undo];
            break;
        case ActionTypeRedo:
            [self redo];
            break;
        default:
            break;
    }
}

@end
