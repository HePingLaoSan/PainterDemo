//
//  PannelScrollView.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ActionType) {
    ActionTypePencil = 0,
    ActionTypeCircle,
    ActionTypeRect,
    ActionTypeEraser,
    ActionTypeUndo,
    ActionTypeRedo
};


@protocol PannelScrollViewDelegate <NSObject>

-(void)selectedActionType:(ActionType)type;

@end



@interface PannelScrollView : UIScrollView



@property (weak, nonatomic) IBOutlet UIView * containerView;

@property (nonatomic, weak) id<PannelScrollViewDelegate> panneldelegate;



@end
