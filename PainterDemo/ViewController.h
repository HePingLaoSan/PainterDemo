//
//  ViewController.h
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PainterView.h"
#import "PannelScrollView.h"
#import "ColorScrollView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet PainterView *painterView;

@property (weak, nonatomic) IBOutlet PannelScrollView *pannelView;

@property (weak, nonatomic) IBOutlet ColorScrollView *colorView;

@end

