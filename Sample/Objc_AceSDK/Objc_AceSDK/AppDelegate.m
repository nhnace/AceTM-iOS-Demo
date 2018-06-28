//
//  AppDelegate.m
//  Objc_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import <AceTM/AceTM-Swift.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIUserNotificationSettings *pushRegistration = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:pushRegistration];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    NSDictionary *activityDic = [launchOptions objectForKey:UIApplicationLaunchOptionsUserActivityDictionaryKey];
    if (activityDic) {
        NSLog(@"activityDic: >>%@<<", [activityDic objectForKey:UIApplicationLaunchOptionsURLKey]);
    }
    
    [AceTM appDidFinishLaunchingWithResponder:self];
    return YES;
}

- (BOOL)application:(UIApplication *)application
continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler {
    NSLog(@"application:continueUserActivity:restorationHandler: called");
    
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        NSLog(@"userActivity.webpageURL: %@", userActivity.webpageURL);
    }
    NSLog(@"[userActivity description]: %@", [userActivity webpageURL]);
    
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    [AceTM appOpenUrlWithResponder:self url:url];
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 사용자로 부터 알림을 승인 했을경우 디바이스 토큰을 얻어온다.
    
    NSString *token = [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    // deviceToken 에서 필요없는 부분인 <, >, 공백을 제거한다.
    
    NSLog(@"Token : %@", token);
    // 공부 목적이라 NSLog로 찍어 내지만 실제 배포시에는 디바이스 토큰이 필요한다.
    // 디바이스 토큰을 서버로 전송하는 부분을 여기에 지정하면 될 듯 하다.
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // 디바이스 토큰을 얻어오는데 실패했을 경우
    
#if !TARGET_IPHONE_SIMULATOR
    // 아이폰 시뮬레이터는 불가능 하다.
    NSLog(@"Registration Error : %@", error);
    
#endif
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [AceTM pushWithData:userInfo];
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
