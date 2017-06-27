//
//  Alerts.m
//  weather
//
//  Created by Murilo Alborghette on 26/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "Alerts.h"

@implementation Alerts

+ (void) showAlertWith:(NSString *)message inViewController:(UIViewController *)viewController {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"attention", nil) message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"ok", nil) style:UIAlertActionStyleDefault handler:nil];
	[alert addAction:okAction];
	
	[viewController presentViewController:alert animated:YES completion:nil];
}

+ (void) showAlertWith:(NSString *)message andTitle:(NSString *)title inViewController:(UIViewController *)viewController {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"ok", nil) style:UIAlertActionStyleDefault handler:nil];
	[alert addAction:okAction];
	
	[viewController presentViewController:alert animated:YES completion:nil];
}

@end
