//
//  TBToastView.m
//  Bugatti
//
//  Created by toby on 25/03/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "TBToastView.h"

#define TBTOASTVIEW_HEIGHT 100
@implementation TBToastView

+ (void)showToastViewWithText:(NSString *)text{
    
    [self showToastViewWithDuration:3 text:text];
}

+ (void)showToastViewWithDuration:(CGFloat)duration text:(NSString *)text{
    
    
    UIView *toastView = [[UIView alloc]initWithFrame:CGRectMake(0, -80, SCREEN_WIDTH, TBTOASTVIEW_HEIGHT)];
    toastView.backgroundColor = COLOR(234, 161, 59, 1);
//    toastView.backgroundColor = COLOR(0, 0, 0, 1);
    UILabel *toastLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, toastView.width-40, toastView.height)];
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
