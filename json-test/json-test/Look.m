//
//  Look.m
//  json-test
//
//  Created by Ryan Newton on 1/3/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "Look.h"
#import "Connection.h"


@implementation Look

+(Look *)getLookById:(NSInteger)lookId;
{
    NSString *num = [NSString stringWithFormat:@"%d", lookId];
    NSString *lookUrl = [@"http://localhost:3000/looks/" stringByAppendingString:num];
    
//    NSLog(lookUrl);
    
    Look *fetchedLook = [[Look alloc] init];
    NSDictionary *resp = [Connection makeAPICall: lookUrl];
    
//    NSLog(@"%@",resp[@"id"]);
    
    fetchedLook.look_id = resp[@"id"];
    fetchedLook.user_id = resp[@"user_id"];
    fetchedLook.description = resp[@"description"];
    fetchedLook.thumb = resp[@"image"][@"thumb"][@"url"];
    
    
//    NSLog(@"%@",fetchedLook.id);
    
//    NSLog(@"%@",resp);
//
    
    

    return fetchedLook;
}

@end
