//
//  StaticTableViewController.h
//  Verve
//
//  Created by Verve on 8/20/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface StaticTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) IBOutlet UIImageView *ProfileImageView1;
@property (nonatomic, strong) IBOutlet UIImageView *ProfileImageView2;
@property (nonatomic, strong) IBOutlet UITableView *EventsTableObject;
@property (nonatomic,retain) NSMutableArray *EventsTableData;
@property (nonatomic, strong) IBOutlet UITableViewCell *HostEventCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *MyEventsCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *MyInvitationsCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *EventAlbumCell;

@end