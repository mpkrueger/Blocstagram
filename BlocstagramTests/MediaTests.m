//
//  MediaTests.m
//  Blocstagram
//
//  Created by Matt Krueger on 7/19/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Media.h"

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
    NSDictionary *sourceDictionary = @{@"id": @"123456",
                                       @"user": @{@"id": @"123",
                                                  @"username": @"d'oh",
                                                  @"full_name": @"Homer Simpson",
                                                  @"profile_picture": @"http://www.example.com/example.jpg"},
                                       @"image": @{@"standard_resolution": @{@"url": @"http://www.example.com/example.jpg"}},
                                       @"caption": @{@"text": @"nice"},
                                       @"comments": @{@"data": @{@"id": @"5",
                                                                 @"from": @{@"username": @"matt",
                                                                            @"full_name": @"matt k",
                                                                            @"id": @"3",
                                                                            @"profile_picture": @"http://www.example.com/example.jpg"},
                                                                 @"text": @"wow"}},
                                       @"user_has_liked": @"true"};
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.user, sourceDictionary[@"user"], @"The user should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL, sourceDictionary[@"images"][@"standard_resolution"][@"url"], @"The media URL should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    XCTAssertEqualObjects(testMedia.comments, sourceDictionary[@"comments"][@"data"], @"The comments should be equal");
}

@end
