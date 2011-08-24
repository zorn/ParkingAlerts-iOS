//
//  ParkingAlertsAppDelegate.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/9/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "ParkingAlertsAppDelegate.h"
#import "PACar.h"

@implementation ParkingAlertsAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize userCar=_userCar;
@synthesize locationManager=_locationManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self buildDefaultCarIfNeeded];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //TODO: Add save
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [_userCar release];
    [super dealloc];
}

#pragma mark -
#pragma mark Setup Data

- (void)buildDefaultCarIfNeeded
{
    NSAssert([[PACar numberOfEntities] integerValue] > 1, @"Shouldn't ever be more than one car.");
    if ([[PACar numberOfEntities] integerValue] == 0) {
        self.userCar = [PACar createEntity];
        [self startStandardLocationUpdates];
    }
}

- (void)startStandardLocationUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // If it's a relatively recent event, turn off updates to save power
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0)
    {
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              newLocation.coordinate.latitude,
              newLocation.coordinate.longitude);
    }
    // else skip the event and process the next one.
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"locationManager %@ didFailWithError %@", manager, error);
}

@end
