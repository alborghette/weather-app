//
//  WeekWeatherCollectionViewCell.m
//  weather
//
//  Created by Murilo Alborghette on 27/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "WeekWeatherCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation WeekWeatherCollectionViewCell

- (void)bind: (NSNumber *)temperature andWeatherIcon: (NSString *)weatherIcon {
	[self.temperature setText: [NSString stringWithFormat:NSLocalizedString(@"celsius-degrees", nil), temperature.stringValue]];
	[self.weatherIcon sd_setImageWithURL:[NSURL URLWithString:weatherIcon] placeholderImage:[UIImage imageNamed:@"weather-icon-placeholder"]];
}

@end
