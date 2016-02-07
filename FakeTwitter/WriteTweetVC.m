//
//  WriteTweetVC.m
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/3/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import "WriteTweetVC.h"

@interface WriteTweetVC ()

@end

@implementation WriteTweetVC

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self.view setBackgroundColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.95 alpha:1]];
    _textView.contentInset = UIEdgeInsetsMake(-70.0,0.0,0,0.0);
    _textView.clipsToBounds = YES;
    _textView.layer.cornerRadius = 10.0f;
    //[_textView becomeFirstResponder];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitTweet:(id)sender
{
    NSMutableDictionary *tweet = [[NSMutableDictionary alloc]init];
    if([_textView.text length] < 141 && [_textView.text length] > 0)
    {
        NSDate *now = [NSDate date];
        [tweet setObject:@"jabringetto" forKey:@"user"];
        [tweet setObject:_textView.text forKey:@"text"];
        [tweet setObject:now forKey:@"date"];
        FakeAPI *f = [[FakeAPI alloc]init];
        f.apiDelegate = self;
        [f apiPostTweet:tweet];
    }
    else
    {
        NSString *title = @"No Dice";
        NSString *msg = @"Tweets must be between 1 and 140 characters in length. Like, okay???";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:NO completion:^(void){}];
        
    }
  
}
-(void)apiResponse:(NSDictionary *)d
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)animateTopConstraint:(float)constant
{
    _topConstraint.constant = constant;
    [UIView animateWithDuration:0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:nil];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self animateTopConstraint:0.0];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self animateTopConstraint:50.0];
}
-(BOOL)textFieldShouldReturn:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}




@end
