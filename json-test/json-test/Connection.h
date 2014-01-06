//
//  Connection.h
//  json-test
//
//  Created by Ryan Newton on 1/3/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connection : NSObject

+(NSDictionary*)makeAPICall:(NSString*) reqURLStr;
+(NSDictionary*)makePostRequest:(NSString*) reqURLStr;

@end
