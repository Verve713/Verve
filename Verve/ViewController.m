//
//  ViewController.m
//  Verve
//
//  Created by Verve on 8/2/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
{
    NSMutableArray *sectionsArray;
    NSMutableArray *rowArray;
    
}

@end


@implementation ViewController
@synthesize EventsTableData, EventsTableObject;
//Utilities
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/*+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *HostedEventsIdentifier = @"Hosted Events";//@"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HostedEventsIdentifier];
    //if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:HostedEventsIdentifier];
    //}
    //Region *region = [regions objectAtIndex:indexPath.section];
    //TimeZoneWrapper *timeZoneWrapper = [region.timeZoneWrappers objectAtIndex:indexPath.row];
    cell.textLabel.text = @"Hosted Events: ";
    
    
    return cell;
}*/

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [EventsTableData count];
    
}*/

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    cell.textLabel.text = [EventsTableData objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:@"geekPic.jpg"];
    
    return cell;
    
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //for image 1
    
    //self.ProfileImageView1.layer.cornerRadius = self.ProfileImageView1.frame.size.width/2;
    self.ProfileImageView1.layer.borderWidth = 2.0f;
    self.ProfileImageView1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.ProfileImageView1.clipsToBounds = YES;
    
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
    
    //[self.view bringSubviewToFront:<#(UIView *)#>]
    //[UIViewController tableView:EventsTableData numberOfRowsInSection:4];
    NSIndexPath *myIP = [NSIndexPath indexPathForRow:0 inSection:0];
    self.HostEventCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    self.HostEventCell.textLabel.textColor = (__bridge UIColor *)([UIColor blackColor].CGColor);
    self.HostEventCell.textLabel.text = @"Host an Event";
    self.MyEventsCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:1 inSection:0]];
    self.MyEventsCell.textLabel.text = @"My Events";
    self.MyInvitationsCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:2 inSection:0]];
    self.MyInvitationsCell.textLabel.text = @"My Invitations";
    self.EventAlbumCell = [ViewController tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:3 inSection:0]];
    self.EventAlbumCell.textLabel.text = @"Event Album";
    
    //_ProfileImageView1.image = [ViewController imageWithImage:_ProfileImageView1.image scaledToSize:CGSizeMake(50.0, 50.0)];
    
    //UITableView *tableView;
    
    //tableView.numberOfSections = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma eventsTableView datasource and delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0 || section == 1)
        return 1;
    else
        return 4; //return [rowArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil; //[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /*if (indexPath.section == 1) {
        //cell = self.mapCell;
    }
    
    else //if(!cell)
    {*/
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.textLabel.text = [rowArray objectAtIndex:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        //AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        //cell.textLabel.text = [delegate.rows objectAtIndex:indexPath.row];
    //}
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height;
    if (indexPath.section == 1)
        height = 170;
    else
        height = 44;
    
    return height;
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath  *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"indexpath is %ld", (long)indexPath.row);
    //selectedIndex = indexPath.row;
    //isSearching = YES;
    
    [self.eventsNearMeCell beginUpdates];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[detailarray objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.hidden = NO;
    
    [self.tableview endUpdates];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (isSearching && indexPath.row == selectedIndex)
    {
        
        return 77;
        
    }
    return 44;
 }*/

@end
