//
//  ViewController.m
//  Verve
//
//  Created by Verve on 8/2/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //for image 1
    
    self.ProfileImageView1.layer.cornerRadius = self.ProfileImageView1.frame.size.width/2;
    self.ProfileImageView1.layer.borderWidth = 3.8f;
    self.ProfileImageView1.layer.borderColor = [UIColor blackColor].CGColor;
    self.ProfileImageView1.clipsToBounds = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
