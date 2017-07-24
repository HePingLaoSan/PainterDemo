//
//  ViewController.m
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import "ViewController.h"

#define kLineWidth 10

#define kLineColor [UIColor blackColor]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pannelView.panneldelegate = _painterView;
    
    [_painterView.drawingManager addObserver:self forKeyPath:@"canUndo" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"canUndo"]) {
        BOOL newValue = [change[@"new"]boolValue];
        _pannelView.undoBtn.enabled = newValue;
    }
}

@end
