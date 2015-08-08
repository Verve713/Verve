//
//  ViewController.h
//  Verve
//
//  Created by Verve on 8/2/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *ProfileImageView1;
@property (nonatomic, strong) IBOutlet UIImageView *ProfileImageView2;
@property (nonatomic, strong) IBOutlet UITableView *EventsTable;
@property (nonatomic, strong) IBOutlet UITableViewCell *HostedEventsCell;

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

