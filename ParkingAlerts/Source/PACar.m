//
//  PACar.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import "PACar.h"
#import "PALocation.h"

#define PACarEntityName @"Car"

@implementation PACar
@dynamic location;

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)context
{
    NSParameterAssert(context);
    return [NSEntityDescription insertNewObjectForEntityForName:PACarEntityName inManagedObjectContext:context];
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription entityForName:PACarEntityName inManagedObjectContext:context];
}


@end
