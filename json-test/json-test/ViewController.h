//
//  ViewController.h
//  json-test
//
//  Created by Ryan Newton on 1/2/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
//{
//    NSMutableData *_responseData;
//}

@property NSMutableData *responseData;
@property (weak, nonatomic) IBOutlet UITextField *firstLine;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;

@end
