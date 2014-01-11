//
//  ProfileViewController.h
//  instaphoto
//
//  Created by Ryan Newton on 1/9/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scrollView;
- (void) showZoomedProfile: (UIButton *) sender;
- (void) requestSuccessful;
@end
