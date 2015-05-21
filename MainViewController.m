//
//  MainViewController.m
//  PushDemo
//
//  Created by Leery on 15/2/12.
//  Copyright (c) 2015年 Leery. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Push";
}

- (IBAction)regeditLocalPush{
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
    action.identifier = @"action";//按钮的标示
    action.title=@"Accept";//按钮的标题
    action.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
    //    action.authenticationRequired = YES;
    //    action.destructive = YES;
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
    action2.identifier = @"action2";
    action2.title=@"Reject";
    action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
    action.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
    action.destructive = YES;
    
    UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc] init];
    categorys.identifier = @"alert";//这组动作的唯一标示
    [categorys setActions:@[action,action2] forContext:(UIUserNotificationActionContextMinimal)];
    
    UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:[NSSet setWithObjects:categorys, nil, nil]];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:5];
    notification.timeZone=[NSTimeZone defaultTimeZone];
    notification.alertBody=@"这是一条本地推送";
    notification.category = @"alert";
    notification.applicationIconBadgeNumber=1; //应用的红色数字
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    //用这两个方法判断是否注册成功
//     NSLog(@"currentUserNotificationSettings = %@",[[UIApplication sharedApplication] currentUserNotificationSettings]);
//    [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
}

- (IBAction)regeditRemotePush{
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
