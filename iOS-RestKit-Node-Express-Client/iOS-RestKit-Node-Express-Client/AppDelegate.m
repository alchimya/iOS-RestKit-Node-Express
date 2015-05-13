//
//  AppDelegate.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "AppDelegate.h"
#import "L3SDKAlertView.h"
#import "RESTSDKConfig.h"
#import "RESTSDK.h"
//HOW TO INSTALL RESTKIT
//https://github.com/RestKit/RestKit/wiki/Installing-RestKit-v0.20.x-as-a-Git-Submodule
#import <RestKit/RestKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
  
    //UncaughtExceptionHandler
    NSSetUncaughtExceptionHandler(&HandleExceptions);
    
    //gets server url from settings bundle
    //you can change it
    NSString*server=[self getServerUrl];
    
    
    //TODO
    //you can manage, for example, basic auth credentials into a plist.
    //at this moment node server is configured to work with a super secure pair credentual data :O
    //uid:my_uid
    //pwd:my_pwd
    RESTSDKConfig*configuration=[[RESTSDKConfig alloc ] initWithAccountId:@"my_uid"
                                                                      andApiKey:@"my_pwd" andRemoteHost:server];
    [[RESTSDK sharedInstance] startWithConfiguration:configuration];
    
    return YES;
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


void HandleExceptions(NSException *exception) {
    
    
    //TODO SEND ERROR TO SERVER FOR TRACKING
    NSArray* backtrace = [exception callStackSymbols];
    NSString* model = [[UIDevice currentDevice] model];
    NSString* name = [[UIDevice currentDevice] name] ;
    NSString* version = [[UIDevice currentDevice] systemVersion];
    NSString* message = [NSString stringWithFormat:@"Device: %@-%@. OS: %@. Backtrace:\n%@", model,name, version, backtrace];
    
    [UIAlertView warning:@"There has been an error processing your request.\nThe application will be closed in a few seconds"];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    
}
-(NSString*)getServerUrl{
    
    //gets server url from settings bundle
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSString*retValue=[defaults stringForKey:@"WebServiceIP"];
    if (retValue==nil) {
        return @"http://localhost:8000";
    }
    return [NSString stringWithFormat:@"http://%@",retValue];
    
}

@end
