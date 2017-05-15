//
//  TBRuquestManager.h
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TBRuquest.h"
@interface TBRuquestManager : TBRuquest




/**
 加密的测试  test请求
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)testWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;


/**
 不需要加密的参数 test 请求
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)test1WithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;


/**
 意见反馈

 @param userID <#userID description#>
 @param content <#content description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)feedbackWithUserID:(NSString *)userID
                  content:(NSString *)content
                   success:(success)success
                   failure:(failure)failure;

/**
 init接口

 @param uuid <#uuid description#>
 @param userName 可以为空
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)configInfoWithUUID:(NSString *)uuid
                  userName:(NSString *)userName
                   success:(success)success
                   failure:(failure)failure;
/**
 得到订单纪录

 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)getRecordWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

//
/**
 更新积分

 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)updatePointsWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;



/**
 更新积分

 @param token <#token description#>
 @param paras  paras = 0 刷新积分
               paras >!= 0 更新积分

 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)updatePointsWithUserToken:(NSString *)token
                            paras:(NSInteger)paras
                          success:(success)success
                          failure:(failure)failure;




/**
 登录

 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)loginWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

/**
 登录

 @param name <#name description#>
 @param pwd <#pwd description#>
 @param uuid 可以判断是否单点登录
 @param device <#device description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)loginWithName:(NSString *)name
             password:(NSString *)pwd
                 uuid:(NSString *)uuid
               device:(NSString *)device
              success:(success)success
              failure:(failure)failure;



/**
 注册

 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)registerWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;


/**
 注册

 @param name <#name description#>
 @param pwd <#pwd description#>
 @param uuid <#uuid description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)registerWithName:(NSString *)name
                password:(NSString *)pwd
                    uuid:(NSString *)uuid
                  device:(NSString *)device
                 success:(success)success
                 failure:(failure)failure;


/**
 更新用户信息

 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)updateUserInfoParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;



/**
 消费纪录

 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)consumerrRecordParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;



/**
 上传图片

 @param image <#image description#>
 @param name <#name description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)uploadImageWithImage:(UIImage *)image
                 ImageName:(NSString *)name
                   success:(success)success
                   failure:(failure)failure;

@end
