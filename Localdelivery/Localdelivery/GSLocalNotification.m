//
//  GSLocalNotification.m
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "GSLocalNotification.h"
#import "AppDelegate.h"
@implementation GSLocalNotification

//设置通知
+ (void)registerLocalNotification:(NSInteger)StartTime badge:(NSInteger)badge{
    
    AppDelegate *appD = [UIApplication sharedApplication].delegate;

    UILocalNotification *notification = [[UILocalNotification alloc]init];
    
    //通知开始的时间
    NSDate *date =[NSDate dateWithTimeIntervalSinceNow:StartTime];
    
    notification.fireDate = date;
    //时区的设置 是否根据时区改变而改变
    notification.timeZone = [NSTimeZone defaultTimeZone];
    //重复间隔
//    notification.repeatInterval = 4;
    //设置当前时间 repeatCalendar重复激发所使用的日历单位需要参考的日历，如果不设置的话，系统默认的日历将被作为参考日历
    notification.repeatCalendar = [NSCalendar currentCalendar];
    
    //内容
    notification.alertBody = @"这就是本地通知啊你都不知道";
    notification.alertAction = @"这都不知道";
  
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    
    notification.applicationIconBadgeNumber =appD.badge;
    
    // 通知参数
    notification.userInfo = @{@"noti":
                                  @{@"userID":@"1234",
                                    @"userKey":@"哈哈哈哈哈哈哈哈哈！"
                                    }
                              };
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        
        // 通知重复提示的单位，可以是天、周、月
//        notification.repeatInterval = NSCalendarUnitMinute;
        
    }
    else
    {
        // 通知重复提示的单位，可以是天、周、月
        //        notification.repeatInterval = NSCalendarUnitDay;
    }
 
    // 将通知添加到系统中
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}


//取消通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key{
    /*!
     
     有一点需要注意，如果我们的应用程序给系统发送的本地通知是周期性的，那么即使把程序删了重装，之前的本地通知在重装时依然存在（没有从系统中移除）。例如，我们在viewDidLoad方法中启动添加本地通知的方法，多跑几次，然后把程序在模拟器中删除，再重新跑，并用下列方法输出所有的本地通知：
     
     */
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications)
    {
        NSDictionary *userInfo = notification.userInfo[@"noti"];
        if (userInfo)
        {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[@"userKey"];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil)
            {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;
            }
        }
    }
}


@end
