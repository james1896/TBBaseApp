////
////  LocalNotificationManager.m
////  Bugatti
////
////  Created by toby on 13/03/2017.
////  Copyright © 2017 toby. All rights reserved.
////
//
//#import "TBNotificationManager.h"
//
//#import <UserNotifications/UserNotifications.h>
//
//@interface TBNotificationManager()<UNUserNotificationCenterDelegate>
//
//@end
//
//@implementation TBNotificationManager
//
//- (void)cancelAllLocalNotifications{
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//}
//
//- (NSArray *)allLocalNotifications{
//    return [[UIApplication sharedApplication] scheduledLocalNotifications];
//}
//
//- (void)handleNotificationUserInfo:(NSDictionary *)info{
//    
//}
//
//- (void)registerRemoteNotification{
//    
//    if(IS_IOS8_LATER){
//        UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
//        
//    }else{
//        UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
//    }
//    
//}
//
//- (void)saveRemoteNotificationDeviceToken:(NSData *)deviceToken{
//    NSString *pushToken = [[[[deviceToken description]
//                             stringByReplacingOccurrencesOfString:@"<" withString:@""]
//                            stringByReplacingOccurrencesOfString:@">" withString:@""]
//                           stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"APNS <===> deviceToken:%@",pushToken);
//}
//
//- (void)registerLocalNotificationOnFireDate:(NSInteger)alertTime{
//    NSLog(@"version:%lf",[[[UIDevice currentDevice] systemVersion] floatValue]);
//    if(IOS_VERSION >= 10.0){
//        //iOS 10 使用以下方法注册，才能得到授权
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//        //监听回调事件
//        center.delegate = self;
//        
//        //iOS 10 使用以下方法注册，才能得到授权
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
//                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
//                                  // Enable or disable features based on authorization.
//                              }];
//        
//        //获取当前的通知设置，UNNotificationSettings 是只读对象，不能直接修改，只能通过以下方法获取
//        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
//            
//        }];
//        
//        [self registerNotification:alertTime];
//        
//    }if(IOS_VERSION>8.0 && IOS_VERSION <10.0){
//        //MARK:IOS 8以后，请用下面新的api
//        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings                                                                      settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge) categories:nil]];
//        
//        [[UIApplication sharedApplication]registerForRemoteNotifications];
//        [self registerLocalNotificationInOldWay:alertTime];
//    }
//    
//}
//
//- (void)registerLocalNotificationInOldWay:(NSInteger)alertTime {
//    // ios8后，需要添加这个注册，才能得到授权
//    // if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
//    // UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
//    // UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
//    // categories:nil];
//    // [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    // // 通知重复提示的单位，可以是天、周、月
//    // }
//    
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    // 设置触发通知的时间
//    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:alertTime];
//    NSLog(@"fireDate=%@",fireDate);
//    
//    notification.fireDate = fireDate;
//    // 时区
//    notification.timeZone = [NSTimeZone defaultTimeZone];
//    // 设置重复的间隔
//    notification.repeatInterval = kCFCalendarUnitSecond;
//    
//    // 通知内容
//    notification.alertBody = @"该起床了...";
//    notification.applicationIconBadgeNumber = 1;
//    // 通知被触发时播放的声音
//    notification.soundName = UILocalNotificationDefaultSoundName;
//    // 通知参数
//    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"开始学习iOS开发了" forKey:@"key"];
//    notification.userInfo = userDict;
//    
//    // ios8后，需要添加这个注册，才能得到授权
//    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
//        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
//                                                                                 categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//        // 通知重复提示的单位，可以是天、周、月
//        notification.repeatInterval = NSCalendarUnitDay;
//    } else {
//        // 通知重复提示的单位，可以是天、周、月
//        notification.repeatInterval = NSDayCalendarUnit;
//    }
//    
//    // 执行通知注册
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//}
//
////使用 IOS10 UNNotification 本地通知
//-(void)registerNotification:(NSInteger )alerTime{
//    
//    // 使用 UNUserNotificationCenter 来管理通知
//    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
//    
//    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
//    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
//    content.title = [NSString localizedUserNotificationStringForKey:@"Hello!" arguments:nil];
//    content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body"
//                                                         arguments:nil];
//    content.sound = [UNNotificationSound defaultSound];
//    
//    // 在 alertTime 后推送本地推送
//    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
//                                                  triggerWithTimeInterval:alerTime repeats:NO];
//    
//    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
//                                                                          content:content trigger:trigger];
//    
//    //添加推送成功后的处理！
//    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        //        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
//        //        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        //        [alert addAction:cancelAction];
//        //        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
//    }];
//}
//#pragma mark UNUserNotificationCenterDelegate
////本地推送
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
//    //1. 处理通知
//    
//    //2. 处理完成后条用 completionHandler ，用于指示在前台显示通知的形式
//    completionHandler(UNNotificationPresentationOptionAlert);
//}
//
//
//
//
//
//
//
//
//////////////////////////////////////////////////////////////////////////////
//
//
//
//
//#define KEY_NOTIFICATION @"this is a key for notification"
//
////iOS8以上
//+ (BOOL)insertLocalNotificationToSystemQueueWithNotificationID:(NSString *)notificationID{
//    
//    //新增前先清楚已注册的相同ID的本地推送
//    [self deleteLocadNotificationWithNotificationID:notificationID];
//    
//    //初始化
//    UILocalNotification * localNotification = [[UILocalNotification alloc] init];
//    
//    //设置开火时间(演示为当前时间15秒后)
//    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:15];
//    
//    //设置时区，取手机系统默认时区
//    localNotification.timeZone = [NSTimeZone defaultTimeZone];
//    
//    //重复次数 kCFCalendarUnitEra为不重复
//    localNotification.repeatInterval = kCFCalendarUnitEra;
//    
//    //通知的主要内容
//    localNotification.alertBody = [NSString stringWithFormat:@"人生苦短，我用Objcetive-C: %@",notificationID];
//    
//    //小提示
//    localNotification.alertAction = @"查看详情";
//    
//    //设置音效，系统默认为电子音，在系统音效中标号为1015
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
//    
//    //or localNotification.soundName = @"send.caf" 自己的音频文件
//    
//    //localNotification.applicationIconBadgeNumber = 1; Icon上的红点和数字
//    
//    //查找本地系统通知的标识
//    localNotification.userInfo = @{KEY_NOTIFICATION: notificationID};
//    
//    //提交到系统服务中，系统限制一个APP只能注册64条通知，已经提醒过的通知可以清除掉
//    /**
//     *64条是重点，必需mark一下
//     */
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    
//    return YES;
//}
//
//
//#pragma mark - 查询符合条件的本地推送
//
//+ (UILocalNotification *)queryNotificationWithNotificatioID:(NSString *)notificatioID{
//    
//    NSArray * notifications = [self queryAllSystemNotifications];
//    __block UILocalNotification * localnotification = nil;
//    
//    if (notifications.count > 0) {
//        [notifications enumerateObjectsUsingBlock:^(UILocalNotification  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            //查找符合条件的本地推送
//            if ([obj.userInfo[KEY_NOTIFICATION] isEqualToString:notificatioID]) {
//                localnotification = obj;
//                *stop = YES;
//            }
//        }];
//    }
//    return localnotification;
//}
//
//#pragma mark - 查询所有已注册的本地推送
//
//+ (NSArray *)queryAllSystemNotifications{
//    return [[UIApplication sharedApplication] scheduledLocalNotifications];
//}
//
//
//+ (void)cleanFiretimeIsPastNofications:(NSArray *)notifications{
//    
//    [notifications enumerateObjectsUsingBlock:^(UILocalNotification * notification, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        [self compareFiretime:notification needRemove:^(UILocalNotification *item) {
//            /**
//             *如果设置了重复的周期，这时候打印notificaion，会有个Next fire time字样
//             */
//            //销毁通知
//            [[UIApplication sharedApplication] cancelLocalNotification:item];
//            
//        }];
//        
//    }];
//}
//
//#pragma mark - 对比，是否过期
//
//+ (void)compareFiretime:(UILocalNotification *)notification needRemove:(void(^)(UILocalNotification * item))needRemove{
//    
//    NSComparisonResult result = [notification.fireDate compare:[NSDate date]];
//    
//    if (result == NSOrderedAscending) {
//        needRemove(notification);
//    }
//    
//}
//
//#pragma mark - 注销一条本地推送(用于更新同一个ID的推送)
//
//+ (void)deleteLocadNotificationWithNotificationID:(NSString *)notificationID{
//    
//    UILocalNotification * notification = [self queryNotificationWithNotificatioID:notificationID];
//    
//    if (notification) {
//        [[UIApplication sharedApplication] cancelLocalNotification:notification];
//    }
//    
//}
//
//@end
