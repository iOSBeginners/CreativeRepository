//
//  changerLibellé.m
//  Autitimer
//
//  Created by Piret on 01/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "changerLibelle.h"
#import "UIButton+Glossy.h"
#import "ClassiqueModeViewController.h"
#import "ModeRond.h"
#import "ChoisirImageAlbum.h"
NSString *myString;
@implementation changerLibelle
@synthesize textField;
@synthesize bouton,b3;
@synthesize image;
-(IBAction)goBack:(id)sender{
    ChoisirImageAlbum *detailVC22 = [[ChoisirImageAlbum alloc] initWithNibName:@"ChoisirImageAlbum" bundle:nil];
    
    [self.navigationController pushViewController:detailVC22 animated:YES];}



-(IBAction)ClassicMode :(id)sender{
    
ClassiqueModeViewController *detailVC = [[ClassiqueModeViewController alloc] initWithNibName:@"ClassiqueModeViewController" bundle:nil];
myString =textField.text;
[self.navigationController pushViewController:detailVC animated:YES];

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
-(IBAction)textFieldReturn :(id)sender{
    [sender resignFirstResponder];

}
#pragma mark - View lifecycle

- (void)viewDidLoad
{[b3 setBackgroundToGlossyRectOfColor:[UIColor colorWithRed:.65 green:.05 blue:.05 alpha:1] withBorder:NO forState:UIControlStateNormal];
    [self.image setImage:image10];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setBouton:nil];
    [self setImage:nil];
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
