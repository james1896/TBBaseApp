//
//  TBKeyChain.h
//  KeyChainTest
//
//  Created by toby on 21/04/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

#define KEY_PASSWORD  @"com.rry.app.password"
#define KEY_USERNAME_PASSWORD  @"com.rry.app.usernamepassword"

@interface TBKeyChain : NSObject

//保存
+ (void)save:(NSString *)service data:(id)data;

//取
+ (id)load:(NSString *)service;

//删除
+ (void)delete:(NSString *)service;

@end
