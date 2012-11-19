//
//  TempsPredefinisViewController.m
//  Autitimer
//
//  Created by Piret on 02/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TempsPredefinisViewController.h"
#import "TempsPredefini1ViewController.h"
#import "TempsPredefini2ViewController.h"
#import "TempsPredefini3ViewController.h"
#import "TempsPredefini4ViewController.h"
#import "TempsPredefini5ViewController.h"
#import "TempsPredefini6ViewController.h"
#import "TempsPredefini7ViewController.h"
#import "TempsPredefini8ViewController.h"
#import "TempsPredefini9ViewController.h"
#import "TempsPredefini10ViewController.h"

float a;
float b;


@implementation TempsPredefinisViewController




-(IBAction)seeTempsPredefini1 :(id)sender {
    a=30;
    TempsPredefini1ViewController *detailVC1 = [[TempsPredefini1ViewController alloc] initWithNibName:@"TempsPredefini1ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
 
    
}

-(IBAction)seeTempsPredefini2 :(id)sender {
    a=60;
    TempsPredefini2ViewController *detailVC = [[TempsPredefini2ViewController alloc] initWithNibName:@"TempsPredefini2ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini3 :(id)sender {
    a=300;
    TempsPredefini3ViewController *detailVC = [[TempsPredefini3ViewController alloc] initWithNibName:@"TempsPredefini3ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini4 :(id)sender {
    a=600;
    TempsPredefini4ViewController *detailVC = [[TempsPredefini4ViewController alloc] initWithNibName:@"TempsPredefini4ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini5 :(id)sender {
    a=900;
    TempsPredefini5ViewController *detailVC = [[TempsPredefini5ViewController alloc] initWithNibName:@"TempsPredefini5ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini6 :(id)sender {
    a=1200;
    TempsPredefini6ViewController *detailVC = [[TempsPredefini6ViewController alloc] initWithNibName:@"TempsPredefini6ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini7 :(id)sender {
    a=1800;
    TempsPredefini7ViewController *detailVC = [[TempsPredefini7ViewController alloc] initWithNibName:@"TempsPredefini7ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini8 :(id)sender {
    a=2700;
    TempsPredefini8ViewController *detailVC = [[TempsPredefini8ViewController alloc] initWithNibName:@"TempsPredefini8ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini9 :(id)sender {
    a=3600;
    TempsPredefini9ViewController *detailVC = [[TempsPredefini9ViewController alloc] initWithNibName:@"TempsPredefini9ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)seeTempsPredefini10 :(id)sender {
    a=7200;
    TempsPredefini10ViewController *detailVC = [[TempsPredefini10ViewController alloc] initWithNibName:@"TempsPredefini10ViewController" bundle:nil];
	[self.navigationController pushViewController:detailVC animated:YES];
    
}


- (IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
