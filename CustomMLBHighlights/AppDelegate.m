//
//  AppDelegate.m
//  CustomMLBHighlights
//
//  Created by Patrick Rills on 3/19/16.
//  Copyright © 2016 BaseballHackDay. All rights reserved.
//

#import "AppDelegate.h"
#import "ApplicationUIContext.h"
#import "JankDataAccess.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[ApplicationUIContext getInstance] setPrimaryWindow:self.window];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    //[JankDataAccess saveDefaultFavorites];
    //[self scheduleNotification];
    
    return YES;
}

- (void) scheduleNotification
{
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    
    localNotif.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    localNotif.alertBody = @"Your highlights for today are ready";
    localNotif.alertTitle = @"MLB Highlights";
    localNotif.alertAction = NSLocalizedString(@"View", nil);
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
