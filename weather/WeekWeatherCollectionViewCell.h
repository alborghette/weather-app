//
//  WeekWeatherCollectionViewCell.h
//  weather
//
//  Created by Murilo Alborghette on 27/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekWeatherCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

- (void)bind: (NSNumber *)temperature andWeatherIcon: (NSString *)weatherIcon;

@end
