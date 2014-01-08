//
//  ViewController.m
//  login-test
//
//  Created by Ryan Newton on 1/7/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtPassword, txtUsername;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (IBAction)loginClicked:(id)sender {
    
    
    NSLog([txtUsername text]);
    NSLog([txtPassword text]);
}

- (IBAction)backgroundClick:(id)sender {
}
@end
