//
//  PALocation.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PAAlert, PACar;

@interface PALocation : NSManagedObject {
@private
}
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic, retain) PAAlert *endLocationOfAlert;
@property (nonatomic, retain) PACar *ofCar;
@property (nonatomic, retain) PAAlert *startLocationOfAlert;

@end
