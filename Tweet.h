//
//  Tweet.h
//  vidhub-iphone
//
//  Created by Sam Schroeder on 7/16/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//


@interface Tweet : NSObject {
	NSString *tweetID;
	NSString *text;
	NSString *createdAt;
	NSString *profileImage;
}
@property (retain) NSString *tweetID;
@property (retain) NSString *text;
@property (retain) NSString *createdAt;
@property (retain) NSString *profileImage;

+ (NSString *)dateDiff:(NSString *)origDate;

@end
