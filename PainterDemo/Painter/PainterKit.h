//
//  PainterKit.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/24.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#ifndef PainterKit_h
#define PainterKit_h

typedef NS_ENUM(NSUInteger, ActionType) {
    ActionTypePencil = 0,
    ActionTypeCrayon,
    ActionTypeCircle,
    ActionTypeRect,
    ActionTypeEraser,
    ActionTypeUndo,
    ActionTypeRedo
};

#define kLineWidth 10;

#define kLineColor [UIColor blackColor]

#endif /* PainterKit_h */
