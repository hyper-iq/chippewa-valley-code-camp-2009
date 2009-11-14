//
//  chippewa_valley_code_camp_2009AppDelegate.h
//  chippewa-valley-code-camp-2009
//
//  Created by Sam Schroeder on 11/14/09.
//  Copyright Recursive Awesome, LLC 2009. All rights reserved.
//

@interface chippewa_valley_code_camp_2009AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

