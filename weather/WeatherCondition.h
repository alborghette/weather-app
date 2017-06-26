//
//  WeatherCondition.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherCondition : NSObject

@property int identifier;
@property NSString *descriptionWeather;
@property NSString *icon;

- (instancetype)initWithJson:(NSDictionary *)json;
- (NSString *)getIconUrl;

@end
