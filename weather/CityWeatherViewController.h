//
//  CityWeatherViewController.h
//  weather
//
//  Created by Murilo Alborghette on 26/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityWeatherViewController : UIViewController <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *userCity;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *temperatureCity;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperature;
@property (weak, nonatomic) IBOutlet UILabel *minTemperature;

@property (weak, nonatomic) IBOutlet UICollectionView *weekWeatherCollection;

- (void)requestCityWeatherFromLatitude: (double)latitude andLongitude: (double)longitude;

@end
