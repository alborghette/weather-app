//
//  WeatherCity.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherCondition.h"
#import "WeatherTemperature.h"
#import "City.h"

@interface CityWeather : NSObject

@property City *city;
@property NSArray<WeatherTemperature *> *temperatures;
@property NSArray<WeatherCondition *> *weathers;
@property NSArray<NSString *> *dates;

- (instancetype)initWithDictionary: (NSDictionary *)json;

@end
