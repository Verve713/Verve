//
//  User.h
//  Verve2
//
//  Created by Verve on 9/12/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString *userID;
    NSString *userName;
    NSString *userPassword;
    NSString *userEmail;
    NSString *userFirstName;
    NSString *userLastName;
    NSString *userPhoto;
}

@property (copy) NSString *userID;
@property (copy) NSString *userName;
@property (copy) NSString *userPassword;
@property (copy) NSString *userEmail;
@property (copy) NSString *userFirstName;
@property (copy) NSString *userLastName;
@property (copy) NSData *userPhoto;
@end
