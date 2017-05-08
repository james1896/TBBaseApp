//
//  TBRuquest.h
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



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
 如果参数已经加密
 打印出来的数据是 加密 后的数据
 
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
 POST 
 如果参数已经加密
 打印出 未加密 之前的数据

 @param url <#url description#>
 @param parameters <#parameters description#>
 @param orgParas 未加密的参数dict
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)POSTWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
         originalParas:(NSDictionary *)orgParas
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


+ (void)uploadImageWithURL:(NSString *)url
                     Image:(UIImage *)image
                 ImageName:(NSString *)name
                   success:(success)success
                   failure:(failure)failure;
@end
