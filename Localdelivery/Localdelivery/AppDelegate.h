//
//  AppDelegate.h
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/*! 本地通知保存字典 */
@property (nonatomic, strong) NSDictionary      *LocalNotificationDic;

@property(assign,nonatomic)NSInteger badge;
@end

