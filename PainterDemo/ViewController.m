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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
