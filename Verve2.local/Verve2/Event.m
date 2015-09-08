//
//  Event.m
//  Verve2
//
//  Created by Verve on 9/6/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "Event.h"

@implementation Event
@synthesize eventID,eventName,eventHost,eventLocation;
- (void)dealloc
{
    self.eventID = nil;
    self.eventName = nil;
    self.eventLocation = nil;
    self.eventDate = nil;
    self.eventTime = nil;
    self.eventType = nil;
    self.eventHost = nil;
    //[super dealloc]; //(provided by the compiler)
}
@end
