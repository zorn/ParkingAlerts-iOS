//
//  AlertMapViewController.h
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class PACar;

@interface AlertMapViewController : UIViewController

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (retain) PACar *userCar;


@end
