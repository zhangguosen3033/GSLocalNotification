//
//  UIButton+GSButton.m
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "UIButton+GSButton.h"

@implementation UIButton (GSButton)

-(void)GS_SetMyButtonWinthTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
//    [self addTarget:self action:@selector(name) forControlEvents:UIControlEventTouchUpInside];
    
}


@end
