//
//  DataSource.h
//  Blocstagram
//
//  Created by Matt Krueger on 6/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong) NSMutableArray *mediaItems;

- (void) deleteMediaItem:(Media *)item;

@end
