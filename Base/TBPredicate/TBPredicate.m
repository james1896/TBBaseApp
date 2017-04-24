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


@interface TBPredicate()
@property (nonatomic,strong) NSMutableDictionary *result;
@end

@implementation TBPredicate

+ (instancetype)share{
    return [[TBPredicate alloc]init];
}

- (NSMutableDictionary *)dictFactory{
    _result = [[NSMutableDictionary alloc]initWithCapacity:0];
    [_result setObject:[NSNumber numberWithBool:NO] forKey:TBSTATUS];
    [_result setObject:@"nothing" forKey:TBTBDESC];
    return _result;
}

- (BOOL (^)())boolWithResult{
    
    return ^(){
        BOOL flag = NO;
        if(_result){
            flag = [_result[TBSTATUS] boolValue];
        }
        return flag;
    };
}

- (NSString *(^)())stringWithResult{
    return ^(){
        NSString *desc = @"";
        if(_result)
            desc = _result[TBTBDESC];
        return desc;
    };
}

- (TBPredicate *(^)(NSString *phoneNumber))checkPhone{
    return ^(NSString *phoneNumber){
        _result = [self dictFactory];
        NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TB_PHONE_REGULAR];
        
        if ([phonePredicate evaluateWithObject:phoneNumber]) {
            
            [_result setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
        }else{
            [_result setObject:@"请输入正确的手机号" forKey:TBTBDESC];
        }
        return self;
    };
}

- (TBPredicate *(^)(NSString *phoneNumber))checkPassword{
    return ^(NSString *phoneNumber){
        _result = [self dictFactory];
        NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TB_PASSWORD_REGULAR];
        
        if ([phonePredicate evaluateWithObject:phoneNumber]) {
            
            [_result setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
        }else{
            [_result setObject:@"密码必须是8-16数字或字母的组合" forKey:TBTBDESC];
        }
        return self;
    };
}


- (TBPredicate *(^)(NSString *phoneNumber))checkRealname{
    return ^(NSString *phoneNumber){
        _result = [self dictFactory];
        NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TB_PASSWORD_REGULAR];
        
        if ([phonePredicate evaluateWithObject:phoneNumber]) {
            
            [_result setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
        }else{
            [_result setObject:@"请输入正确的真实中文姓名" forKey:TBTBDESC];
        }
        return self;
    };
}


- (TBPredicate *(^)(NSString *phoneNumber))checkUserName{
    return ^(NSString *phoneNumber){
        _result = [self dictFactory];
        NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TB_USERNAME_REGULAR];
        
        if ([phonePredicate evaluateWithObject:phoneNumber]) {
            
            [_result setObject:[NSNumber numberWithBool:YES] forKey:TBSTATUS];
        }else{
            [_result setObject:@"用户名必须是5-11数字或字母的组合" forKey:TBTBDESC];
        }
        return self;
    };
}

@end
