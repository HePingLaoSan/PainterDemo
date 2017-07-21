//
//  PainterView.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PannelScrollView.h"


@interface PainterView : UIView<PannelScrollViewDelegate>


-(BOOL)canUndo;

-(void)undo;

-(BOOL)canRedo;

-(void)redo;


@end
