//
//  TBRequestOnAdmin.h
//  TBBaseApp
//
//  Created by toby on 25/05/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBRuquest.h"

@interface TBRequestOnAdmin : TBRuquest

+ (void)userCountAtSuccess:(success)success
                   failure:(failure)failure;

+ (void)allPointsWithUUID:(NSString *)uuid
                  success:(success)success
                  failure:(failure)failure;
@end
