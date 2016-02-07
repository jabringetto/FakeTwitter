//
//  LoginVC.h
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/2/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakeAPI.h"

@interface LoginVC : UIViewController <UITextFieldDelegate, AuthenticationDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoTopConstraint;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)authenticate:(id)sender;




@end
