//
//  ModeRondViewController.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeClassiqueViewController.h"
#import "ClassiqueModeViewController.h"
#import "ModeClassique.h"
#import "ChoisirImageAlbum.h"

#import "RootViewController.h"
int test;
int w;
int x1;
@implementation ModeClassiqueViewController

@synthesize myBouton;



-(void)loadView{  
    w=0;
    [super loadView];

}

-(IBAction)toggleButton:(id)sender {
    
    if(w==0)
    {if (!test) {
        UIImage *buttonImage = [UIImage imageNamed:@"pause.png"];


        test=1;
        [myBouton setImage:buttonImage forState:UIControlStateNormal];   
          
    }
    else {
        
          UIImage *buttonImage = [UIImage imageNamed:@"play.png"];
    [myBouton setImage:buttonImage forState:UIControlStateNormal];
        test=0;
   [myTimer1 invalidate];
 [myTimer2 invalidate];
    }}
    if(w==1)
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
}

- (IBAction)goHome:(id)sender {
    RootViewController *detailVC1 = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    
    [self.navigationController pushViewController:detailVC1 animated:YES];
}

- (IBAction)goBack:(id)sender
{
//renvoie les coordonnées du cercle pour pouvoir l'afficher dans le prochain écran
    x1=-640;
    
    //si j'ai un problème de navigation j'ajoute cette ligne et si je l'ajoute
    //le problème c'est que quand je revient la navigation vers le classique devient
    //incorrect et redirige vers le cercle
    
//    ClassiqueModeViewController *detailVC1 = [[ClassiqueModeViewController alloc] initWithNibName:@"ClassiqueModeViewController" bundle:nil];
//    
//    [self.navigationController pushViewController:detailVC1 animated:YES];
    
        [self.navigationController popViewControllerAnimated:NO];
 
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
    [self setMyBouton:nil];

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
