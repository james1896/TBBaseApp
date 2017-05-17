//
//  APPUtils.h
//  TBBaseApp
//
//  Created by toby on 22/04/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int secondOfHour   =    60*60;
static const int secondOfDay    = 24*60*60;

static NSString *NIKKA_USERINFO_REQUEST_TIME = @"NIKKA_USERINFO_REQUEST_TIME";


@interface APPUtils : NSObject

//获得设备型号
+ (NSString *)getDeviceModel;



/**
 当前时间距离上一次 是否是24小时之内
 
 @return bool
 */
+ (BOOL)isIntradayWithLastTime:(double)lastTime;

+ (double)getCurrentDate;


/**
 当前时间存本地
 
 @param tag key
 */
+ (void)cuurentTimeWithTag:(NSString *)tag;

@end
