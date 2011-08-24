//
//  PALocation.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class PAAlert, PACar;

@interface PALocation : NSManagedObject <MKAnnotation>
{
@private
    
}
@property (nonatomic, retain) NSNumber *latitudeAsNumber;
@property (nonatomic, retain) NSNumber *longitudeAsNumber;
@property (nonatomic, retain) PAAlert *endLocationOfAlert;
@property (nonatomic, retain) PACar *ofCar;
@property (nonatomic, retain) PAAlert *startLocationOfAlert;

- (double)latitude;
- (void)setLatitude:(double)newValue;
- (double)longitude;
- (void)setLongitude:(double)newValue;

- (CLLocationCoordinate2D)coordinate;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoord;
- (NSString *)title;
- (NSString *)subtitle;

@end
