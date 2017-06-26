//
//  WeatherCondition.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "WeatherCondition.h"

@implementation WeatherCondition

static NSString * const kBaseUrlIcon = @"http://openweathermap.org/img/w/%@.png";

static NSString * const kIdentifierKey	= @"id";
static NSString * const kDescriptionKey = @"description";
static NSString * const kIconKey		= @"icon";

- (instancetype)initWithJson:(NSDictionary *)json {
	self = [super init];
	
	if (self) {
		int identifier = -1;
		if (json[kIdentifierKey] != nil) {
			identifier = [json[kIdentifierKey] intValue];
		}
		
		
		NSString *descriptionWeather = nil;
		if (json[kDescriptionKey] != nil) {
			descriptionWeather = json[kDescriptionKey];
		}
		
		NSString *icon = nil;
		if (json[kIconKey] != nil) {
			icon = json[kIconKey];
		}
		
		self.identifier			= identifier;
		self.descriptionWeather	= descriptionWeather;
		self.icon = icon;
		
	}
	
	return self;
}

- (NSString *)getIconUrl {
	return [NSString stringWithFormat: kBaseUrlIcon, self.icon];
}

@end
