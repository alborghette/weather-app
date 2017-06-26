//
//  LondonWeatherViewController.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "LondonWeatherViewController.h"

@interface LondonWeatherViewController ()

@end

@implementation LondonWeatherViewController

static double const kLondonLatitude  = 51.509865;
static double const kLondonLongitude = -0.118092;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Londres";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self requestCityWeatherFromLatitude:kLondonLatitude  andLongitude:kLondonLongitude];
}

@end
