//
//  RootViewController.m
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 Auticiel. All rights reserved.
//

#import "ChoisirForme.h"
#import "DropImage.h"
#import "ModeRondViewController.h"
#import "ModeRondViewController1.h"
#import "ModeRondViewController12.h"
#import "ModeTriangleViewController.h"
@implementation ChoisirForme


- (IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction) dropImage : (id) sender {
    
    DropImage *detailVC = 
    [[DropImage alloc] initWithNibName:
     @"DropImage" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
    
}
- (IBAction) seeClassiqueMode : (id) sender {
    
    ModeRondViewController1 *detailVC = [[ModeRondViewController1 alloc] initWithNibName:@"ModeRondViewController1" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
    
}
- (IBAction) seeTriangleMode : (id) sender {
    
    ModeTriangleViewController *detailVC = [[ModeTriangleViewController alloc] initWithNibName:@"ModeTriangleViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
    
}
- (IBAction) seeTempsPredefinis : (id) sender {
    
    ModeRondViewController12 *detailVC = [[ModeRondViewController12 alloc] initWithNibName:@"ModeRondViewController12" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
    
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"ChoisirForme";
        
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
