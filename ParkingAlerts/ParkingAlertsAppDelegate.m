//
//  ParkingAlertsAppDelegate.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/9/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "ParkingAlertsAppDelegate.h"
#import "PACar.h"
#import "CarLocationController.h"

@implementation ParkingAlertsAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize userCar=_userCar;
@synthesize carLocationController=_carLocationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self buildCoreDataStack];
    self.carLocationController = [[CarLocationController alloc] init];
    [self assignUserCar];
        
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
    [_carLocationController release];
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors Methods

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
    BOOL autoLocateNewCarBasedOnCurrentLocation = NO;
    if ([[PACar numberOfEntities] integerValue] == 0) {
        self.userCar = [PACar createEntity];
        autoLocateNewCarBasedOnCurrentLocation = YES;
    } else {
        NSArray *allCars = [PACar findAll];
        NSAssert(allCars.count == 1, @"Found more than one car.");
        self.userCar = [allCars lastObject];
    }
    
    self.carLocationController.car = self.userCar;
    if (autoLocateNewCarBasedOnCurrentLocation) {
        [self.carLocationController updateCarWithCurrentLocation];
    }
}

@end





