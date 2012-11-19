//
//  ImageAlbumDetail.m
//  Autitimer
//
//  Created by Piret on 09/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved./Users/Antoine/DeviOS/Applications IOS/Time Timer Prototype/Autitimer 4/ImageCompteDetail.h
//

#import "ImageCompteDetail.h"
#import "RootViewController.h"
#import "ImageCompteD.h"
@implementation ImageCompteDetail
@synthesize imageD;

@synthesize texte,image,barreVerte,monBouton;



-(IBAction)toggleButton:(id)sender {
    
    if (!test) {
        UIImage *buttonImage = [UIImage imageNamed:@"pause.png"];
        
        
        test=1;
        [monBouton setImage:buttonImage forState:UIControlStateNormal];
        
    }
    else {
        
        UIImage *buttonImage = [UIImage imageNamed:@"play.png"];
        [monBouton setImage:buttonImage forState:UIControlStateNormal];
        test=0;
        [myTimer invalidate];
        
    }
    
}

-(IBAction)goHome:(id)sender{

    RootViewController *detailVC1 = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    
    [self.navigationController pushViewController:detailVC1 animated:YES];
}
//pour les fléches
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	//return UITableViewCellAccessoryDetailDisclosureButton;
	return UITableViewCellAccessoryDisclosureIndicator;
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

    imageD.image=image;
}

- (void)viewDidUnload
{

    [self setImageD:nil];
    imageD = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
