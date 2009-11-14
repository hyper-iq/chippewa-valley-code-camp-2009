//
//  RootViewController.m
//  chippewa-valley-code-camp-2009
//
//  Created by Sam Schroeder on 11/14/09.
//  Copyright Recursive Awesome, LLC 2009. All rights reserved.
//

#import "RootViewController.h"
#import "Tweet.h"


@implementation RootViewController


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[App sharedApp] tweets] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		
		// Default Cell
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
		// Cell with Subtitle
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	// Text Labels
//	UITextView *tweetText = (UITextView *) [cell viewWithTag:1];
//	tweetText.text = [[[[App sharedApp] tweets] objectAtIndex:indexPath.row] text];
//	
//	UILabel *tweetedAt = (UILabel *) [cell viewWithTag:2];
//	tweetedAt.text = [Tweet dateDiff:[[[[App sharedApp] tweets] objectAtIndex:indexPath.row] createdAt]];
	
	cell.textLabel.text = [[[[App sharedApp] tweets] objectAtIndex:indexPath.row] text];
	cell.detailTextLabel.text = [Tweet dateDiff:[[[[App sharedApp] tweets] objectAtIndex:indexPath.row] createdAt]];

    return cell;
}



/*
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
}
*/

- (void)dealloc {
    [super dealloc];
}


@end

