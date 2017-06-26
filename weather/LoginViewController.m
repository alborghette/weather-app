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

@interface LoginViewController ()


@end

@implementation LoginViewController

NSString *const kMainViewControllerSegueIdentifier = @"mainViewControllerSegue";
NSString *const kFacebookProfilePermission		   = @"public_profile";

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([FBSDKAccessToken currentAccessToken]) {
		[self performSegueWithIdentifier:kMainViewControllerSegueIdentifier sender:self];
	}
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) showAlertWith:(NSString *)message {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Atenção" message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
	[alert addAction:okAction];
	
	[self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)loginButtonTouched {
	
	__weak LoginViewController *weakSelf = self;
	
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	[loginManager logInWithReadPermissions: @[kFacebookProfilePermission]
						fromViewController:self
								   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
									
									   if (error) {
										   [weakSelf showAlertWith:@"Ocorreu algum problema na operação."];
									   } else if (result.isCancelled) {
										   [weakSelf showAlertWith:@"Que pena, sem seu login não conseguimos ir para a próxima etapa."];
									   } else {
										   
										   [weakSelf performSegueWithIdentifier:kMainViewControllerSegueIdentifier sender:self];
									   }
									   
								   }];
	
}
@end
