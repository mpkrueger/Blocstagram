//
//  DataSource.h
//  Blocstagram
//
//  Created by Matt Krueger on 6/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

typedef void (^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject

+(instancetype) sharedInstance;
+(NSString *) instagramClientID;

@property (nonatomic, strong) NSMutableArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(Media *)item;
- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) downloadImageForMediaItem:(Media *)mediaItem;
- (void) toggleLikeOnMediaItem:(Media *)mediaItem withCompletionHandler:(void (^)(void))completionHandler;
- (void) commentOnMediaItem:(Media *)mediaItem withCommentText:(NSString *)commentText;

@end
