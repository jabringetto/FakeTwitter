//
//  LoginVC.m
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/2/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import "LoginVC.h"


@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.95 alpha:1]];
    [_userNameField setBackgroundColor:[UIColor colorWithRed:0.75 green:0.75 blue:0.85 alpha:1]];
    [_passwordField setBackgroundColor:[UIColor colorWithRed:0.75 green:0.75 blue:0.85 alpha:1]];
}
-(void)animateLogoTopConstraint:(float)constant
{
    _logoTopConstraint.constant = constant;
    [UIView animateWithDuration:0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:nil];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateLogoTopConstraint:-15.0];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateLogoTopConstraint:30.0];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)authenticate:(id)sender
{
    FakeAPI *f = [[FakeAPI alloc]init];
    f.authDelegate = self;
    [f authenticateWithCredentials:_userNameField.text :_passwordField.text];
    
}
-(void)authResponse:(NSDictionary *)d
{
    if([d[@"status"] isEqualToString:@"authenticated"])
    {
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }
    else
    {
        NSString *title = @"LOGIN FAILED";
        NSString *msg = @"Please check your username and password and try again.";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:NO completion:^(void){}];

    }
}
@end
