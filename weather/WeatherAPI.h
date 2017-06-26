//
//  WeatherAPI.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityWeather.h"

@interface WeatherAPI : NSObject

+ (void)getWeatherFromLatitude: (double)latitude Longitude: (double)longitude success: (void(^)(CityWeather *cityWeather))completion failure: (void(^)(NSError *error))errorCallback;

@end
