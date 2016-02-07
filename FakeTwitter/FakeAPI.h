//
//  FakeAPI.h
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/3/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthenticationDelegate <NSObject>

-(void)authResponse:(NSDictionary*)d;

@end

@protocol APICallDelegate <NSObject>

-(void)apiResponse:(NSDictionary*)d;

@end


@interface FakeAPI : NSObject

@property (nonatomic, weak) id <AuthenticationDelegate> authDelegate;

@property (nonatomic, weak) id <APICallDelegate> apiDelegate;

-(void)authenticateWithCredentials:(NSString*)username :(NSString*)password;

-(void)apiGetRequest;

-(void)apiPostTweet:(NSDictionary*)tweet;

@property NSOperationQueue *q;

@property NSDictionary *authStatus;


@end
