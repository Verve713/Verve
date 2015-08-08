//
//  ViewController.m
//  Verve
//
//  Created by Verve on 8/2/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "ViewController.h"
#import "UIKit\UIKit.h"
//import <MapKit>

@interface ViewController ()

@end

@implementation ViewController
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

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //for image 1
    
    self.ProfileImageView1.layer.cornerRadius = self.ProfileImageView1.frame.size.width/2;
    self.ProfileImageView1.layer.borderWidth = 2.0f;
    self.ProfileImageView1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.ProfileImageView1.clipsToBounds = YES;
    
    NSIndexPath *myIP = [[NSIndexPath alloc] indexPathForRow:0 inSection:0];
    self.HostedEventsCell = [ViewController tableView:_EventsTable cellForRowAtIndexPath: myIP];
    
    //_ProfileImageView1.image = [ViewController imageWithImage:_ProfileImageView1.image scaledToSize:CGSizeMake(50.0, 50.0)];
    
    //UITableView *tableView;
    
    //tableView.numberOfSections = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
