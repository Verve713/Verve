//
//  ViewController.h
//  Verve
//
//  Created by Verve on 8/2/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) IBOutlet UIImageView *ProfileImageView1;
@property (nonatomic, strong) IBOutlet UIImageView *ProfileImageView2;
@property (nonatomic, strong) IBOutlet UITableView *EventsTableObject;
@property (nonatomic,retain) NSMutableArray *EventsTableData;
@property (nonatomic, strong) IBOutlet UITableViewCell *HostEventCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *MyEventsCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *MyInvitationsCell;
@property (nonatomic, strong) IBOutlet UITableViewCell *EventAlbumCell;

+ (UIImage *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
//+ (NSIndexPath *)indexPathForRow:(NSInteger)row
//                       inSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;
/*@property (weak, nonatomic) IBOutlet UITableViewCell *eventsNearMeCell;*/
//@property (weak, nonatomic) IBOutlet MKMapView *eventMapView;
/*@property (strong, nonatomic) IBOutlet UITableViewCell *mapCell;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;*/

@end

