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
#import "WeekWeatherCollectionViewCell.h"

@interface CityWeatherViewController ()

@property CityWeather *cityWeather;

@end

@implementation CityWeatherViewController

NSString *const kWeekWeatherCellIdentifier = @"WeekWeatherCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
	self.weekWeatherCollection.dataSource = self;
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
			weakSelf.cityWeather = cityWeather;
			[weakSelf setupUIWithAPIInfo];
			[weakSelf.weekWeatherCollection reloadData];
			[SVProgressHUD dismiss];
		});
		
	} failure:^(NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[SVProgressHUD dismiss];
		});
	}];
}

- (void)setupUIWithAPIInfo {
	self.userCity.text = self.cityWeather.city.name;
	
	if (self.cityWeather.temperatures.firstObject != nil) {
		self.temperatureCity.text = [NSString stringWithFormat:NSLocalizedString(@"celsius-degrees", nil), [self.cityWeather.temperatures.firstObject.temperature stringValue]];
		self.maxTemperature.text = [NSString stringWithFormat:NSLocalizedString(@"celsius-degrees", nil), [self.cityWeather.temperatures.firstObject.maxTemp stringValue]];
		self.minTemperature.text =[NSString stringWithFormat:NSLocalizedString(@"celsius-degrees", nil), [self.cityWeather.temperatures.firstObject.minTemp stringValue]];
		self.humidity.text = [NSString stringWithFormat:@"%ld%%", self.cityWeather.temperatures.firstObject.humidity];
	}
	
	if (self.cityWeather.weathers.firstObject != nil) {
		[self.weatherIcon sd_setImageWithURL: [NSURL URLWithString: self.cityWeather.weathers.firstObject.getIconUrl] placeholderImage: [UIImage imageNamed: @"weather-icon-placeholder"]];
		self.weatherDescription.text = self.cityWeather.weathers.firstObject.descriptionWeather;
	}
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	if (self.cityWeather != nil) {
		return self.cityWeather.weathers.count;
	}
	
	return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	WeekWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kWeekWeatherCellIdentifier forIndexPath:indexPath];
	[cell bind:self.cityWeather.temperatures[indexPath.row].temperature andWeatherIcon:self.cityWeather.weathers[indexPath.row].getIconUrl];
	
	return cell;
}

@end
