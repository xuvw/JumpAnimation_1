//
//  MaxWindow.m
//  JumpAnimation
//
//  Created by heke on 13-6-17.
//  email:smileshitou@hotmail.com
//  Copyright (c) 2013年 Max. All rights reserved.
//

#import "MaxWindow.h"

@implementation MaxWindow

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - event route
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (delegate && [delegate respondsToSelector:@selector(windowTouchBegan:)])
    {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInView:self];
        [delegate windowTouchBegan:touchPoint];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (delegate && [delegate respondsToSelector:@selector(windowTouchMoved:)])
    {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInView:self];
        [delegate windowTouchMoved:touchPoint];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if (delegate && [delegate respondsToSelector:@selector(windowTouchEnded:)])
    {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInView:self];
        [delegate windowTouchEnded:touchPoint];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    
    if (delegate && [delegate respondsToSelector:@selector(windowTouchCanceled:)])
    {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInView:self];
        [delegate windowTouchCanceled:touchPoint];
    }
}

@end
