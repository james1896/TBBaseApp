//
//  TBPredicate.h
//  TBBaseApp
//
//  Created by toby on 22/04/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>


//请输入正确的手机号
static NSString *TBPHONEREGULAR = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";


//密码必须是8-16数字或字母的组合
static NSString *TBPASSWORDREGULAR = @"^[A-Za-z0-9]{8,16}+$";


//用户名必须是5-11数字或字母的组合
static NSString *TBUSERNAMEREGULAR = @"^[A-Za-z0-9]{5,11}+$";


@interface TBPredicate : NSObject

+ (NSDictionary *)checkPhone:   (NSString *)phoneNumber;

+ (NSDictionary *)checkUserName:(NSString *)userName;

+ (NSDictionary *)checkPassword:(NSString *)pwd;


//
+ (BOOL)boolWithDictionary:(NSDictionary *)dict;
+ (NSString *)descWithDictionary:(NSDictionary *)dict;

@end


