//
//  PALocation.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import "PALocation.h"
#import "PAAlert.h"
#import "PACar.h"


@implementation PALocation
@dynamic latitudeAsNumber;
@dynamic longitudeAsNumber;
@dynamic endLocationOfAlert;
@dynamic ofCar;
@dynamic startLocationOfAlert;

- (double)latitude
{
    return [self.latitudeAsNumber doubleValue];
}

- (void)setLatitude:(double)newValue
{
    [self setLatitudeAsNumber:[NSNumber numberWithDouble:newValue]];
}

- (double)longitude
{
    return [self.longitudeAsNumber doubleValue];
}

- (void)setLongitude:(double)newValue
{
    [self setLongitudeAsNumber:[NSNumber numberWithDouble:newValue]];
}

@end
