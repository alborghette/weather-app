//
//  CityWeatherViewController.m
//  weather
//
//  Created by Murilo Alborghette on 26/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "CityWeatherViewController.h"
#import "WeatherAPI.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface CityWeatherViewController ()

@end

@implementation CityWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestCityWeatherFromLatitude: (double)latitude andLongitude: (double)longitude {
	[SVProgressHUD show];
	
	__weak CityWeatherViewController *weakSelf = self;
	
	[WeatherAPI getWeatherFromLatitude:latitude Longitude:longitude success:^(CityWeather * cityWeather) {
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[weakSelf setupUIWithAPIInfo: cityWeather];
			[SVProgressHUD dismiss];
		});
		
	} failure:^(NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[SVProgressHUD dismiss];
		});
	}];
}

- (void)setupUIWithAPIInfo: (CityWeather *)cityWeather {
	self.userCity.text = cityWeather.city.name;
	
	if (cityWeather.temperatures.firstObject != nil) {
		self.temperatureCity.text = [[cityWeather.temperatures.firstObject.temperature stringValue] stringByAppendingString:@" ºC"];
		self.maxTemperature.text = [[cityWeather.temperatures.firstObject.maxTemp stringValue] stringByAppendingString:@" ºC"];
		self.minTemperature.text = [[cityWeather.temperatures.firstObject.minTemp stringValue] stringByAppendingString:@" ºC"];
		self.humidity.text = [NSString stringWithFormat:@"%ld%%", cityWeather.temperatures.firstObject.humidity];
	}
	
	if (cityWeather.weathers.firstObject != nil) {
		[self.weatherIcon sd_setImageWithURL: [NSURL URLWithString: cityWeather.weathers.firstObject.getIconUrl] placeholderImage: [UIImage imageNamed: @"weather-icon-placeholder"]];
		self.weatherDescription.text = cityWeather.weathers.firstObject.descriptionWeather;
	}
}

@end
