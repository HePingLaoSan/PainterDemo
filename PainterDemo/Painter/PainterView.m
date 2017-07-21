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

@property (nonatomic, strong) UIBezierPath * path;
@property (nonatomic, strong) PainterDrawing * slayer;

@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, strong) NSMutableArray *redoStates;
@property (nonatomic, strong) NSMutableArray *undoStates;

@property (nonatomic, assign) ActionType currentType;

@end


@implementation PainterView

-(void)awakeFromNib{
    [super awakeFromNib];
    _pathArray = [NSMutableArray arrayWithCapacity:0];
}


#pragma mark - Public

-(BOOL)canRedo{
    return YES;
}

-(void)redo{
    [self.pathArray.lastObject removeFromSuperlayer];

}

-(BOOL)canUndo{
    return YES;
}

-(void)undo{
    [self.pathArray.lastObject removeFromSuperlayer];
    [self.pathArray removeLastObject];
}


#pragma mark - Draw 

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint startP = [self pointWithTouches:touches];
    
    if ([event allTouches].count == 1) {
        
        PainterDrawing *painterLayer = [PainterDrawing initialWithType:_currentType startPoint:startP];
        _path = painterLayer.bezierPath;
        
        [self.layer addSublayer:painterLayer];
        _slayer = painterLayer;
        [_pathArray addObject:painterLayer];
//        [[self mutableArrayValueForKey:@"canceledLines"] removeAllObjects];
//        [[self mutableArrayValueForKey:@"lines"] addObject:_slayer];
        
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取移动点
    CGPoint moveP = [self pointWithTouches:touches];
    
    if ([event allTouches].count > 1){
        
        [self.superview touchesMoved:touches withEvent:event];
        
    }else if ([event allTouches].count == 1) {
        
        [_slayer moveToPoint:moveP];

        
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

// 根据touches集合获取对应的触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

#pragma mark - mode changed
-(void)selectedActionType:(ActionType)type{
    _currentType = type;
    switch (type) {
        case ActionTypeUndo:
            [self undo];
            break;
            
        default:
            break;
    }
}

@end
