//
//  BugattiNetworkManager.m
//  Bugatti
//
//  Created by toby on 28/02/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "BugattiNetworkManager.h"
#import "AFNetworking.h"
#import "NIKKARSA.h"


static NSString *BASE_URL = @"http://10.66.67.81:8001/client";

@implementation BugattiNetworkManager

+ (void)testWithParameters:(NSDictionary *)parameters succeess:(success)success failure:(failure)failure{
    
    //拼 url
    NSString *url = [NSString stringWithFormat:@"%@/test",BASE_URL];
    
    //
    [self handlePOSTWithURL:url Parameters:[self requestDictionaryWithRSADictionary:parameters] success:success failure:failure];
}

+ (void)test1WithParameters:(NSDictionary *)parameters succeess:(success)success failure:(failure)failure{
    
    //拼 url
    NSString *url = [NSString stringWithFormat:@"%@/test1",BASE_URL];
    
    //
    [self handlePOSTWithURL:url Parameters:parameters success:success failure:failure];
}


+ (void)getRecordWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/record",BASE_URL];
    
    //
    [self handlePOSTWithURL:url Parameters:[self requestDictionaryWithRSADictionary:parameters] success:success failure:failure];
    
    
}


+ (void)uploadImage:(UIImage *)image succeess:(success)success failure:(failure)failure{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"image/png",nil];
    
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    [manager POST:@"http://10.66.67.81:8001/client/img" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        UIImage *image = [UIImage imageNamed:@"diwen.png"];
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
/**
 RSA加密数据
 
 @param paras <#paras description#>
 @return <#return value description#>
 */
+ (NSDictionary *)requestDictionaryWithRSADictionary:(NSDictionary *)paras{
    
    // 字典转 json
    NSString *jsonStr = [self convertToJsonData:paras];
    
    //rsa加密
    NSString *encodeStr = [[NIKKARSA share] encryptString:jsonStr];
    
    return @{@"value":encodeStr};
}

//不加密
+ (NSDictionary *)requestDictionaryWithDictionary:(NSDictionary *)paras{
    
    // 字典转 json
    NSString *jsonStr = [self convertToJsonData:paras];
    
    //rsa加密
//    NSString *encodeStr = [[NIKKARSA share] encryptString:jsonStr];
    
    return @{@"value":jsonStr};
}

/**
 更新积分接口
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)updatePointsWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/points",BASE_URL];
    NSDictionary *paras = [self handleParameters:parameters isRSA:NO];
    [self handlePOSTWithURL:url Parameters:paras success:success failure:failure];
    //    [self handleGETWithURL:url Parameters:parameters success:success failure:failure];
}
/**
 登录
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)loginWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/login",BASE_URL];
    
    [self handlePOSTWithURL:url Parameters:[self requestDictionaryWithRSADictionary:parameters] success:success failure:failure];
}


/**
 注册
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)registerWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/register",BASE_URL];
    [self handlePOSTWithURL:url Parameters:[self requestDictionaryWithRSADictionary:parameters] success:success failure:failure];
}

/**
 更新用户信息
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)updateUserInfoParameters:(NSDictionary *)parameters success:(success)success faifailureled:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/updateuserInfo",BASE_URL];
    [self handleGETWithURL:url Parameters:parameters success:success failure:failure];
}

/**
 消费纪录
 
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)consumerrRecordParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/updateuserInfo",BASE_URL];
    [self handleGETWithURL:url Parameters:parameters success:success failure:failure];
}


//处理参数加密
/**
 <#Description#>
 
 @param url <#url description#>
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)handleGETWithURL:(NSString *)url Parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    if(!parameters) return;
    
    [self GETWithURL:url parameters:parameters success:success failure:failure];
}

/**
 <#Description#>
 
 @param url <#url description#>
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)handlePOSTWithURL:(NSString *)url Parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    if(!parameters) return;
    [self POSTWithURL:url parameters:parameters success:success failure:failure];
}


// GET POST

/**
 AFNetworking 处理 GET
 
 @param url <#url description#>
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)GETWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


+ (NSDictionary *)handleParameters:(NSDictionary *)parameters isRSA:(BOOL)isRSA{
    if(!parameters) return nil;
    
    NSMutableDictionary *paras = [[NSMutableDictionary alloc]initWithCapacity:0];
    if(isRSA){
        paras =  [NSMutableDictionary dictionaryWithDictionary:[self RsaParameters:parameters]];
    }else{
        [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [paras setObject:obj forKey:key];
        }];
    }
    return paras;
}
+ (NSDictionary *)RsaParameters:(NSDictionary *)parameters{
    //对参数RSA加密
    NSMutableDictionary *paras = [[NSMutableDictionary alloc]initWithCapacity:0];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [paras setObject:[[NIKKARSA share] encryptString:obj] forKey:key];
    }];
    return paras;
}

/**
 AFNetworking 处理 POST
 
 @param url <#url description#>
 @param parameters <#parameters description#>
 @param success <#success description#>
 @param failure <#failed description#>
 */
+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure {
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
        
        NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求成功):%@",url,parameters,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
        NSLog(@"\n输入URL:%@\n输入参数:%@\n输出参数(请求失败):%@",url,parameters,error);
    }];
    
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

+ (instancetype)shareManager{
    return [[BugattiNetworkManager alloc]init];
}

@end



