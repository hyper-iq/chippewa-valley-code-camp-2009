//
//  App.h
//  vidhub-iphone
//
//  Created by Sam Schroeder on 6/24/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//



@interface App : NSObject {
	NSString *twitterUserName;
	NSMutableArray *tweets;
}

@property (copy) NSString *twitterUserName;
@property (copy) NSMutableArray *tweets;

+ (App *)sharedApp;
- (NSURL *)twitterTimeLineURL;

- (void)loadTwitterTimeLine;
- (void)parseTwitterTimeLine:(NSArray *)twitterArray;

@end
