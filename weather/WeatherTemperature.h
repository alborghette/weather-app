//
//  WeatherTemperature.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherTemperature : NSObject

@property NSNumber *temperature;
@property NSNumber *maxTemp;
@property NSNumber *minTemp;
@property NSInteger humidity;

- (instancetype)initWithJson:(NSDictionary *)json;

@end
