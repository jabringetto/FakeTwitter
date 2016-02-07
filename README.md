

TEST: After initialization, the LoginVC contains an initialized UITextField object entitled ‘usernameField’.

-(void)testUsernameTextFieldConnection 
{
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@”Storyboard” bundle:nil];
LoginVC *viewController = [storyboard instantiateViewControllerWithIdentifier:
@”LoginVC”];
[viewController view];
XCTAssertNotNil([viewController usernameField], @”username TextField should be connected”);
}


TEST: After initialization, the LoginVC contains an initialized UITextField object entitled ‘passwordField’.


-(void)testUsernameTextFieldConnection 
{
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@”Storyboard” bundle:nil];
LoginVC *viewController = [storyboard instantiateViewControllerWithIdentifier:
@”LoginVC”];
[viewController view];
XCTAssertNotNil([viewController passwordField], @”password TextField should be connected”);
}

TEST: When FakeAPI class  initialized, calling the authenticate (with username and password) method asynchronously returns a dictionary to its delegate with a non-nil value for the key ‘@status’.



TEST: TweetsVC class  initialized, callAPI method invoked. Test that the -allTweets object is asynchronously updated and is non-nil at the end of the method.



TEST: WriteTweetVC class  initialized, postAPI method is invoked with a fake text string, verify the data passed to the FakeAPI is indeed written to the database (in this case, written to the plist in the documents directory). 