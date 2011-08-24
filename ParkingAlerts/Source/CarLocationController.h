//
//  CarLocationController.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/24/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class PACar;

@interface CarLocationController : NSObject <CLLocationManagerDelegate>

@property (retain) PACar *car;
@property (retain) CLLocationManager *locationManager;
@property (retain) NSDate *startedUpdatingLocationAt;

- (void)updateCarWithCurrentLocation;
- (void)stopUpdatingCarLocation;

@end
