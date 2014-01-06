//
//  Connection.m
//  json-test
//
//  Created by Ryan Newton on 1/3/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "Connection.h"

@implementation Connection

+(NSDictionary*)makeAPICall:(NSString*)reqURLStr
{
    NSURLRequest *Request = [NSURLRequest requestWithURL:[NSURL URLWithString: reqURLStr]];
    NSURLResponse *resp = nil;
    NSError *myError = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: Request returningResponse: &resp error: &myError];
    
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&myError];
    
    
//    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return res;
}


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
