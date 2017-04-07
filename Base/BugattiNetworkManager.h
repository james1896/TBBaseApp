//
//  BugattiNetworkManager.h
//  Bugatti
//
//  Created by toby on 28/02/2017.
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
//typedef void(^failed)(NSURLSessionDataTask *task, SelfNetWorkError *error);
typedef void(^failure)(NSURLSessionDataTask *task, NSError *error);


@interface BTBaseRequest : NSObject

@property (nonatomic,weak) success success;
@property (nonatomic,weak) failure failure;

@end

@interface BTLogin : BTBaseRequest

typedef void(^start)(NSString *username,NSString *password);;

@property (nonatomic,weak) start start;
@end





@interface BugattiNetworkManager : NSObject

@property (nonatomic,strong) BTLogin *login;

+ (instancetype)shareManager;

//加密的测试
+ (void)testWithParameters:(NSDictionary *)parameters succeess:(success)success failure:(failure)failure;

//不需要加密的参数
+ (void)test1WithParameters:(NSDictionary *)parameters succeess:(success)success failure:(failure)failure;

//得到订单纪录
+ (void)getRecordWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

//更新积分
+ (void)updatePointsWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;
//登录
+ (void)loginWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

//注册

+ (void)registerWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

/**
 更新用户信息
 */
+ (void)updateUserInfoParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;


//消费纪录
+ (void)consumerrRecordParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;


@end
