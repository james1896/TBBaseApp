//
//  TBRequestOnAdmin.m
//  TBBaseApp
//
//  Created by toby on 25/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRequestOnAdmin.h"

#import "NIKKARSA.h"
#import "NSDictionary+TBRequestManager.h"


#define TB_BASE_ADMIN_URL    @"http://10.71.66.102:8001/admin"
@implementation TBRequestOnAdmin

+ (void)userCountAtSuccess:(success)success failure:(failure)failure{

    
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/usercount",TB_BASE_ADMIN_URL];
    
    
    NSDictionary *paras = @{@"uuid":@"80BFEC61-59A7-4991-9212-148A3DDFE705"};
    
    //RSA加密
    NSString *str = [self requestDictWithRSA:paras];
    
    
    [self handlePOSTWithURL:url Parameters:@{@"value":str} originalParas:paras success:success failure:failure];
    
}

+ (void)allPointsWithUUID:(NSString *)uuid success:(success)success failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/allpoints",TB_BASE_ADMIN_URL];
    
    
    NSDictionary *paras = @{@"uuid":uuid};
    
    //RSA加密
    NSString *str = [self requestDictWithRSA:paras];
    
    
    [self handlePOSTWithURL:url Parameters:@{@"value":str} originalParas:paras success:success failure:failure];
}

/**
 Handle POST
 
 @param url <#url description#>
 @param jsonDict <#jsonStr description#>
 @param orgParas <#orgParas description#>
 @param success <#success description#>
 @param failure <#failure description#>
 */
+ (void)handlePOSTWithURL:(NSString *)url Parameters:(NSDictionary *)jsonDict originalParas:(NSDictionary *)orgParas success:(success)success failure:(failure)failure {
    
    if(!jsonDict || !url) return;
    
    if(orgParas){
        [self POSTWithURL:url parameters:jsonDict originalParas:orgParas success:success failure:failure];
    }else{
        [self POSTWithURL:url parameters:jsonDict success:success failure:failure];
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

@end
