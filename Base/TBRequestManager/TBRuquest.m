//
//  TBRuquest.m
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRuquest.h"
#import "AFNetworking.h"
#import "TBRuquestConfig.h"


@implementation TBRuquest

+ (instancetype)shareManager{
    
    return [[self alloc]init];
}

+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure {
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager POST:url
              parameters:parameters
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task,
                           id  _Nullable responseObject) {
                     success(task,responseObject);
        
                     NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求成功):%@",url,parameters,responseObject);
                 }
                 failure:^(NSURLSessionDataTask * _Nullable task,
                           NSError * _Nonnull error) {
                    failure(task,error);
                     NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求失败):%@",url,parameters,error);
                 }
     ];
    
}

+ (void)GETWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager GET:url
             parameters:parameters
               progress:nil
                success:^(NSURLSessionDataTask * _Nonnull task,
                          id  _Nullable responseObject) {
                    success(task,responseObject);
                }
                failure:^(NSURLSessionDataTask * _Nullable task,
                          NSError * _Nonnull error) {
        
                }];
}

@end
