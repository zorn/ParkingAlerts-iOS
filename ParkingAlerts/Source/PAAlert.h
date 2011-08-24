//
//  PAAlert.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PALocation;

@interface PAAlert : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate *endsOn;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *note;
@property (nonatomic, retain) NSString *sourceDescription;
@property (nonatomic, retain) NSString *sourceURL;
@property (nonatomic, retain) NSDate *startsOn;
@property (nonatomic, retain) PALocation *endLocation;
@property (nonatomic, retain) PALocation *startLocation;

@end
