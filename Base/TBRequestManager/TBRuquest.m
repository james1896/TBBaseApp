//
//  TBRuquest.m
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRuquest.h"
#import "AFNetworking.h"

@implementation TBRuquest

+ (instancetype)manager{
    
    return [[self alloc]init];
}


+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)parameters originalParas:(NSDictionary *)orgParas success:(success)success failure:(failure)failure{
//    [self POSTWithURL:url
//           parameters:parameters
//              success:^(NSURLSessionDataTask *task,
//                        id responseObject) {
//                  NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求成功):%@",url,orgParas,responseObject);
//              }
//              failure:^(NSURLSessionDataTask *task,
//                  NSError *error) {
//    
//                  NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求失败):%@",url,parameters,error);
//              }];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager POST:url
              parameters:parameters
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task,
                           id  _Nullable responseObject) {
                     success(task,responseObject);
                     
                      NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求成功):%@",url,orgParas,responseObject);
                 }
                 failure:^(NSURLSessionDataTask * _Nullable task,
                           NSError * _Nonnull error) {
                     failure(task,error);
                     NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求失败):%@",url,parameters,error);
                 }
     ];
}


+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
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
                    
                    NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求成功):%@",url,parameters,responseObject);
                }
                failure:^(NSURLSessionDataTask * _Nullable task,
                          NSError * _Nonnull error) {
                    
                    NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求失败):%@",url,parameters,error);
                }];
}

+ (void)uploadImageWithURL:(NSString *)url
                     Image:(UIImage *)image
                 ImageName:(NSString *)name
                   success:(success)success
                   failure:(failure)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"image/png",nil];
    
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *data = UIImagePNGRepresentation(image);
        
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:data
                                    name:@"file"
                                fileName:@"diwen.png"
                                mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    
    
    //  上传文件 模板
    
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
    //
    //                                                         @"text/html",
    //
    //                                                         @"image/jpeg",
    //
    //                                                         @"image/png",
    //
    //                                                         @"application/octet-stream",
    //
    //                                                         @"text/json",
    //
    //                                                         nil];
    //
    //    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    //    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    //    [manager POST:@"http://10.66.67.81:8001/client/img" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //        UIImage *image = [UIImage imageNamed:@"diwen.png"];
    //        NSData *data = UIImagePNGRepresentation(image);
    //
    //        //上传的参数(上传图片，以文件流的格式)
    //        [formData appendPartWithFileData:data
    //                                    name:@"file"
    //                                fileName:@"diwen.png"
    //                                mimeType:@"image/png"];
    //
    //    } progress:^(NSProgress * _Nonnull uploadProgress) {
    //
    //
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        NSLog(@"上传成功");
    //
    //
    //
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        
    //        NSLog(@"上传失败%@",error);
    //        
    //        
    //        
    //    }];
}

@end
