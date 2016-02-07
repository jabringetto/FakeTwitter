//
//  TweetCell.h
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/2/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell

@property (nonatomic) UILabel *cellLabel;
@property (nonatomic) UITextView *cellText;
@property (nonatomic) UIImageView *avatarImageView;

-(void)setAvatarImage:(UIImage*)img;

@end
