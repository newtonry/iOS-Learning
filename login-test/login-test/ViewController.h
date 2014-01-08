//
//  ViewController.h
//  login-test
//
//  Created by Ryan Newton on 1/7/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)loginClicked:(id)sender;
- (IBAction)backgroundClick:(id)sender;

@end
