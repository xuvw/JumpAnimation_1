//
//  CMJumpAniLayer.h
//
//  Created by heke on 13-5-28.
//  email:smileshitou@hotmail.com
//  Copyright (c) 2013年 max. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@protocol CMJumpAniLayerDelegate;
@interface CMJumpAniLayer : CALayer

@property (nonatomic, assign) id<CMJumpAniLayerDelegate>de;
@property (nonatomic, assign) BOOL isOver;

- (void)setSartPoint:(CGPoint)sp controlPoint:(CGPoint)cp endPoint:(CGPoint)ep;

@end

@protocol CMJumpAniLayerDelegate <NSObject>

@optional

- (void)animationEnd;

@end
