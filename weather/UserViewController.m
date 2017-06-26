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

@interface UserViewController ()

@end

@implementation UserViewController

NSString *const kLoginViewControllerSegue = @"loginViewControllerSegue";

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Perfil";
	
	if ([FBSDKAccessToken currentAccessToken]) {
		
		__weak UserViewController *weakSelf = self;
		
		[[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{ @"fields" : @"id,name,picture.width(100).height(100)"}]startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
			if (!error) {
				NSString *imageStringOfLoginUser = [[[result valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"];
				weakSelf.userName.text = [result valueForKey:@"name"];
				[weakSelf.profilePicture sd_setImageWithURL: [NSURL URLWithString: imageStringOfLoginUser]];
			}
		}];
	}
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender {
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	[loginManager logOut];
	[self.navigationController popToRootViewControllerAnimated:true];
	
}
@end
