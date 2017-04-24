//
//  TBPredicate.h
//  TBBaseApp
//
//  Created by toby on 22/04/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>


//请输入正确的手机号
static NSString *TB_PHONE_REGULAR = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";


//密码必须是8-16数字或字母的组合
static NSString *TB_PASSWORD_REGULAR = @"^[A-Za-z0-9]{8,16}+$";


//用户名必须是5-11数字或字母的组合
static NSString *TB_USERNAME_REGULAR = @"^[A-Za-z0-9]{5,11}+$";

//包括了新疆名字 判断
static NSString *TB_REALNAME_REGULAR = @"^([\\u4e00-\\u9fa5]|\\u3007)+([\\.\\uff0e\\u00b7\\u30fb]?|\\u3007?)+([\\u4e00-\\u9fa5]|\\u3007)+$";

@interface TBPredicate : NSObject

@property (nonatomic,copy) TBPredicate * (^checkPhone)(NSString *phoneNumber);
@property (nonatomic,copy) TBPredicate * (^checkUserName)(NSString *userName);
@property (nonatomic,copy) TBPredicate * (^checkPassword)(NSString *pwd);
@property (nonatomic,copy) TBPredicate * (^checkRealname)(NSString *checkRealname);

@property (nonatomic,copy) NSString* (^stringWithResult)();

@property (nonatomic,copy) BOOL (^boolWithResult)();


+ (instancetype)share;

@end


