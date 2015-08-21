//
//  StaticTableViewController.m
//  Verve
//
//  Created by Verve on 8/20/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StaticTableViewController : UITableViewController


@end

@implementation StaticTableViewController : UITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.EventsTableObject = [[UITableView alloc] init];
    self.EventsTableObject.delegate = self; //[[self eventsTableView] setDelegate:self];
    self.EventsTableObject.dataSource = self;
    
    sectionsArray = [[NSMutableArray alloc] init];
    /*[sectionsArray addObject:[NSString stringWithFormat:@"Events Near Me"]];
     [sectionsArray addObject:[NSString stringWithFormat:@"Map"]];*/
    [sectionsArray addObject:[NSString stringWithFormat:@"Events Table"]];
    
    rowArray = [[NSMutableArray alloc] init];
    [rowArray addObject:[NSString stringWithFormat:@"Host an Event"]];
    [rowArray addObject:[NSString stringWithFormat:@"My Events"]];
    [rowArray addObject:[NSString stringWithFormat:@"My Invitations"]];
    [rowArray addObject:[NSString stringWithFormat:@"Event Album"]];
    //self.eventsNearMeCell.textLabel.text = @"Events Near Me";
    //self.eventsNearMeCell.accessoryType
    //self.mapCell.
    [[self EventsTableObject]reloadData];
    
    self.HostEventCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    self.HostEventCell.textLabel.textColor = (__bridge UIColor *)([UIColor blackColor].CGColor);
    self.HostEventCell.textLabel.text = @"Host an Event";
    self.MyEventsCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:1 inSection:0]];
    self.MyEventsCell.textLabel.text = @"My Events";
    self.MyInvitationsCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:2 inSection:0]];
    self.MyInvitationsCell.textLabel.text = @"My Invitations";
    self.EventAlbumCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:3 inSection:0]];
    self.EventAlbumCell.textLabel.text = @"Event Album";
}
@end