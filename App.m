//
//  App.m
//  vidhub-iphone
//
//  Created by Sam Schroeder on 6/24/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "App.h"
#import "SynthesizeSingleton.h"
#import "Tweet.h"

@implementation App

SYNTHESIZE_SINGLETON_FOR_CLASS(App);

@synthesize twitterUserName;
@synthesize tweets;


#pragma mark -
#pragma mark API URLS 

- (NSURL *)twitterTimeLineURL {
	return [NSURL URLWithString:[NSString stringWithFormat:@"http://twitter.com/statuses/user_timeline.json?id=%@",
								 [[App sharedApp] twitterUserName]]
			];
}

#pragma mark -
#pragma mark Twitter 

- (void)loadTwitterTimeLine {
	NSString *twitterData = [Connector retrieveJSONFromURL:[[App sharedApp] twitterTimeLineURL] withHTTPMethod:@"GET" withDataDictionary:nil];	
	[self parseTwitterTimeLine:[twitterData JSONValue]];
}

- (void)parseTwitterTimeLine:(NSArray *)twitterArray {
	
	NSMutableArray *returnArray =  [[[NSMutableArray alloc] init] autorelease];
	
	for(NSDictionary *tweet in twitterArray) {
		Tweet *tempTweet = [[[Tweet alloc] init] autorelease];
		
		[tempTweet setTweetID:[tweet valueForKey:@"id"]];
		[tempTweet setText:[tweet valueForKey:@"text"]];
		[tempTweet setCreatedAt:[tweet valueForKey:@"created_at"]];

		// Add to Return array
		[returnArray addObject:tempTweet];
    }
	
	DevLog2(@"Tweet count: %i", [returnArray count]);
	[self setTweets:returnArray];
}	

- (void) dealloc {
	[twitterUserName release];
	[tweets release];
	[super dealloc];
}

@end
