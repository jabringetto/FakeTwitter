//
//  FakeTwitterLoginTests.m
//  FakeTwitterLoginTests
//
//  Created by Jeremy Bringetto on 2/3/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TweetsVC.h"
#import "LoginVC.h"
#import "FakeAPI.h"

@interface FakeTwitterLoginTests : XCTestCase

@end

@implementation FakeTwitterLoginTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    /*
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"Steve Miller Band");
    TweetsVC *tvc = [[TweetsVC alloc]init];
    CGFloat height = [tvc heightForTextView:@"abra cadabrah I wanna reach out and grab ya"];
    NSNumber *h = [NSNumber numberWithFloat:height];
    XCTAssertNotNil(h, @"rad");
     */
    
    FakeAPI *f = [[FakeAPI alloc]init];
    
    [f authenticateWithCredentials:@"jabringetto":@"888xiombarg$$$"];
    
    XCTAssertEqualObjects(f.authStatus[@"status"],@"authenticated");
}
- (void)fakeAPIAuthentcatesWithCorrectCredentials
{
    FakeAPI *f = [[FakeAPI alloc]init];
    [f authenticateWithCredentials:@"jabringetto":@"888xiombarg$$$"];
    
    XCTAssertEqualObjects(f.authStatus[@"status"],@"authenticated");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
