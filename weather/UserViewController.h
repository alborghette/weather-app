//
//  UserViewController.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)logout:(id)sender;
@end
