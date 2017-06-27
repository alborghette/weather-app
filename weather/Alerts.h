//
//  Alerts.h
//  weather
//
//  Created by Murilo Alborghette on 26/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alerts : NSObject

+ (void) showAlertWith:(NSString *)message andTitle:(NSString *)title inViewController:(UIViewController *)viewController;
+ (void) showAlertWith:(NSString *)message inViewController:(UIViewController *)viewController;

@end
