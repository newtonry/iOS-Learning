//
//  ViewController.m
//  json-test
//
//  Created by Ryan Newton on 1/2/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "ViewController.h"
#import "Look.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@property NSMutableArray *looks;

@end


@implementation ViewController

@synthesize firstLine;
@synthesize myImage;

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[_responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    NSLog(@"%@",res[@"image"]);
    
    
    // show all values
//    for(id key in res) {
//        
//        id value = [res objectForKey:key];
//        
//        NSString *keyAsString = (NSString *)key;
//        NSString *valueAsString = (NSString *)value;
//        
////        NSLog(@"key: %@", keyAsString);
////        NSLog(@"value: %@", valueAsString);
//        
////        NSLog(@"look: %@", myLook);
//        
//    }
    
    NSString *imageUrl = @"https://clothes-consensus.s3.amazonaws.com/uploads/look/image/4/thumb_beerklok-yellow.png";
    Look *myLook = [Look getLookById:2];

    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    
//    myImage.image = [UIImage imageWithData:imageData];
    
    [myImage setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    
//        NSLog(@"The ID is: %@", [res objectForKey:@"id"]);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create the request.

    NSLog(@"viewdidload");
    
    Look *myLook = [Look getLookById:4];
    


    [myImage setImageWithURL:[NSURL URLWithString:myLook.thumb]];

//    NSLog(@"%@",myLook.look_id);
    NSString *message = [NSString stringWithFormat:@"Look id %d",[myLook.look_id intValue]];
    
    [firstLine setText:message];
    
    
//
//    
//    
//    
//    _responseData = [NSMutableData data];
//    NSURLRequest *request = [NSURLRequest requestWithURL:
//                             [NSURL URLWithString:@"http://localhost:3000/looks/4"]];
//    [[NSURLConnection alloc] initWithRequest:request delegate:self];
//
//    request = [NSURLRequest requestWithURL:
//                             [NSURL URLWithString:@"http://localhost:3000/looks/3"]];
//    [[NSURLConnection alloc] initWithRequest:request delegate:self];
//
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
