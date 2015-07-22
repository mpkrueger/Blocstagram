//
//  CommentTests.m
//  Blocstagram
//
//  Created by Matt Krueger on 7/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface CommentTests : XCTestCase

@end

@implementation CommentTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)detectsTextIsPresent {
    ComposeCommentView *commentView = [[ComposeCommentView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    commentView.text = @"Great picture";
    
    XCTAssertTrue(commentView.isWritingComment == YES);
}

- (void)detextsNoTextPresent {
    ComposeCommentView *commentView = [[ComposeCommentView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    commentView.text = nil;
    
    XCTAssertTrue(commentView.isWritingComment == NO);
}

@end
