//
//  Tweet.m
//  vidhub-iphone
//
//  Created by Sam Schroeder on 7/16/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "Tweet.h"


@implementation Tweet

@synthesize tweetID;
@synthesize text;
@synthesize createdAt;

+ (NSString *)dateDiff:(NSString *)origDate {
	
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"EEE MMM dd HH:mm:ss VVVV yyyy"];	
	
	NSDate *convertedDate = [df dateFromString:origDate];
    
	[df release];
    
	NSDate *todayDate = [NSDate date];
    
	double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    
	if(ti < 1) {
        return @"never";
    } else      if (ti < 60) {
        return @"less than a minute ago";
    } else if (ti < 3600) {
        int diff = round(ti / 60);
        return [NSString stringWithFormat:@"%d minutes ago", diff];
    } else if (ti < 86400) {
        int diff = round(ti / 60 / 60);
        return[NSString stringWithFormat:@"%d hours ago", diff];
    } else {
        int diff = round(ti / 60 / 60 / 24);
        return[NSString stringWithFormat:@"%d days ago", diff];
    }  
}

- (void) dealloc {
	[tweetID release];
	[text release];
	[createdAt release];
	[super dealloc];
}

@end
