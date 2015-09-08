//
//  MyEventsTableViewController.h
//  Verve2
//
//  Created by Verve on 8/20/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface MyEvents : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *eventsTableView;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
