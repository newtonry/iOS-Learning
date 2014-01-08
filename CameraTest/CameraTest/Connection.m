//
//  Connection.m
//  CameraTest
//
//  Created by Ryan Newton on 1/7/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "Connection.h"

@implementation Connection

+(NSDictionary*)makePostRequest:(NSString*)reqURLStr
{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:reqURLStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    
    [request setHTTPMethod:@"POST"];
    NSString *postString = @"message=ThisIsAMessage";
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];
    
    return [[NSDictionary alloc] init];
}


@end
