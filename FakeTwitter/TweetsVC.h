//
//  TweetsVC.h
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/2/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakeAPI.h"

@interface TweetsVC : UITableViewController <APICallDelegate>

@property (nonatomic) NSMutableDictionary *allTweets;
@property (nonatomic) NSArray *tweetsArray;
@property (nonatomic) NSMutableArray *cellHeights;

-(CGFloat)heightForTextView:(NSString *)text;

@end
