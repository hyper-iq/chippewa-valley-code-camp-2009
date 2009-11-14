//
//  chippewa_valley_code_camp_2009AppDelegate.m
//  chippewa-valley-code-camp-2009
//
//  Created by Sam Schroeder on 11/14/09.
//  Copyright Recursive Awesome, LLC 2009. All rights reserved.
//

#import "chippewa_valley_code_camp_2009AppDelegate.h"
#import "RootViewController.h"


@implementation chippewa_valley_code_camp_2009AppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	[[App sharedApp] setTwitterUserName:@"MSDN"];
	[[App sharedApp] loadTwitterTimeLine];
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

