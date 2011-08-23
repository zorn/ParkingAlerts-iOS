//
//  AlertMapViewController.m
//  ParkingAlerts
//
//  Created by Michael Zornek on 8/23/11.
//  Copyright 2011 Clickable Bliss. All rights reserved.
//

#import "AlertMapViewController.h"

@implementation AlertMapViewController

- (id)init
{
	if (self = [super initWithNibName:@"AlertMapView" bundle:nil]) {
		
	}
	return self;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
