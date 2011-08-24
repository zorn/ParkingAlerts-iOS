//
//  AlertMapViewController.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "AlertMapViewController.h"
#import "PALocation.h"
#import "PACar.h"

@implementation AlertMapViewController

- (id)init
{
	if (self = [super initWithNibName:@"AlertMapView" bundle:nil]) {
		
	}
	return self;
}

@synthesize mapView=_mapView;
@synthesize userCar=_userCar;

- (void)dealloc {
    [_mapView release];
    [_userCar release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView addAnnotation:self.userCar.location];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Action methods

- (void)moreInfoForCarLocation:(id)sender
{
    NSLog(@"moreInfoForCarLocation");
}

#pragma mark Map View Delegate methods

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }

    static NSString *annotationViewID = @"PALocationPinAnnotationView";
    NSLog(@"annotation, %@", annotation);
    if ([annotation isKindOfClass:[PALocation class]]) {
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
        
        if (!pinView) {
            pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewID] autorelease];
            pinView.pinColor = MKPinAnnotationColorGreen;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            pinView.draggable = YES;
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(moreInfoForCarLocation:) forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    
    return nil;
}

@end
