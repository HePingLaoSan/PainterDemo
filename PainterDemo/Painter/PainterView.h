//
//  PainterView.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PannelScrollView.h"
#import "PainterDrawingManager.h"

@interface PainterView : UIView<PannelScrollViewDelegate>

@property (nonatomic, strong) PainterDrawingManager *drawingManager;

-(void)undo;

-(void)redo;


@end
