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
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"1" ofType:@"jpg"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHeightForMediaItem {
    Media *mediaItem = 
}

@end
