//
//  Login.m
//  Verve2
//
//  Created by Verve on 9/12/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "Login.h"
#import "User.h"
#import "Database.h"
#import "Homepage.h"

@implementation Login
@synthesize UsernameField, PasswordField;

User *currentUser;
Database *userDB;
- (void)viewDidLoad {
    [super viewDidLoad];

    //self.UsernameField.delegate = self;
    //self.PasswordField.delegate = self;
    
    [[self LoginView] reloadInputViews];
}
- (IBAction)RegisterUser:(id)sender {
}

- (IBAction)LoginUser:(id)sender {
    NSString *userName = userName = @"Luvanmusiq";//UsernameField.text;//[[NSString alloc] init];
    NSString *userPassword = userPassword = @"life713";//PasswordField.text;//[[NSString alloc] init];

    currentUser = [[User alloc] init];
    userDB = [[Database alloc] init];
    currentUser = [userDB getUserInfoWithUsername: userName withPassword: userPassword];
    //[BOOL shouldPerformSegueWithIdentifier:identifier sender:sender];
    if (currentUser == NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Authetification Failed" message:@"Please check your Identifications" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [self performSegueWithIdentifier:@"Homepage" sender:self];
    }
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    BOOL segueShouldOccur;
    NSString *userName = userName = UsernameField.text;//[[NSString alloc] init];
    NSString *userPassword = userPassword = PasswordField.text;//[[NSString alloc] init];

    if ([identifier isEqualToString:@"Homepage"]) {
        // perform your computation to determine whether segue should occur
        currentUser = [userDB getUserInfoWithUsername: userName withPassword: userPassword];
        if(currentUser == NULL)
            segueShouldOccur = NO; // you determine this
        if (!segueShouldOccur) {
            UIAlertView *notPermitted = [[UIAlertView alloc]
                                         initWithTitle:@"Alert"
                                         message:@"Segue not permitted (better message here)"
                                         delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
            
            // shows alert to user
            [notPermitted show];
            
            // prevent segue from occurring
            return NO;
        }
    }
    
    // by default perform the segue transition
    return YES;
}
@end
