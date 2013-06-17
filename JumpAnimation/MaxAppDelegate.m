//
//  MaxAppDelegate.m
//  JumpAnimation
//
//  Created by heke on 13-6-17.
//  email:smileshitou@hotmail.com
//  Copyright (c) 2013年 Max. All rights reserved.
//

#import "MaxAppDelegate.h"
#import "MaxWindow.h"
#import "CMJumpAniLayer.h"
#import <QuartzCore/QuartzCore.h>

#define kEndPointX (300)
#define kEndPointY (400)

@interface MaxAppDelegate()
<MaxWindowDelegate,CMJumpAniLayerDelegate>

@end


@implementation MaxAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MaxWindow *maxWindow = [[[MaxWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    maxWindow.delegate = self;
    self.window = maxWindow;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - MaxWindowDelegate
- (void)windowTouchBegan:(CGPoint)point
{
    NSLog(@"x:%f,y:%f",point.x,point.y);
}

- (void)windowTouchMoved:(CGPoint)point
{
    
}

- (void)windowTouchEnded:(CGPoint)point
{
    [self jumpFrom:point];
}

- (void)windowTouchCanceled:(CGPoint)point
{
    
}

- (void)jumpFrom:(CGPoint)sp
{
    CMJumpAniLayer *headPic = (CMJumpAniLayer *)[CMJumpAniLayer layer];
    headPic.frame = CGRectMake(0, 0, 21, 21);
    headPic.contentsScale = [UIScreen mainScreen].scale;
    headPic.contents = (id)([UIImage imageNamed:@"ball"].CGImage);
    
    //利用3次贝塞尔曲线构造路径
    CGPoint startPoint = sp;
    
    CGPoint endPoint = CGPointMake(kEndPointX, kEndPointY);
    
    CGPoint controlPoint = CGPointMake(fabs(endPoint.x+startPoint.x)/2., startPoint.y-300);
    
    [headPic setSartPoint:startPoint controlPoint:controlPoint endPoint:endPoint];
    headPic.de = self;
    [self.window.layer addSublayer:headPic];
}

#pragma mark - JumpLayerDelegate
- (void)animationEnd
{
    
}

@end
