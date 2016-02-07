//
//  WriteTweetVC.h
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/3/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakeAPI.h"

@interface WriteTweetVC : UIViewController <APICallDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)submitTweet:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end
