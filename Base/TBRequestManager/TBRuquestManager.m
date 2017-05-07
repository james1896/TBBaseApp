//
//  TBRuquestManager.m
//  TBBaseApp
//
//  Created by toby on 07/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRuquestManager.h"

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
    
//    [self POSTWithURL:url parameters:@{value:jsonStr} success:success failure:failure];
    [self POSTWithURL:url parameters:@{value:jsonStr} originalParas:orgParas success:success failure:failure];
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
+ (NSString *)requestDictNoWithRSA:(NSDictionary *)paras{
    // 字典转 json
    NSString *jsonStr = [paras convertToJsonData];
//    return @{@"value":jsonStr};
    return jsonStr;
}


/**
 登录接口
 处理   url 和 paras

 @param name <#name description#>
 @param pwd <#pwd description#>
 @param uuid <#uuid description#>
 @param device <#device description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)loginWithName:(NSString *)name password:(NSString *)pwd uuid:(NSString *)uuid device:(NSString *)device success:(success)success failure:(failure)failure{
    
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/login",BASE_URL];
    
    //拼接参数
    NSDictionary *paras = @{@"username" :name,
                            @"password" :pwd,
                            @"uuid"     :uuid,
                            @"device"   :device};
    
    //RSA加密
    NSString *str = [self requestDictWithRSA:paras];
    
    [self handlePOSTWithURL:url Parameters:str originalParas:paras success:success failure:failure];

}

@end
