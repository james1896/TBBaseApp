//
//  UICopyLabel.m
//  A02_iPhone
//
//  Created by toby on 25/04/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "UICopyLabel.h"

@implementation UICopyLabel

-(BOOL)canBecomeFirstResponder

{
    
    return YES;
    
}

//还需要针对复制的操作覆盖两个方法：

// 可以响应的方法

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender

{
    
    return (action == @selector(copy:));
    
}

//针对于响应方法的实现

-(void)copy:(id)sender

{
    
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    
    pboard.string = self.text;
    
}

//有了以上三个方法，我们就能处理copy了，当然，在能接收到事件的情况下：



//UILabel默认是不接收事件的，我们需要自己添加touch事件

-(void)attachTapHandler {
    UILongPressGestureRecognizer *longTouch = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    longTouch.minimumPressDuration= 1;
    [self addGestureRecognizer:longTouch];
    
    
}

//绑定事件

- (id)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if (self)
        
    {
         self.userInteractionEnabled = YES;  //用户交互的总开关
        [self attachTapHandler];
        
    }
    
    return self;
    
}

//同上

-(void)awakeFromNib

{
    
    [super awakeFromNib];
     self.userInteractionEnabled = YES;  //用户交互的总开关
    [self attachTapHandler];
    
}

//我们已经可以接收到事件了！由于我在上方将tap数设为2，所以需要双击才能捕获，
//
//接下来，我们需要处理这个tap，以便让菜单栏弹出来：

-(void)handleTap:(UIGestureRecognizer*) recognizer

{
    
    [self becomeFirstResponder];
    
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制"
                             
                                                      action:@selector(copy:)];
    
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
    
}

@end
