//
//  FakeAPI.m
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/3/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import "FakeAPI.h"

@implementation FakeAPI
@synthesize authStatus;

-(void)authenticateWithCredentials:(NSString*)username :(NSString*)password
{
    _q = [[NSOperationQueue alloc]init];
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        BOOL correctUsername = [username isEqualToString:@"jabringetto"];
        BOOL correctPassword = [password isEqualToString:@"888xiombarg$$$"];
    
        if(correctUsername && correctPassword)
        {
            authStatus = @{ @"status" : @"authenticated"};
        }
        else
        {
            authStatus = @{ @"status" : @"failed"};
        }
        
        NSTimeInterval t = [self randomAPIResponseTime];
        sleep(t);
         dispatch_async(dispatch_get_main_queue(),^{
            
            [_authDelegate authResponse:authStatus];
         });

    }];
    [_q addOperation:op];
    
}
-(void)apiGetRequest
{
    _q = [[NSOperationQueue alloc]init];
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        NSString *docfilePath = [basePath stringByAppendingPathComponent:@"tweets.plist"];
        NSDictionary *allTweets = [NSMutableDictionary dictionaryWithContentsOfFile:docfilePath];
        NSTimeInterval t = [self randomAPIResponseTime];
        sleep(t);
        
        dispatch_async(dispatch_get_main_queue(),^{
        
        [_apiDelegate apiResponse:allTweets];
            
        });
    }];
    
    [_q addOperation:op];
    

}
-(void)apiPostTweet:(NSDictionary*)tweet
{
    _q = [[NSOperationQueue alloc]init];
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        NSString *docfilePath = [basePath stringByAppendingPathComponent:@"tweets.plist"];
        NSMutableDictionary *allTweets = [NSMutableDictionary dictionaryWithContentsOfFile:docfilePath];
        
        NSMutableArray *tweetsArray = [[NSMutableArray alloc]init];
        tweetsArray = allTweets[@"tweetsArray"];
        [tweetsArray addObject:tweet];
        [allTweets setObject:tweetsArray forKey:@"tweetsArray"];
        
        NSTimeInterval t = [self randomAPIResponseTime];
        sleep(t);
        
        [allTweets writeToFile:docfilePath atomically:YES];
        
        dispatch_async(dispatch_get_main_queue(),^{
            
            [_apiDelegate apiResponse:allTweets];
            
        });


    }];
    
    [_q addOperation:op];

}
-(NSTimeInterval)randomAPIResponseTime
{
    float interval = (float)arc4random()/0xFFFFFFFF;
    return interval*0.25+ 0.3;
}


@end
