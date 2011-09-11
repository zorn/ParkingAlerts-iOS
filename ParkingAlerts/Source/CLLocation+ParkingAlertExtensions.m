//
//  CLLocation+ParkingAlertExtensions.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 9/11/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "CLLocation+ParkingAlertExtensions.h"

@implementation CLLocation (CLLocation_ParkingAlertExtensions)

+ (CLLocation *)locationWithPALocation:(PALocation *)paLocation
{
    return [[CLLocation alloc] initWithLatitude:paLocation.latitude longitude:paLocation.longitude];
}

@end
