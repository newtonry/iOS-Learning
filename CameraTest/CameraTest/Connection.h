//
//  Connection.h
//  CameraTest
//
//  Created by Ryan Newton on 1/7/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connection : NSObject

+(NSDictionary*)makePostRequest:(NSString*) reqURLStr;

@end
