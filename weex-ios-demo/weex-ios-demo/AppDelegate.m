//
//  AppDelegate.m
//  weex-ios-demo
//
//  Created by bill on 2017/4/13.
//  Copyright © 2017年 loostudy. All rights reserved.
//

#import "AppDelegate.h"
#import <WeexSDK/WXSDKEngine.h> //SDK开放的绝大多数接口都在此有声明。
#import <WeexSDK/WXLog.h> //控制Log输出的级别，包括Verbose、Debug、Info、Warning、Error，开发者可以按需来设置输出级别。
#import <WeexSDK/WXDebugTool.h> //weex提供的对外调试工具。
#import <WeexSDK/WXAppConfiguration.h> //使用weex开发的业务性配置。
#import "ImageAdapter.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //业务配置，非必需
    [WXAppConfiguration setAppGroup:@"AliApp"];
    [WXAppConfiguration setAppName:@"WeexDemo"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    //初始化SDK环境
    [WXSDKEngine initSDKEnviroment];
    
    //设置Log输出等级：调试环境默认为Debug，正式发布会自动关闭。
    [WXLog setLogLevel:WXLogLevelAll];
    
    [WXSDKEngine registerHandler:[ImageAdapter new] withProtocol:@protocol(WXImgLoaderProtocol)];
    
//    //注册自定义module和component，非必需
//    [WXSDKEngine registerComponent:@"MyView" withClass:[MyViewComponent class]];
//    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
//    
//    //注册协议的实现类，非必需
//    [WXSDKEngine registerHandler:[WXNavigationDefaultImpl new] withProtocol:@protocol(WXNavigationProtocol)];
    
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
