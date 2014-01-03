//
//  XYZToDoItem.h
//  ToDoList
//
//  Created by Ryan Newton on 1/2/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL *completed;
@property (readonly) NSDate *creationDate;

@end
