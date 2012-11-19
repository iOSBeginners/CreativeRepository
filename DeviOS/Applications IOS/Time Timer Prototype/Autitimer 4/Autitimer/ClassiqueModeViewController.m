//
//  ClassiqueModeViewController.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClassiqueModeViewController.h"
#import "ModeRondViewController.h"
#import "PersonnalisationViewController.h"



float a;
float b;

float secondes;
float minutes;
float heures;



@implementation ClassiqueModeViewController

@synthesize textfieldSecondes,textfieldMinutes, textfieldHeures;


-(IBAction)seeModeRond :(id)sender {
    
    
    secondes = [[textfieldSecondes text] floatValue];
    minutes = [[textfieldMinutes text] floatValue];
    heures = [[textfieldHeures text] floatValue];
    
    a = secondes + minutes*60 + heures*3600;  // a nombre total de secondes
    
    
    ModeRondViewController *detailVC = [[ModeRondViewController alloc] initWithNibName:@"ModeRondViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
}


-(IBAction)seePersonnalisation :(id)sender {
    
    PersonnalisationViewController *detailVC = [[PersonnalisationViewController alloc] initWithNibName:@"PersonnalisationViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
} 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Classique Mode";
        
    }
    return self;
}


- (IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
