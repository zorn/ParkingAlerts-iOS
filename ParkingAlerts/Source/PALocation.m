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

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    
    if ([key isEqualToString:@"coordinate"])
    {
        NSSet *affectingKeys = [NSSet setWithObjects:@"latitudeAsNumber", @"longitudeAsNumber",nil];
        keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKeys];
    }
    return keyPaths;
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.latitude;
    coordinate.longitude = self.longitude;
    return coordinate;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoord
{
    self.latitude = newCoord.latitude;
    self.longitude = newCoord.longitude;
}

- (NSString *)title
{
    if (self.ofCar) {
        return @"My Car";
    } else {
        return @"Some Title";
    }
}

- (NSString *)subtitle
{
    if (self.ofCar) {
        return @"is awesome";
    } else {
        return @"Subtitle";
    }
}

@end
