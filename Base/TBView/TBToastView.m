//
//  TBToastView.m
//  Bugatti
//
//  Created by toby on 25/03/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBToastView.h"

#define animation_time  3

@implementation TBToastView

+ (void)showToastViewWithText:(NSString *)text{
    
    [self showToastViewWithDuration:animation_time text:text];
}

+ (void)showToastViewWithDuration:(CGFloat)duration text:(NSString *)text{
    
    [self showToastViewWithDuration:duration text:text completion:nil];
}

+ (void)showToastViewWithText:(NSString *)text completion:(void (^)())completion{
    [self showToastViewWithDuration:animation_time text:text completion:completion];
}

+ (void)showToastViewWithDuration:(CGFloat)duration text:(NSString *)text completion:(void (^)())completion{
    CGFloat SCREEN_WIDTH = [[UIScreen mainScreen]bounds].size.width;
    
    UIView *toastView = [[UIView alloc]initWithFrame:CGRectMake(0, -80, SCREEN_WIDTH, TBTOASTVIEW_HEIGHT)];
    
    toastView.backgroundColor = [UIColor colorWithRed:234/255.0 green:161/255.0 blue:59/255.0 alpha:1];
    //    toastView.backgroundColor = COLOR(0, 0, 0, 1);
    UILabel *toastLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, toastView.frame.size.width-40, toastView.frame.size.height)];
    toastLab.textColor = [UIColor whiteColor];
    toastLab.font = [UIFont systemFontOfSize:16];
    toastLab.numberOfLines = 0;
    toastLab.textAlignment = NSTextAlignmentCenter;
    toastLab.text = text;
    
    [toastView addSubview:toastLab];
    
    [[self mainWindow] addSubview:toastView];
    
    
    //划出来动画
    [UIView animateWithDuration:0.4 animations:^{
        toastView.frame = CGRectMake(0, 0, SCREEN_WIDTH, TBTOASTVIEW_HEIGHT-0.01);
    } completion:^(BOOL finished) {
        
        //停留在屏幕最上方动画，可以考虑优化
        [UIView animateWithDuration:duration animations:^{
            toastView.frame = CGRectMake(0, 0, SCREEN_WIDTH, TBTOASTVIEW_HEIGHT);
        } completion:^(BOOL finished) {
            [toastView removeFromSuperview];
            completion();
        }];
    }];
}


+ (UIWindow *)mainWindow {
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}
@end
