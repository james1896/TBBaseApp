//
//  TBToastView.h
//  Bugatti
//
//  Created by toby on 25/03/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TBTOASTVIEW_HEIGHT 90


static NSString *toastString = @"在您的搜索日期内我们没有空房了，请更改日期重试。";
static NSString *TOASTSTRING_FEEDBACK = @"nikka 知道您有许多话想对我说，我会努力完善自己，给您更好的体验";


@interface TBToastView : UIView

+ (void)showToastViewWithText:(NSString *)text;
+ (void)showToastViewWithText:(NSString *)text completion:(void (^)())completion;

+ (void)showToastViewWithDuration:(CGFloat)duration text:(NSString *)text;
+ (void)showToastViewWithDuration:(CGFloat)duration text:(NSString *)text completion:(void (^)())completion;
@end
