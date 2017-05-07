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



+ (void)handlePOSTWithURL:(NSString *)url Parameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    
    if(!parameters || !url) return;
    
    //    [self POSTWithURL:url parameters:parameters success:success failure:failure];
}



/**
 处理参数
 RSA加密数据

 @param paras <#paras description#>
 @return @{"value":"json"}
 */
+ (NSDictionary *)requestDictWithRSA:(NSDictionary *)paras{
    
    // 字典转 json
    NSString *jsonStr = [paras convertToJsonData];
    
    //rsa加密
    NSString *encodeStr = [NIKKARSA encryptString:jsonStr];
    
    return @{@"value":encodeStr};
}


/**
 处理参数
 不加密

 @param paras <#paras description#>
 @return @{"value":"json"}
 */
+ (NSDictionary *)requestDictNoWithRSA:(NSDictionary *)paras{
    // 字典转 json
    NSString *jsonStr = [paras convertToJsonData];
    return @{@"value":jsonStr};
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
    
    NSString *url = [NSString stringWithFormat:@"%@/login",BASE_URL];
    
    NSDictionary *paras = @{@"username" :name,
                            @"password" :pwd,
                            @"uuid"     :uuid,
                            @"device"   :device};
    
    [self handlePOSTWithURL:url Parameters:paras success:success failure:failure];

}

@end
