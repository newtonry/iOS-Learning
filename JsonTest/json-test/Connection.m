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

@end
