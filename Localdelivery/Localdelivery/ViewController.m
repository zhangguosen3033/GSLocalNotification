//
//  ViewController.m
//  Localdelivery
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "UIButton+GSButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self CeatUI];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notification:) name:@"Push" object:nil];

}

-(void)notification:(NSNotification *)dic{
    
//    NSString *content = [dic valueForKey:@"alert"];//推送显示的内容
//    
//    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"新的推送消息"
//                                                     message:content
//                                                    delegate:self
//                                           cancelButtonTitle:@"取消"
//                                           otherButtonTitles:@"查看",nil];
//    [alert show];
    
}

//推送弹出框的协议方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //页面跳转
    if (buttonIndex == 1) {
        
 
        
    
        
    }else{
        
        
    }
    
    
}


-(void)CeatUI{
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button1.frame = CGRectMake(100, 100, 100, 50);
    
    [button1 GS_SetMyButtonWinthTitle:@"下一页"];
    
    [button1 addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    
    
}

-(void)ButtonClick{
    
    NextViewController *Next =[[NextViewController alloc]init];
    
    [self.navigationController pushViewController:Next animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
