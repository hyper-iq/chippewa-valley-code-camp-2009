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

// 4
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//	CGSize aSize;  
//	  
//	aSize = [[[[[App sharedApp] tweets] objectAtIndex:indexPath.row] text] sizeWithFont:[UIFont systemFontOfSize:18]  
//					 constrainedToSize:CGSizeMake(225.0, 1000.0)  
//					 lineBreakMode:UILineBreakModeTailTruncation]; 
//
//	return aSize.height;
//}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		
		// 1 Default Cell
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
		// 2 Cell with Subtitle
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// 1 Configure the cell.
	cell.textLabel.text = [[[[App sharedApp] tweets] objectAtIndex:indexPath.row] text];

	// 2 Configure the cell.
//	cell.textLabel.text = [[[[App sharedApp] tweets] objectAtIndex:indexPath.row] text];
//	cell.detailTextLabel.text = [Tweet dateDiff:[[[[App sharedApp] tweets] objectAtIndex:indexPath.row] createdAt]];
	
	// 3 Configure the cell.
//	cell.textLabel.font = [UIFont systemFontOfSize:14];
//	cell.textLabel.numberOfLines = 4;
//	cell.textLabel.text = [[[[App sharedApp] tweets] objectAtIndex:indexPath.row] text];
//	cell.detailTextLabel.text = [Tweet dateDiff:[[[[App sharedApp] tweets] objectAtIndex:indexPath.row] createdAt]];

	// 5 Enable Image
//	cell.imageView.image = [UIImage imageWithData:
//							[NSData dataWithContentsOfURL:
//							 [NSURL URLWithString:[[[[App sharedApp] tweets] objectAtIndex:indexPath.row] profileImage]]
//							] 
//							];
	
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

