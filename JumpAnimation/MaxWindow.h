//
//  MaxWindow.h
//  JumpAnimation
//
//  Created by heke on 13-6-17.
//  email:smileshitou@hotmail.com
//  Copyright (c) 2013年 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MaxWindowDelegate;

@interface MaxWindow : UIWindow

@property (nonatomic, assign) id<MaxWindowDelegate>delegate;

@end

@protocol MaxWindowDelegate <NSObject>

@optional

- (void)windowTouchBegan:(CGPoint)point;
- (void)windowTouchMoved:(CGPoint)point;
- (void)windowTouchEnded:(CGPoint)point;
- (void)windowTouchCanceled:(CGPoint)point;
@end
