//
//  WeatherTemperature.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "WeatherTemperature.h"

@implementation WeatherTemperature

static NSString * const kTemperatureKey	   = @"temp";
static NSString * const kMaxTemperatureKey = @"temp_max";
static NSString * const kMinTemperatureKey = @"temp_min";
static NSString * const kHumidityKey	   = @"humidity";

- (instancetype)initWithJson:(NSDictionary *)json {
	self = [super init];
	
	if (self) {
		NSNumber *temperature = nil;
		if (json[kTemperatureKey] != nil) {
			temperature = [NSNumber numberWithDouble: [json[kTemperatureKey] doubleValue]];
		}
		
		NSNumber *maxTemperature = nil;
		if (json[kMaxTemperatureKey] != nil) {
			maxTemperature = [NSNumber numberWithDouble: [json[kMaxTemperatureKey] doubleValue]];
		}
		
		NSNumber *minTemperature = nil;
		if (json[kMinTemperatureKey] != nil) {
			minTemperature = [NSNumber numberWithDouble: [json[kMinTemperatureKey] doubleValue]];
		}
		
		NSInteger humidity = -1;
		if (json[kHumidityKey] != nil) {
			humidity = [json[kHumidityKey] intValue];
		}
		
		self.temperature = temperature;
		self.maxTemp	 = maxTemperature;
		self.minTemp	 = minTemperature;
		self.humidity	 = humidity;
	}
	
	return self;
}

@end
