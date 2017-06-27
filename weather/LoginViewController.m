//
//  ViewController.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "LoginViewController.h"
#import "SVProgressHUD.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Alerts.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

NSString *const kMainViewControllerSegueIdentifier = @"mainViewControllerSegue";
NSString *const kFacebookProfilePermission		   = @"public_profile";

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.loginButton setTitle:NSLocalizedString(@"enter-with-facebook", nil) forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if ([FBSDKAccessToken currentAccessToken]) {
		[self performSegueWithIdentifier:kMainViewControllerSegueIdentifier sender:self];
	}
}



- (IBAction)loginButtonTouched {
	
	__weak LoginViewController *weakSelf = self;
	
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	[loginManager logInWithReadPermissions: @[kFacebookProfilePermission]
						fromViewController:self
								   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
									
									   if (error) {
										   [Alerts showAlertWith:NSLocalizedString(@"request-error", nil) inViewController:weakSelf];
									   } else if (result.isCancelled) {
										   [Alerts showAlertWith:NSLocalizedString(@"login-denied", nil) inViewController:weakSelf];
									   } else {
										   [weakSelf performSegueWithIdentifier:kMainViewControllerSegueIdentifier sender:self];
									   }
									   
								   }];
	
}
@end
