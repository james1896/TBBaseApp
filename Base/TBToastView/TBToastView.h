//
//  TBToastView.h
//  Bugatti
//
//  Created by toby on 25/03/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *toastString = @"在您的搜索日期内我们没有空房了，请更改日期重试。";

@interface TBToastView : UIView

+ (void)showToastViewWithText:(NSString *)text;

+ (void)showToastViewWithDuration:(CGFloat)duration text:(NSString *)text;
@end
