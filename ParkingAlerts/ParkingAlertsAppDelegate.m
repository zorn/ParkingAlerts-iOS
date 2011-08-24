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
    [self buildCoreDataStack];
    [self assignUserCar];
    [self startStandardLocationUpdates];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[NSManagedObjectContext defaultContext] save];
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [_userCar release];
    [super dealloc];
}

#pragma mark -
#pragma mark Core Data Methods

- (void)buildCoreDataStack
{
    NSManagedObjectModel *model = [NSManagedObjectModel managedObjectModelNamed:@"ParkingAlerts.momd"];
    [NSManagedObjectModel setDefaultManagedObjectModel:model];
    
    NSPersistentStoreCoordinator *prc = [NSPersistentStoreCoordinator coordinatorWithSqliteStoreNamed:@"ProfitTrainCoreData.sqlite"];
    [NSPersistentStoreCoordinator setDefaultStoreCoordinator:prc];
    
    [ActiveRecordHelpers setupCoreDataStack];
}

#pragma mark -
#pragma mark Setup Data

- (void)assignUserCar
{
    if ([[PACar numberOfEntities] integerValue] == 0) {
        self.userCar = [PACar createEntity];
        [self startStandardLocationUpdates];
    } else {
        NSArray *allCars = [PACar findAll];
        NSAssert(allCars.count == 1, @"Found more than one car.");
        self.userCar = [allCars lastObject];
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
    NSLog(@"latitude %+.6f, longitude %+.6f, %@, %f",
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude,
          eventDate,
          howRecent);
    //    if (abs(howRecent) < 15.0)
//    {
//        
//    }
    // else skip the event and process the next one.
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"locationManager %@ didFailWithError %@", manager, error);
}

@end




#if TARGET_IPHONE_SIMULATOR 

// Patching CLLocationManager to do something useful in the Xcode 4.1 / iOS 4.3 Simulator
// https://devforums.apple.com/thread/112805?start=0&tstart=0

@interface CLLocationManager (Simulator)
@end

@implementation CLLocationManager (Simulator)

-(void)startUpdatingLocation {
    //Washington Monument:
    CLLocation *fakeLocation = [[[CLLocation alloc] initWithLatitude:38.890164 longitude:-77.034588] autorelease];
    
    [self.delegate locationManager:self
               didUpdateToLocation:fakeLocation
                      fromLocation:fakeLocation];    
}

@end

#endif // TARGET_IPHONE_SIMULATOR
