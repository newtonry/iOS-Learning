//
//  Look.h
//  json-test
//
//  Created by Ryan Newton on 1/3/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Look : NSObject

@property NSString *look_id;
@property NSString *user_id;
@property NSString *description;
@property NSString *url;
@property NSString *thumb;

+(Look *)getLookById:(NSInteger)lookId;


@end
