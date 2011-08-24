//
//  PACar.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PALocation;

@interface PACar : NSManagedObject {
@private
}
@property (nonatomic, retain) PALocation *location;

@end
