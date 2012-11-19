//
//  RootViewController.m
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 Auticiel. All rights reserved.
//

#import "RootViewController.h"
#import "ClassiqueModeViewController.h"
#import "TempsPredefinisViewController.h"


@implementation RootViewController




- (IBAction)seeClassiqueMode: (id)sender {
    
    ClassiqueModeViewController *detailVC = [[ClassiqueModeViewController alloc] initWithNibName:@"ClassiqueModeViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
}


- (IBAction)seeTempsPredefinis: (id)sender {
    
    TempsPredefinisViewController *detailVC = [[TempsPredefinisViewController alloc] initWithNibName:@"TempsPredefinisViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"RootViewController";
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
