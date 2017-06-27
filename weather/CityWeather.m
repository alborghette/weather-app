//
//  WeatherCity.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "CityWeather.h"

@implementation CityWeather

static NSString * const kList		 = @"list";
static NSString * const kTemperature = @"main";
static NSString * const kWeather	 = @"weather";
static NSString * const kCityKey	 = @"city";

- (instancetype)initWithDictionary: (NSDictionary *)json {
	
	self = [super init];
	
	if (self != nil) {
		
		if (json[kList] != nil && [json[kList] isKindOfClass:[NSArray class]]) {
			NSMutableArray<WeatherTemperature *> *temperatures = [[NSMutableArray alloc] init];
			NSMutableArray<WeatherCondition *> *weathers	   = [[NSMutableArray alloc] init];
			NSMutableArray<NSString *> *dates				   = [[NSMutableArray alloc] init];
			
			for (NSDictionary *jsonList in json[kList]) {
				
				[temperatures addObject: [[WeatherTemperature alloc] initWithJson: jsonList[kTemperature]]];
				
				if (jsonList[kWeather] != nil && [jsonList[kWeather] isKindOfClass:[NSArray class]]) {
					NSArray *weather = jsonList[kWeather];
					[weathers addObject: [[WeatherCondition alloc] initWithJson: weather.firstObject]];
				}
				
			}
			
			self.temperatures = temperatures;
			self.weathers	  = weathers;
		}
		
		if (json[kCityKey] != nil) {
			self.city = [[City alloc] initWithJson:json[kCityKey]];
		}
		
	}
	
	return self;
	
}

@end
