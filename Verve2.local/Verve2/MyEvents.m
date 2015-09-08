//
//  MyEventsTableViewController.m
//  Verve2
//
//  Created by Verve on 8/20/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "MyEvents.h"
#import "Database.h"
#import "Event.h"

@interface MyEvents ()

@end

NSMutableArray *myEventsArray;
NSMutableArray *sectionsArray;
NSMutableArray *rowsArray;
//NSString *verveDB = @"Verve.db";
Database *eventDB;
@implementation MyEvents
@synthesize eventsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    Event *event;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.eventsTableView = [[UITableView alloc] init];
    self.eventsTableView.delegate = self; //[[self eventsTableView] setDelegate:self];
    self.eventsTableView.dataSource = self;
    
    sectionsArray = [[NSMutableArray alloc] init];
    [sectionsArray addObject:[NSString stringWithFormat:@"Events Table"]];
    
    rowsArray = [[NSMutableArray alloc] init];
    
    //Populate myEventsArray
    //(void)populateEvents:(NSMutableArray *)eventArray forUser:(NSString *) userID
    eventDB = [[Database alloc] init];
    myEventsArray = [eventDB populateEventsForUser:@"2"];
    //NSInteger numRows = [tableView:myEventsArray numberOfRowsInSection:1]
    /*NSUInteger count = 0;
    for (id event in myEventsArray)
    {
        UITableViewCell *eventCell = [tableView:eventsTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:count inSection:0]];
        
        count++;
    }*/
    
    //NSString * dbPath = [eventDB getWritableDBPath];
    [[self eventsTableView]reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (void)populateEventsList:(
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [myEventsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    /*NSUInteger count = 0;
    for (id event in myEventsArray)
    {
        UITableViewCell *eventCell = [tableView:eventsTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:count inSection:0]];
        
        count++;
    }*/
    //for (id event in myEventsArray)
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"reuseIdentifier"];
    }
    
    Event *currentEvent = [myEventsArray objectAtIndex: indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = currentEvent.eventName;
    
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

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
