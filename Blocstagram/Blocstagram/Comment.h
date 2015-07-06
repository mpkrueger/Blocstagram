//
//  Comment.h
//  Blocstagram
//
//  Created by Matt Krueger on 6/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)commentDictionary;

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

@end
