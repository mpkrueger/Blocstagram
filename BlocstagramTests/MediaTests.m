//
//  MediaTests.m
//  Blocstagram
//
//  Created by Matt Krueger on 7/19/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Media.h"
#import "User.h"
#import "Comment.h"

@interface MediaTests : XCTestCase

@end

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testThatInitializationWorks
{
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
                                       @"images": @{@"standard_resolution": @{@"url": @"http://www.example.com/example.jpg"}},
                                       @"caption": @{@"text": @"nice"},
                                       @"comments": @{@"data": @[commentsDictionary]},
                                       @"user_has_liked": @YES};
    
    Comment *newComment = [[Comment alloc] initWithDictionary:commentsDictionary];

    NSString *standardResolutionImageURLString = sourceDictionary[@"images"][@"standard_resolution"][@"url"];
    NSURL *standardResolutionURL = [NSURL URLWithString:standardResolutionImageURLString];
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    Comment *comment = [testMedia.comments objectAtIndex:0];
    
    NSString *commentText = comment.text;
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL, standardResolutionURL, @"The media URL should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    XCTAssertEqualObjects(commentText, newComment.text, @"The comment should be equal");
    XCTAssertTrue(testMedia.likeState == LikeStateLiked);
}

@end
