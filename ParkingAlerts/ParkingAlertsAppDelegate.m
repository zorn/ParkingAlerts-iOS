//
//  ParkingAlertsAppDelegate.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/9/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "ParkingAlertsAppDelegate.h"

@implementation ParkingAlertsAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)awakeFromNib
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //TODO: Add save
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}






@end
