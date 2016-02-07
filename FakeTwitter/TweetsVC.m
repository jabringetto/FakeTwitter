//
//  TweetsVC.m
//  FakeTwitter
//
//  Created by Jeremy Bringetto on 2/2/16.
//  Copyright © 2016 Jeremy Bringetto. All rights reserved.
//

#import "TweetsVC.h"
#import "TweetCell.h"

@interface TweetsVC ()

@end

@implementation TweetsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!_allTweets)
    {
          [self addThreeInitalEntries];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [self apiCall];
    [self configureView];
}
-(void)configureView
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.95 alpha:1]];
    
    NSDictionary *attributes            = @{
                                            NSUnderlineStyleAttributeName: @1,
                                            NSForegroundColorAttributeName : [UIColor colorWithRed:0.25 green:0.25 blue:0.35 alpha:1],
                                            NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:17]
                                            };
    
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    self.navigationItem.title = @"My Latest Tweets";
    
    UIButton *tweetButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 53, 20.5)];
    UIImage *btnImage = [UIImage imageNamed:@"tweetbutton.png"];
    [tweetButton setImage:btnImage forState:UIControlStateNormal];
    [tweetButton addTarget:self action:@selector(writeTweet) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *tweetBarButton = [[UIBarButtonItem alloc]initWithCustomView:tweetButton];
    self.navigationItem.rightBarButtonItem = tweetBarButton ;
    [self.navigationItem.rightBarButtonItem setTarget:self];
    [self.navigationItem.rightBarButtonItem setAction:@selector(writeTweet)];
    
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    
    NSDictionary *attributes2            = @{
                                             NSUnderlineStyleAttributeName: @1,
                                             NSForegroundColorAttributeName : [UIColor colorWithRed:0.25 green:0.25 blue:0.35 alpha:1],
                                             NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15]
                                             };
    
    [logoutButton setTintColor:[UIColor colorWithRed:0.25 green:0.25 blue:0.35 alpha:1]];
    [logoutButton setTitleTextAttributes:attributes2 forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = logoutButton;
}
-(void)writeTweet
{
    NSLog(@"writing Tweet");
    [self performSegueWithIdentifier:@"tweetSegue" sender:self];
}
-(void)apiCall
{
    FakeAPI *f = [[FakeAPI alloc]init];
    f.apiDelegate = self;
    [f apiGetRequest];
}
-(void)apiResponse:(NSDictionary *)d
{
     _tweetsArray =  d[@"tweetsArray"];
    
    NSSortDescriptor *dateDescriptor = [[NSSortDescriptor alloc] initWithKey: @"date" ascending: NO];
    NSArray *dateDescriptors = [NSArray arrayWithObject:dateDescriptor];
    _tweetsArray = [_tweetsArray sortedArrayUsingDescriptors:dateDescriptors];
    
    
    _cellHeights = [[NSMutableArray alloc]init];
    for (NSDictionary *d in _tweetsArray)
    {
        NSString *txt = d[@"text"];
        CGFloat h = [self heightForTextView:txt];
        [_cellHeights addObject:[NSNumber numberWithFloat:h]];
    }
    [self.tableView reloadData];
    
    NSLog(@"TWEETS: %@",_allTweets);
}
-(void)logout
{
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_tweetsArray count];
}


- (TweetCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(!cell)
    {
        cell = [[TweetCell alloc]init];
    }
    cell.cellText.text = [_tweetsArray objectAtIndex:indexPath.row][@"text"];
    UIImage *img = [UIImage imageNamed:@"JAB-50.png"];
    [cell setAvatarImage:img];
    
    cell.cellLabel.text = @"@jabringetto";
    
    cell.backgroundColor = cell.cellText.backgroundColor =[UIColor whiteColor];
    if (indexPath.row % 2 != 0)
    {
        cell.backgroundColor = cell.cellText.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.99 alpha:1];
    }
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[_cellHeights objectAtIndex:indexPath.row]floatValue];
}
-(void)addThreeInitalEntries
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *docfilePath = [basePath stringByAppendingPathComponent:@"tweets.plist"];
    NSDictionary *allTweets = [NSMutableDictionary dictionaryWithContentsOfFile:docfilePath];
    
    if(!allTweets)
    {
        NSDate *now = [NSDate date];
        NSMutableDictionary *plistObject = [[NSMutableDictionary alloc]init];
        NSMutableArray *tweetsArray = [[NSMutableArray alloc]init];
        
        NSMutableDictionary *tweetOne = [[NSMutableDictionary alloc]init];
        NSString *textOne = @"Hey - this is my first tweet. Alert the media.";
        [tweetOne setObject:@"jabringetto" forKey:@"user"];
        [tweetOne setObject:textOne forKey:@"text"];
        [tweetOne setObject:now forKey:@"date"];
        
        NSMutableDictionary *tweetTwo = [[NSMutableDictionary alloc]init];
        NSString *textTwo = @"Forecast looks promising for Mavericks, will the contest run? http://www.surfline.com/surf-forecasts/northern-california/sf-san-mateo-county_2957/";
        [tweetTwo setObject:@"jabringetto" forKey:@"user"];
        [tweetTwo setObject:textTwo forKey:@"text"];
        [tweetTwo setObject:[NSDate dateWithTimeInterval:1.0 sinceDate:now] forKey:@"date"];
        
        NSMutableDictionary *tweetThree = [[NSMutableDictionary alloc]init];
        NSString *textThree = @"What do you guys think about recruiters who reach out to you and only want to discuss their 'urgent' requirement? Only recruiters who appear interested in me in general capture my attention.";
        [tweetThree setObject:@"jabringetto" forKey:@"user"];
        [tweetThree setObject:textThree forKey:@"text"];
        [tweetThree setObject:[NSDate dateWithTimeInterval:2.0 sinceDate:now] forKey:@"date"];
        
        [tweetsArray addObject:tweetOne];
        [tweetsArray addObject:tweetTwo];
        [tweetsArray addObject:tweetThree];
        
        [plistObject setObject:tweetsArray forKey:@"tweetsArray"];
        
        
        [plistObject writeToFile:docfilePath atomically:YES];
    }
}
-(CGFloat)heightForTextView:(NSString *)text
{
    NSInteger MAX_HEIGHT = 2000;
    UITextView * textView = [[UITextView alloc] initWithFrame: CGRectMake(8.0, 22.0,300.0, MAX_HEIGHT)];
    textView.text = text;
    [textView sizeToFit];
    return textView.frame.size.height + 30.0;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
