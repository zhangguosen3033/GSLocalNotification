//
//  NextViewController.m
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "NextViewController.h"
#import "UIButton+GSButton.h"
#import "GSLocalNotification.h"
#import "AppDelegate.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CeatUI];
}

-(void)CeatUI{
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button1.frame = CGRectMake(100, 100, 100, 50);
    
    [button1 GS_SetMyButtonWinthTitle:@"发送通知"];
    
    [button1 addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    
    
}

-(void)ButtonClick{
    
    //按钮点击  然后进行时间的处理
    //从这里决定角标的显示方法
    AppDelegate *appD = [UIApplication sharedApplication].delegate;
    
    appD.badge = 1;

    
    
    
    
    
    NSDate *now = [NSDate date];
    //取得系统时间
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    components = [calendar components:unitFlags fromDate:now];
    NSInteger hour = [components hour];
    NSInteger min = [components minute];
    NSInteger sec = [components second];
    NSInteger week = [components weekday] -1;
    NSLog(@"现在是%ld：%ld：%ld,周%ld",hour,min,sec,week);
   
 
    
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置时区（
    notification.timeZone = [NSTimeZone defaultTimeZone];
    
    if (notification) {
        notification.alertBody = @"起床了起床了";
        notification.alertAction = @"起床";
        
        notification.applicationIconBadgeNumber = 1;
        //声音设置
        notification.soundName = UILocalNotificationDefaultSoundName;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        
        //时间的选择
        if (hour > 8 && hour <= 17){
            NSDate *date = [formatter dateFromString:@"17:00:00"];
            //开始的时间
            notification.fireDate = date;
            
            appD.badge++;
            
        }else{
            NSDate *date = [formatter dateFromString:@"08:00:00"];
            //开始的时间
            notification.fireDate = date;
        }
}

    //周一到周五循环通知的周期
    if (!(week == 5 || week ==6)) {
        notification.repeatInterval = kCFCalendarUnitDay;
    }
    
    //设置userinfo
    // 通知参数
    notification.userInfo = @{@"noti":
                                  @{@"userID":@"1234",
                                    @"userKey":@"哈哈哈哈哈哈哈哈哈！"
                                    }
                              };

    //启动任务
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    //记得取消本地推送
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
