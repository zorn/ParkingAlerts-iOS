//
//  ParkingAlertsAppDelegate.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/9/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PACar;
@class CarLocationController;
@class AlertMapViewController;

@interface ParkingAlertsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet AlertMapViewController *alertMapViewController;

@property (retain) PACar *userCar;
@property (retain) CarLocationController *carLocationController;

@end

@interface ParkingAlertsAppDelegate (Private)
- (void)buildCoreDataStack;
- (void)assignUserCar;
@end