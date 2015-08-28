//
//  Homepage.m
//  Verve2
//
//  Created by Verve on 8/24/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "Homepage.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Homepage ()

@end

@implementation Homepage

@synthesize EventsTableData, EventsTableObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.EventsTableObject = [[UITableView alloc] init];
    self.EventsTableObject.delegate = self; //[[self eventsTableView] setDelegate:self];
    self.EventsTableObject.dataSource = self;
    
    [[self EventsTableObject]reloadData];
    
    self.HostEventCell = [tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    self.HostEventCell.textLabel.textColor = (__bridge UIColor *)([UIColor blackColor].CGColor);
    self.HostEventCell.textLabel.text = @"Host an Event";
    self.MyEventsCell = [Homepage tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:1 inSection:0]];
    self.MyEventsCell.textLabel.text = @"My Events";
    self.MyInvitationsCell = [Homepage tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:2 inSection:0]];
    self.MyInvitationsCell.textLabel.text = @"My Invitations";
    self.EventAlbumCell = [Homepage tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:3 inSection:0]];
    self.EventAlbumCell.textLabel.text = @"Event Album";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
