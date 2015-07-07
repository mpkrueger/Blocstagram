//
//  User.h
//  Blocstagram
//
//  Created by Matt Krueger on 6/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface User : NSObject <NSCoding>

- (instancetype) initWithDictionary:(NSDictionary *)userDictionary;

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSURL *profilePictureURL;
@property (nonatomic, strong) UIImage *profilePicture;

@end
