//
//  WeatherAPI.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "WeatherAPI.h"

@implementation WeatherAPI

static NSString * const kBaseUrl	  = @"http://api.openweathermap.org/data/2.5/forecast";
static NSString * const kApiKey		  = @"ef02667caaeedd91ea7fcec3a06a59cd";
static NSString * const kApiLang	  = @"pt";
static NSString * const kApiUnits	  = @"metric";
static NSString * const kApiCountDays = @"7";

+ (void)getWeatherFromLatitude: (double)latitude Longitude: (double)longitude success: (void(^)(CityWeather *cityWeather))completion failure: (void(^)(NSError *error))errorCallback {
	
	NSURLSession *session = [NSURLSession sharedSession];
	NSURL *url = [NSURL URLWithString:[kBaseUrl stringByAppendingFormat:@"?appid=%@&lat=%f&lon=%f&units=%@&lang=%@&cnt=%@", kApiKey, latitude, longitude, kApiUnits, kApiLang, kApiCountDays]];
	
	NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			errorCallback(error);
		} else {
			
			NSError *error;
			NSDictionary *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
			
			if (error) {
				errorCallback(error);
			} else {
				CityWeather *cityWeather = [[CityWeather alloc] initWithDictionary:json];
				completion(cityWeather);
			}
		}
	}];
	
	[dataTask resume];
}

@end
