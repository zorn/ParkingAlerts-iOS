//
//  CLLocation+ParkingAlertExtensions.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 9/11/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "PALocation.h"

@interface CLLocation (CLLocation_ParkingAlertExtensions)

+ (CLLocation *)locationWithPALocation:(PALocation *)paLocation;

@end
