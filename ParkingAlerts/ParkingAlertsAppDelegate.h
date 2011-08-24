//
//  ParkingAlertsAppDelegate.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/9/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class PACar;
@class CLLocationManager;

@interface ParkingAlertsAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (retain) PACar *userCar;
@property (retain) CLLocationManager *locationManager;

@end

@interface ParkingAlertsAppDelegate (Private)
- (void)buildDefaultCarIfNeeded;
- (void)startStandardLocationUpdates;
@end