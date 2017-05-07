//
//  NIKKARSA.h
//  Bugatti
//
//  Created by toby on 21/02/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NIKKARSA : NSObject

+ (NIKKARSA *)share;

- (NSString *) encryptString:(NSString *)str;

- (NSString *) decryptString:(NSString *)str;

+ (NSString *) encryptString:(NSString *)str;

+ (NSString *) decryptString:(NSString *)str;
@end
