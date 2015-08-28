//
//  Homepage.h
//  Verve2
//
//  Created by Verve on 8/24/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Homepage : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *EventsTableObject;
@property (nonatomic,retain) NSMutableArray *EventsTableData;
@property (strong, nonatomic) IBOutlet UITableViewCell *mapCell;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UITableViewCell *HostEventCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *MyEventsCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *MyInvitationsCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *EventAlbumCell;

+ (NSIndexPath *)indexPathForRow:(NSInteger)row
                       inSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
@end