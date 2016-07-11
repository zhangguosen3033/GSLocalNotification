//
//  GSLocalNotification.h
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GSLocalNotification : NSObject
// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)StartTime badge:(NSInteger)badge;

+ (void)cancelLocalNotificationWithKey:(NSString *)key;

@end
