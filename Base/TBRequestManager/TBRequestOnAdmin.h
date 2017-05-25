//
//  TBRequestOnAdmin.h
//  TBBaseApp
//
//  Created by toby on 25/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRuquest.h"

@interface TBRequestOnAdmin : TBRuquest

+ (void)userCountAtSuccess:(success)success
                   failure:(failure)failure;

+ (void)allPointsWithUUID:(NSString *)uuid
                  success:(success)success
                  failure:(failure)failure;


/**
 得到用户数量

 @param date    
 1 表示 当天的用户量
 2 表示 当月的用户量
 0 表示 得到当天的用户量和当月的用户量
 
 {
 "day": 2,
 "month": 4
 }
 
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)getUsersAtDate:(NSInteger)date
               success:(success)success
               failure:(failure)failure;
@end
