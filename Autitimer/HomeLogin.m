//
//  HomeLogin.m
//  Autitimer
//
//  Created by Piret on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeLogin.h"
#import "ConnectLogin.h"
#import "RegisterLogin.h"
#import "PlusInfo.h"
#import "RootViewController.h"
@implementation HomeLogin

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

- (IBAction)Connect:(id)sender {
    
    ConnectLogin *CLogin=[[ConnectLogin alloc] initWithNibName:@"ConnectLogin" bundle:Nil ];
    [self.navigationController pushViewController:CLogin animated:YES];
}

- (IBAction)Register:(id)sender {
    RegisterLogin *RLogin=[[RegisterLogin alloc] initWithNibName:@"RegisterLogin" bundle:Nil ];
    [self.navigationController pushViewController:RLogin animated:YES];
}

- (IBAction)goInfo:(id)sender {
    
    
    PlusInfo *pI=[[PlusInfo alloc]initWithNibName:@"PlusInfo" bundle:nil];
    [self.navigationController pushViewController:pI animated:YES];
}

- (IBAction)goBack:(id)sender {
    
    RootViewController *gB=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:gB animated:YES];
    
    
}
@end
