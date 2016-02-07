//
//  FakeTwitterTests.m
//  FakeTwitterTests
//
//  Created by Jeremy Bringetto on 2/3/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginVC.h"
#import "TweetsVC.h"

@interface FakeTwitterTests : XCTestCase



@end

@implementation FakeTwitterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSLog(@"Setting Up");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)cellHeightTest
{
    NSLog(@"Steve Miller Band");
    TweetsVC *tvc = [[TweetsVC alloc]init];
    CGFloat height = [tvc heightForTextView:@"abra cadabrah I wanna reach out and grab ya"];
    NSNumber *h = [NSNumber numberWithFloat:height];
    XCTAssert(h, @"rad");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
