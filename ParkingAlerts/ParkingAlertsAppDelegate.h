//
//  ParkingAlertsAppDelegate.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/9/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParkingAlertsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
