//
//  TBPredicate.m
//  TBBaseApp
//
//  Created by toby on 22/04/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBPredicate.h"

static NSString *TBSTATUS = @"status";

static NSString *TBTBDESC = @"desc";


@implementation TBPredicate


+ (NSDictionary *)checkPhone:(NSString *)phoneNumber{
    
    NSMutableDictionary *mdict = [self dictFactory];
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TBPHONEREGULAR];
    
    if ([phonePredicate evaluateWithObject:phoneNumber]) {
        
       [mdict setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
    }else{
     [mdict setObject:@"请输入正确的手机号" forKey:TBTBDESC];
    }
    
    return mdict;
}

+ (NSDictionary *)checkUserName:(NSString *)userName{
    NSMutableDictionary *mdict = [self dictFactory];
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TBUSERNAMEREGULAR];
    
    if ([phonePredicate evaluateWithObject:userName]) {
        
        [mdict setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
    }else{
        [mdict setObject:@"用户名必须是5-11数字或字母的组合" forKey:TBTBDESC];
    }
    
    return mdict;
}

+ (NSDictionary *)checkPassword:(NSString *)pwd{
    NSMutableDictionary *mdict = [self dictFactory];
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TBPASSWORDREGULAR];
    
    if ([phonePredicate evaluateWithObject:pwd]) {
        
        [mdict setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
    }else{
        [mdict setObject:@"密码必须是8-16数字或字母的组合" forKey:TBTBDESC];
    }
    
    return mdict;
}

//方法

+ (NSMutableDictionary *)dictFactory{
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[NSNumber numberWithBool:NO] forKey:TBSTATUS];
    [mdict setObject:@"nothing" forKey:TBTBDESC];
    return mdict;
}

+ (BOOL)boolWithDictionary:(NSDictionary *)dict{
    
    return [dict[TBSTATUS] boolValue];
}

+ (NSString *)descWithDictionary:(NSDictionary *)dict{
    return dict[TBTBDESC];
}

@end
