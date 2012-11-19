//
//  TempsPredefinisViewController.m
//  Autitimer
//
//  Created by Piret on 02/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TempsPredefinisViewController.h"
#import "ModeClassiqueViewController.h"


float a;



@implementation TempsPredefinisViewController
@synthesize bouton30s;
@synthesize bouton1m;
@synthesize bouton5m;
@synthesize bouton10m;
@synthesize bouton15m;
@synthesize bouton20m;
@synthesize bouton30m;
@synthesize bouton45m;
@synthesize bouton1h;
@synthesize bouton2h;




-(IBAction)seeTempsPredefini1 :(id)sender {
//    UIImage * btnImage1 = [UIImage imageNamed:@"bouton-30-secV.png"];
//    [bouton30s setBackgroundImage:nil forState:UIControlStateNormal];
// [bouton30s setBackgroundImage:btnImage1 forState:UIControlStateNormal]; 
//
//    
    a=30;
ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
//    
 
    
}

-(IBAction)seeTempsPredefini2 :(id)sender {
    a=60;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini3 :(id)sender {
    a=300;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini4 :(id)sender {
    a=600;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini5 :(id)sender {
    a=900;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini6 :(id)sender {
    a=1200;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini7 :(id)sender {
    a=1800;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini8 :(id)sender {
    a=2700;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini9 :(id)sender {
    a=3600;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
}

-(IBAction)seeTempsPredefini10 :(id)sender {
    a=7200;
    ModeClassiqueViewController *detailVC1 = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
	[self.navigationController pushViewController:detailVC1 animated:YES];
    
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
    [self setBouton30s:nil];
    [self setBouton1m:nil];
    [self setBouton5m:nil];
    [self setBouton10m:nil];
    [self setBouton15m:nil];
    [self setBouton20m:nil];
    [self setBouton30m:nil];
    [self setBouton45m:nil];
    [self setBouton1h:nil];
    [self setBouton2h:nil];
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
