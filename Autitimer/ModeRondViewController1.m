//
//  ModeRondViewController.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeRondViewController1.h"
#import "ClassiqueModeViewController.h"
#import "ModeRond1.h"
int x1;
int w;
@implementation ModeRondViewController1
@synthesize myBouton;

-(IBAction)toggleButton:(id)sender {
    if (!test) {
        UIImage *buttonImage = [UIImage imageNamed:@"pause.png"];
        test=1;
        [myBouton setImage:buttonImage forState:UIControlStateNormal];   
        
    }
    else {
        
        UIImage *buttonImage = [UIImage imageNamed:@"play.png"];
        [myBouton setImage:buttonImage forState:UIControlStateNormal];
        test=0;

    }
}


- (IBAction)goBack:(id)sender
{   //la position du cercle
    x1=0;
    [self.navigationController popViewControllerAnimated:NO];
}


- (void)loadView {
	[super loadView];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"ModeRondViewController1";
        
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
