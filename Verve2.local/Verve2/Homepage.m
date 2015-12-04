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
#import <MapKit/MapKit.h>
#import <sys/sysctl.h>

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
    
    self.ProfilePicture.layer.borderWidth = 2.0f;
    self.ProfilePicture.layer.borderColor = [UIColor whiteColor].CGColor;
    self.ProfilePicture.clipsToBounds = YES;
    
    [[self EventsTableObject]reloadData];
    
    //Get list of running processes
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL ,0};
	 size_t miblen = 4;
	 size_t size;
	 int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
	 struct kinfo_proc * process = NULL;
	 struct kinfo_proc * newprocess = NULL;
	 do
	 {
    	 size += size / 10;
    	 newprocess = realloc(process, size);
    	 if (!newprocess)
    	 {
        	 if (process)
        	 {
            	 free(process);
            	 process = NULL;
       	 }
     	    //return nil;
	     }

    	 process = newprocess;
    	 st = sysctl(mib, miblen, process, &size, NULL, 0);
	 } while (st == -1 && errno == ENOMEM);
    
    if (st == 0) {
        if (size % sizeof(struct kinfo_proc) == 0) {
            int nprocess = size / sizeof(struct kinfo_proc);
            
            if (nprocess) {
                NSMutableArray * array = [[NSMutableArray alloc] init];
                
                for (int i = nprocess - 1; i >= 0; i--) {
                    NSString *processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString *processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    
                    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processName, nil]
                                                                       forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessName", nil]];
                    //[processID release];
                    //[processName release];
                    [array addObject:dict];
                    //[dict release];
                }
                
                free(process);
                //return array;
            }
        }
    }

    
    /*self.HostEventCell = [self tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    self.HostEventCell.textLabel.textColor = (__bridge UIColor *)([UIColor blackColor].CGColor);
    self.HostEventCell.textLabel.text = @"Host an Event";
    self.MyEventsCell = [Homepage tableView:_EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:1 inSection:0]];
    self.MyEventsCell.textLabel.text = @"My Events";
    self.MyInvitationsCell = [Homepage tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:2 inSection:0]];
    self.MyInvitationsCell.textLabel.text = @"My Invitations";
    self.EventAlbumCell = [Homepage tableView:EventsTableObject cellForRowAtIndexPath: [NSIndexPath indexPathForRow:3 inSection:0]];
    self.EventAlbumCell.textLabel.text = @"Event Album";*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}*/


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
