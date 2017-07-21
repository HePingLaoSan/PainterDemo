//
//  PannelScrollView.m
//  PainterDemo
//
//  Created by zhangyingjie on 2017/7/21.
//  Copyright © 2017年 zhangyingjie. All rights reserved.
//

#import "PannelScrollView.h"

@interface PannelScrollView()

@property (nonatomic, assign)ActionType selectedType;

@end

@implementation PannelScrollView




-(IBAction)clickedPencil:(id)sender{
    _selectedType = ActionTypePencil;
    [_panneldelegate selectedActionType:_selectedType];
}
-(IBAction)clickedCircle:(id)sender{
    _selectedType = ActionTypeCircle;
    [_panneldelegate selectedActionType:_selectedType];
}

-(IBAction)clickedRect:(id)sender{
    _selectedType = ActionTypeRect;
    [_panneldelegate selectedActionType:_selectedType];
}

-(IBAction)clickedEraser:(id)sender{
    _selectedType = ActionTypeEraser;
    [_panneldelegate selectedActionType:_selectedType];
}

-(IBAction)clickedUndo:(id)sender{
    _selectedType = ActionTypeUndo;
    [_panneldelegate selectedActionType:_selectedType];
}

-(IBAction)clickedRedo:(id)sender{
    _selectedType = ActionTypeRedo;
    [_panneldelegate selectedActionType:_selectedType];
}



@end
