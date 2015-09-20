//
//  Event.h
//  Verve2
//
//  Created by Verve on 9/6/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Event : NSObject
{
    NSString *eventID;
    NSString *eventName;
    NSString *eventLocation;
    NSString *eventDate;
    NSString *eventTime;
    NSString *eventType;
    NSString *eventHost;
    NSData *eventPhoto;
}

@property (copy) NSString *eventID;
@property (copy) NSString *eventName;
@property (copy) NSString *eventLocation;
@property (copy) NSString *eventDate;
@property (copy) NSString *eventTime;
@property (copy) NSString *eventType;
@property (copy) NSString *eventHost;
@property (copy) NSData *eventPhoto;
@end
