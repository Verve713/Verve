//
//  DatabaseController.h
//  Verve2
//
//  Created by Verve on 8/29/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "User.h"

@interface Database : NSObject

@property (weak, nonatomic) IBOutlet UITextField *username;


@property (weak, nonatomic) IBOutlet UITextField *email;


- (IBAction)view:(id)sender;

- (IBAction)deleteName:(id)sender;

- (IBAction)addName:(id)sender;

- (IBAction)update:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *listNames;

- (NSString *) getWritableDBPath;


@property (weak, nonatomic) IBOutlet UITextField *ider;
//- (void)populateEvents:(NSMutableArray *)eventArray forUser:(NSString *) userID;
- (User *)getUserInfoWithUsername:(NSString *) userName withPassword:(NSString *) userPassword;
- (NSMutableArray *)populateEventsForUser:(NSString *) userID;

@end
