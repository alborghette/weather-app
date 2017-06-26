//
//  MainViewController.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityWeatherViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface UserLocationWeatherViewController : CityWeatherViewController <CLLocationManagerDelegate>

@end
