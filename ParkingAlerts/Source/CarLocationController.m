//
//  CarLocationController.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/24/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "CarLocationController.h"
#import "PACar.h"
#import "PALocation.h"

@implementation CarLocationController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


@synthesize car=_car;
@synthesize locationManager=_locationManager;
@synthesize startedUpdatingLocationAt=_startedUpdatingLocationAt;

- (void)dealloc {
    [_car release];
    [_locationManager release];
    [_startedUpdatingLocationAt release];
    [super dealloc];
}

- (void)updateCarWithCurrentLocation
{
    if (self.car == nil) {
        NSLog(@"Call to -updateCarToCurrentLocation but there was no car.");
        return; // bail
    }
    
    if (nil == self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    [self.locationManager startUpdatingLocation];
    self.startedUpdatingLocationAt = [NSDate date]; 
}

- (void)stopUpdatingCarLocation
{
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    self.locationManager = nil;
}

#pragma mark -
#pragma mark CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"latitude %+.6f, longitude %+.6f, %@", newLocation.coordinate.latitude, newLocation.coordinate.longitude, newLocation.timestamp);
    NSLog(@"[self.startedUpdatingLocationAt timeIntervalSinceNow] %f", [self.startedUpdatingLocationAt timeIntervalSinceNow]);
    if ([self.startedUpdatingLocationAt timeIntervalSinceNow] < -5.0) {
        [self stopUpdatingCarLocation];
    } else {
        self.car.location.latitude = newLocation.coordinate.latitude;
        self.car.location.longitude = newLocation.coordinate.longitude;
    }
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
    //CLLocation *fakeLocation = [[[CLLocation alloc] initWithLatitude:38.890164 longitude:-77.034588] autorelease];
    
    // IndyHall
    CLLocation *fakeLocation = [[[CLLocation alloc] initWithLatitude:39.950916 longitude:-75.145829] autorelease];
    
    [self.delegate locationManager:self
               didUpdateToLocation:fakeLocation
                      fromLocation:fakeLocation];    
}

@end

#endif // TARGET_IPHONE_SIMULATOR