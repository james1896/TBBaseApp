//
//  TBRuquest.h
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  请求数据成功加调
 */
typedef void(^success)(NSURLSessionDataTask *task, id responseObject);

/**
 *  请求数据失败回调
 */
typedef void(^failure)(NSURLSessionDataTask *task, NSError *error);


@interface TBRuquest : NSObject

/**
 manager

 @return <#return value description#>
 */
+ (instancetype)manager;


/**
 POST

 @param url <#url description#>
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)POSTWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
            success:(success)success
            failure:(failure)failure;


/**
 GET

 @param url <#url description#>
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)GETWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
           success:(success)success
           failure:(failure)failure;
@end
