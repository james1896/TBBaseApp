//
//  LocalNotificationManager.h
//  Bugatti
//
//  Created by toby on 13/03/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    NotificationManagerTypeRemoteNotificationOnActive = 0,  //远程通知 在前台
    
    NotificationManagerTypeRemoteNotificationOnBackground , //远程通知 在后台
    
    NotificationManagerTypeRemoteNotificationOnExit ,       //远程通知 在关闭状态
    
    NotificationManagerTypeLocalNotification ,              //本地通知
    
}NotificationManagerType;

@interface TBNotificationManager : NSObject

@property (nonatomic) NotificationManagerType notificationType;

/**
 注册远程推送和本地推送
 */
- (void)registerRemoteNotification;

- (void)registerLocalNotificationOnFireDate:(NSInteger)alertTime;


/**
 查询当前一共有多少个localNotifications

 @return <#return value description#>
 */
- (NSArray *)allLocalNotifications;




- (void)cancelAllLocalNotifications;
/**
 保存设备token

 @param deviceToken <#deviceToken description#>
 */
- (void)saveRemoteNotificationDeviceToken:(NSData *)deviceToken;



/**
 处理推送数据
 需要区分 远程通知 还是 本地通知

 @param info <#info description#>
 */
- (void)handleNotificationUserInfo:(NSDictionary *)info;




/////////////////////////////////////////////////////////////////////////////////


+ (BOOL)insertLocalNotificationToSystemQueueWithNotificationID:(NSString *)notificationID;

+ (void)compareFiretime:(UILocalNotification *)notification needRemove:(void(^)(UILocalNotification * item))needRemove;

@end
