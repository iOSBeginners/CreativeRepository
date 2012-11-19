//
//  PersonnalisationViewController.m
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PersonnalisationViewController.h"
#import "ModeRondViewController1.h"
@implementation PersonnalisationViewController

float a,b;

- (IBAction)goBack1:(id)sender{
    
    
    a=10;
    ModeRondViewController1 *detailVC = [[ModeRondViewController1 alloc] initWithNibName:@"ModeRondViewController1" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
}
- (IBAction)goBack2:(id)sender{
    NSLog(@"clique2");
    
    a=30;
    ModeRondViewController1 *detailVC = [[ModeRondViewController1 alloc] initWithNibName:@"ModeRondViewController12" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"PersonnalisationViewController";
        
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
