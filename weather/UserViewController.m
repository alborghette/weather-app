//
//  UserViewController.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "UserViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "LoginViewController.h"
#import "Alerts.h"

@interface UserViewController ()

@end

@implementation UserViewController

NSString *const kLoginViewControllerSegue = @"loginViewControllerSegue";

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"profile", nil);
	[self.logoutButton setTitle:NSLocalizedString(@"logout", nil) forState:UIControlStateNormal];
	
	self.profilePicture.layer.cornerRadius	= self.profilePicture.frame.size.height/2;
	self.profilePicture.layer.masksToBounds = YES;
	self.profilePicture.layer.borderWidth	= 0;
	
	[self requestUserInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestUserInfo {
	if ([FBSDKAccessToken currentAccessToken]) {
		
		__weak UserViewController *weakSelf = self;
		
		[SVProgressHUD show];
		[[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{ @"fields" : @"id,name,picture.width(100).height(100)"}]startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
			
			[SVProgressHUD dismiss];
			if (!error) {
				NSString *imageStringOfLoginUser = [[[result valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"];
				weakSelf.userName.text = [result valueForKey:@"name"];
				[weakSelf.profilePicture sd_setImageWithURL: [NSURL URLWithString: imageStringOfLoginUser]];
			} else {
				[Alerts showAlertWith:NSLocalizedString(@"request-error", nil) inViewController:self];
			}
		}];
	}
}

- (IBAction)logout:(id)sender {
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	[loginManager logOut];
	
	
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
	[self presentViewController:loginViewController animated:YES completion:nil];
	
}
@end
