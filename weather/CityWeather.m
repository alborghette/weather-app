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
static NSString * const kDate		 = @"dt_txt";
static NSString * const kCityKey	 = @"city";

- (instancetype)initWithDictionary: (NSDictionary *)json {
	
	self = [super init];
	
	if (self != nil) {
		
		NSDateFormatter *originFormat = [[NSDateFormatter alloc] init];
		[originFormat setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
		[originFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
		
		NSDateFormatter *toFormat = [[NSDateFormatter alloc] init];
		[toFormat setDateFormat:@"dd"];
		[toFormat setTimeZone:[NSTimeZone localTimeZone]];
		
		
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
				
				NSDate *dateAndHour = [originFormat dateFromString: jsonList[kDate]];
				[dates addObject: [toFormat stringFromDate:dateAndHour]];
				
			}
			
			self.temperatures = temperatures;
			self.weathers	  = weathers;
			self.dates		  = dates;
		}
		
		if (json[kCityKey] != nil) {
			self.city = [[City alloc] initWithJson:json[kCityKey]];
		}
		
	}
	
	return self;
	
}

@end
