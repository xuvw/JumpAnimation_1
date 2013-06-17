//
//  CMJumpAniLayer.m
//
//  Created by heke on 13-5-28.
//  email:smileshitou@hotmail.com
//  Copyright (c) 2013年 max. All rights reserved.
//

#import "CMJumpAniLayer.h"

@interface CMJumpAniLayer()
@end

@implementation CMJumpAniLayer
@synthesize de,isOver;

- (void)setSartPoint:(CGPoint)startPoint controlPoint:(CGPoint)controlPoint endPoint:(CGPoint)endPoint
{
    self.isOver = NO;
    CGRect r = self.frame;
    self.frame = CGRectMake(startPoint.x-r.size.width/2., startPoint.y-r.size.height/2., r.size.width, r.size.height);
    CGMutablePathRef thePath = CGPathCreateMutable();
    
    CGPathMoveToPoint(thePath, NULL, startPoint.x, startPoint.y);
    
    CGPathAddQuadCurveToPoint(thePath, NULL, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    [animation setPath:thePath]; // here is the magic!
    CGPathRelease(thePath);
    [animation setDuration:.8];
    
    [animation setCalculationMode:kCAAnimationLinear];
    [animation setRotationMode:nil]; // pass nil to turn off rotation model
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.2 :.3 :.8 :.8]];
    [animation setAutoreverses:NO];
    [animation setRepeatCount:1];
    [animation  setDelegate:self];
    [self addAnimation:animation forKey:@"position"];
    self.frame = CGRectMake(endPoint.x-r.size.width/2., endPoint.y-r.size.height/2., r.size.width, r.size.height);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (self.isOver)
    {
        return;
    }
    
    self.isOver = YES;
    [self removeFromSuperlayer];
    if (de != nil && [de respondsToSelector:@selector(animationEnd)])
    {
        [self.de animationEnd];
    }
}
@end
