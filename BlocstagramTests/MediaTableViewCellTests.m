//
//  MediaTableViewCellTests.m
//  Blocstagram
//
//  Created by Matt Krueger on 7/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Media.h"
#import "MediaTableViewCell.h"

@interface MediaTableViewCellTests : XCTestCase

@end

@implementation MediaTableViewCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHeightForMediaItem {
//    Media *mediaItem =
    NSDictionary *userDictionary = @{@"id": @"123456",
                                     @"username": @"d'oh",
                                     @"full_name": @"Homer Simpson",
                                     @"profile_picture": @"http://www.example.com/example.jpg"};
    
    NSDictionary *fromUserDictionary = @{@"username": @"matt",
                                         @"full_name": @"matt k",
                                         @"id": @"333",
                                         @"profile_picture": @"http://www.example.com/example.jpg"};
    
    
    
    NSDictionary *commentsDictionary = @{@"id": @"555",
                                         @"from": fromUserDictionary,
                                         @"text": @"wow"};
    
    NSDictionary *sourceDictionary = @{@"id": @"123",
                                       @"user": userDictionary,
                                       @"images": @{@"standard_resolution": @{@"url": @"http://stuffpoint.com/dogs/image/461366-dogs-happy-dog.jpg"}},
                                       @"caption": @{@"text": @"nice"},
                                       @"comments": @{@"data": @[commentsDictionary]},
                                       @"user_has_liked": @YES};
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    testMedia.image = image;
    
    NSLog(@"height of media item %f", [MediaTableViewCell heightForMediaItem:testMedia width:320 traitCollection:[UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassCompact]]);
    
    XCTAssertEqual([MediaTableViewCell heightForMediaItem:testMedia width:320 traitCollection:[UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassCompact]] , 402);
    
    
}



@end
