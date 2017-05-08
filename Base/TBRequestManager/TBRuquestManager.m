//
//  TBRuquestManager.m
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRuquestManager.h"

#import "TBRuquestConfig.h"
#import "NIKKARSA.h"
#import "NSDictionary+TBRequestManager.h"

@implementation TBRuquestManager



/**
 Handle POST

 @param url <#url description#>
 @param jsonStr <#jsonStr description#>
 @param orgParas <#orgParas description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)handlePOSTWithURL:(NSString *)url Parameters:(NSString *)jsonStr originalParas:(NSDictionary *)orgParas success:(success)success failure:(failure)failure {
    
    if(!jsonStr || !url) return;

    if(orgParas){
        [self POSTWithURL:url parameters:@{TBValue:jsonStr} originalParas:orgParas success:success failure:failure];
    }else{
        [self POSTWithURL:url parameters:@{TBValue:jsonStr} success:success failure:failure];
    }
    
}


/**
 处理参数
 RSA加密数据

 @param paras <#paras description#>
 @return json
 */
+ (NSString *)requestDictWithRSA:(NSDictionary *)paras{
    
    // 字典转 json
    NSString *jsonStr = [paras convertToJsonData];
    
    //rsa加密
    NSString *encodeStr = [NIKKARSA encryptString:jsonStr];
    
    return encodeStr;
}


/**
 处理参数
 不加密

 @param paras <#paras description#>
 @return json
 */
+ (NSString *)requestDictWithoutRSA:(NSDictionary *)paras{
    // 字典转 json
    NSString *jsonStr = [paras convertToJsonData];
//    return @{@"value":jsonStr};
    return jsonStr;
}




    /***********************  公开接口  **********************************/


+ (void)testWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/test",TB_BASE_URL];
    
    
    //RSA加密
    NSString *str = [self requestDictWithRSA:parameters];
    

    [self handlePOSTWithURL:url Parameters:str originalParas:parameters success:success failure:failure];
    
}

+ (void)test1WithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/test1",TB_BASE_URL];
    
    
    //不加密
    NSString *str = [self requestDictWithoutRSA:parameters];
    
    [self handlePOSTWithURL:url Parameters:str originalParas:parameters success:success failure:failure];
    
}
/**
 登录接口
 处理   url 和 paras

 */
+ (void)loginWithName:(NSString *)name password:(NSString *)pwd uuid:(NSString *)uuid device:(NSString *)device success:(success)success failure:(failure)failure{
    
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/login",TB_BASE_URL];
    
    //拼接参数
    NSDictionary *paras = @{@"username" :name,
                            @"password" :pwd,
                            @"uuid"     :uuid,
                            @"device"   :device};
    
    //RSA加密
    NSString *str = [self requestDictWithRSA:paras];
    
    [self handlePOSTWithURL:url Parameters:str originalParas:paras success:success failure:failure];

}


/**
 注册

 
 */
+ (void)registerWithName:(NSString *)name
                password:(NSString *)pwd
                    uuid:(NSString *)uuid
                  device:(NSString *)device
                 success:(success)success
                 failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/register",TB_BASE_URL];
    
    //拼接参数
    NSDictionary *paras = @{@"username" :name,
                            @"password" :pwd,
                            @"uuid"     :uuid,
                            @"device"   :device};
    
    //RSA加密
    NSString *str = [self requestDictWithRSA:paras];
    
    [self handlePOSTWithURL:url Parameters:str originalParas:paras success:success failure:failure];

}


/**
 初始化 配置接口


 */
+ (void)configInfoWithUUID:(NSString *)uuid
                  userName:(NSString *)userName
                   success:(success)success
                   failure:(failure)failure{

    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/register",TB_BASE_URL];
    
    //拼接参数
    NSDictionary *paras = @{@"uuid"     :uuid,
                            @"username" :userName};
    
    //不加密
    NSString *str = [self requestDictWithoutRSA:paras];
    
    [self handlePOSTWithURL:url Parameters:str originalParas:paras success:success failure:failure];
    
}

+ (void)uploadImageWithImage:(UIImage *)image
                   ImageName:(NSString *)name
                     success:(success)success
                     failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/img",TB_BASE_URL];
    
    [self uploadImageWithURL:url Image:image ImageName:name success:success failure:failure];

}
@end
