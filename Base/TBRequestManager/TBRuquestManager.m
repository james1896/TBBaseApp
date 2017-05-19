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
    
    
    [self handlePOSTWithURL:url Parameters:@{TBValue:str} originalParas:parameters success:success failure:failure];
    
}

+ (void)test1WithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/test1",TB_BASE_URL];
    
    
    //不加密
    //    NSString *str = [self requestDictWithoutRSA:parameters];
    
    [self handlePOSTWithURL:url Parameters:parameters originalParas:parameters success:success failure:failure];
    
}



/**
 积分查询
 
 @param userID
 @param positive_points 正数（积分增加）
 @param negative_points 负数（积分减少）
 两个参数至少有一个为0，
 如果两个参数都为零表示查询积分
 
 
 */
+ (void)updatePointsWithUserID:(NSString *)userID
                      positive:(NSUInteger)positive_points
                      negative:(NSUInteger)negative_points
                       success:(success)success
                       failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/updatepoints",TB_BASE_URL];
    
    NSDictionary *paras = @{@"positive_points" :[NSNumber numberWithUnsignedInteger:positive_points],
                            @"negative_points" :[NSNumber numberWithUnsignedInteger:negative_points],
                            @"value"  :[self requestDictWithRSA:@{@"user_id":userID}]};
    
    [self handlePOSTWithURL:url Parameters:paras originalParas:nil success:success failure:failure];
}

/**
 积分转赠
 */
+ (void)transformPointWithUserID:(NSString *)userID
                      friendName:(NSString *)fName
                           point:(NSInteger)point
                         success:(success)success
                         failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/transforpoints",TB_BASE_URL];
    
    NSDictionary *paras = @{@"points" :[NSNumber numberWithInt:point],
                            @"value"  :[self requestDictWithRSA:@{@"user_id":userID,
                                                                  @"friend_name":fName}]};
    
    [self handlePOSTWithURL:url Parameters:paras originalParas:nil success:success failure:failure];
}


/**
 查询订单
 
 @param userID id
 
 */
+ (void)queryOrderWithUserID:(NSString *)userID success:(success)success failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/findorder",TB_BASE_URL];
    
    //拼接参数 加密
    NSDictionary *paras = @{@"value" :[self requestDictWithRSA:@{@"user_id":userID}]};
    
    [self handlePOSTWithURL:url Parameters:paras originalParas:nil success:success failure:failure];
}

/**
 意见反馈
 */
+ (void)feedbackWithUserID:(NSString *)userID content:(NSString *)content success:(success)success failure:(failure)failure{
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/feedback",TB_BASE_URL];
    
    //拼接参数
    NSDictionary *paras = @{@"user_id" :userID,
                            @"content" :content
                            };
    
    [self handlePOSTWithURL:url Parameters:paras originalParas:nil success:success failure:failure];
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
    
    [self handlePOSTWithURL:url Parameters:@{TBValue:str} originalParas:paras success:success failure:failure];
    
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
    
    [self handlePOSTWithURL:url Parameters:@{TBValue:str} originalParas:paras success:success failure:failure];
    
}


/**
 初始化 配置接口
 
 
 */
+ (void)userInfoWithUUID:(NSString *)uuid
                  device:(NSString *)device
                lastTime:(NSString *)time
                userName:(NSString *)userName
                 success:(success)success
                 failure:(failure)failure{
    
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@/userinfo",TB_BASE_URL];
    
    NSDictionary *paras = nil;
    if(userName == nil ||
       userName == NULL ||
       [userName isEqualToString: @""] ||
       [userName isKindOfClass:[NSNull class]])
        
    {
        //拼接参数
        paras = @{@"uuid"     :uuid,
                  @"device"   :device,
                  @"username" :@""};
    }else{
        //拼接参数
        paras = @{@"uuid"     :uuid,
                  @"device"   :device,
                  @"value" :[self requestDictWithRSA:@{@"username":userName}]};
    }
    
    
    [self handlePOSTWithURL:url Parameters:paras originalParas:paras success:success failure:failure];
    
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
