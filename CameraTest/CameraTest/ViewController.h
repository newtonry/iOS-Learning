//
//  ViewController.h
//  CameraTest
//
//  Created by Ryan Newton on 1/4/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)makePhoto:(UIButton *)sender;

@end
