//
//  MainViewController.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "UserLocationWeatherViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "WeatherAPI.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface UserLocationWeatherViewController ()

@property CLLocationManager *locationManager;

@end

@implementation UserLocationWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"your-location", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self requestUserLocation];
}

- (void)requestUserLocation {
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
	
	if (([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
		[self.locationManager requestWhenInUseAuthorization];
	}
	
	self.locationManager.distanceFilter  = kCLDistanceFilterNone;
	self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
	[self.locationManager startUpdatingLocation];
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
	CLLocation *location = locations.lastObject;
	
	CLLocationDegrees lat = location.coordinate.latitude;
	CLLocationDegrees lon = location.coordinate.longitude;
	[self.locationManager stopUpdatingLocation];
	self.locationManager.delegate = nil;
	
	[self requestCityWeatherFromLatitude:lat andLongitude:lon];
}





@end
