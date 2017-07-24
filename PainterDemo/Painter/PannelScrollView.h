//
//  PannelScrollView.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PainterKit.h"

@protocol PannelScrollViewDelegate <NSObject>

-(void)selectedActionType:(ActionType)type;

@end



@interface PannelScrollView : UIScrollView



@property (weak, nonatomic) IBOutlet UIView * containerView;

@property (weak, nonatomic) IBOutlet UIButton * pencilBtn;

@property (weak, nonatomic) IBOutlet UIButton * crayonBtn;

@property (weak, nonatomic) IBOutlet UIButton * circleBtn;

@property (weak, nonatomic) IBOutlet UIButton * rectBtn;

@property (weak, nonatomic) IBOutlet UIButton * eraserBtn;

@property (weak, nonatomic) IBOutlet UIButton * undoBtn;

@property (weak, nonatomic) IBOutlet UIButton * redoBtn;

@property (nonatomic, weak) id<PannelScrollViewDelegate> panneldelegate;


@end
