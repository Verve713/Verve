//
//  User.m
//  Verve2
//
//  Created by Verve on 9/12/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize userID, userName, userPassword, userEmail, userFirstName, userLastName;//, userPhoto;

- (void)dealloc
{
    self.userID = nil;
    self.userName = nil;
    self.userPassword = nil;
    self.userEmail = nil;
    self.userFirstName = nil;
    self.userLastName = nil;
    //self.userPhoto = nil;
    //[super dealloc]; //(provided by the compiler)
}
@end
