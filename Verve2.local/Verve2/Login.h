//
//  Login.h
//  Verve2
//
//  Created by Verve on 9/12/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface Login : UIViewController
@property (strong, nonatomic) IBOutlet UIView *LoginView;
@property (strong, nonatomic) IBOutlet UITextField *UsernameField;
@property (strong, nonatomic) IBOutlet UITextField *PasswordField;
@property (strong, nonatomic) IBOutlet UIButton *RegisterButton;
@property (strong, nonatomic) IBOutlet UIButton *LoginButton;

- (IBAction)RegisterUser:(id)sender;
- (IBAction)LoginUser:(id)sender;
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;

@end
