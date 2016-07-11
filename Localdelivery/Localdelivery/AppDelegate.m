//
//  AppDelegate.m
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "AppDelegate.h"
#import"ViewController.h"
#import "GSLocalNotification.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
     ViewController*vc =[[ViewController alloc]init];
    
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = nav;

    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    if (notificationSettings.types!=UIUserNotificationTypeNone)
    {

    
    
    }
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"noti:%@",notification);
    
    
    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    {  //此时app在前台运行
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Push" object:notification];
        
//        //这里是app未运行或者在后台，
//        
//        NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
//        
//        [defauts setObject:notification.userInfo[@"noti"] forKey:@"Jpush"];
//        
//        [defauts synchronize];//同步

        
    }else if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive){
        
        
        
    }else if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground){
        
        
    }
    
    //这里设置app的图片的角标为0，红色但角标就会消失
    [application setApplicationIconBadgeNumber:0];

    
    NSDictionary *userInfo = notification.userInfo;
    
    if (userInfo[@"noti"])
    {
        // 这里真实需要处理交互的地方
        // 获取通知所带的数据
        if (self.LocalNotificationDic)
        {
            self.LocalNotificationDic = nil;
        }
        self.LocalNotificationDic = userInfo[@"noti"];
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"新的推送消息"
                                                         message:self.LocalNotificationDic[@"userKey"]
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                               otherButtonTitles:@"查看",nil];
        [alert show];

        // 图标上的数字减1
        //    application.applicationIconBadgeNumber -= 1;
        //    NSLog(@"didReceiveLocalNotification");
        
        // 更新显示的badge个数
        NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
        badge--;
        badge = badge >= 0 ? badge : 0;
        [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
    }
    
    // 在不需要再推送时，可以取消推送
    [GSLocalNotification cancelLocalNotificationWithKey:@"userKey"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    self.badge = 0;
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
