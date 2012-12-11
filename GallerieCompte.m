//
//  GallerieCompte.m
//  Autitimer
//
//  Created by Piret on 03/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GallerieCompte.h"
#import "ChoisirImageAlbum.h"
#import "CompteInternet.h"
#import "RootViewController.h"
int x1;
float a;
@implementation GallerieCompte
@synthesize boutonAuticiel,boutonTelephone,textfieldHeures,textfieldMinutes,textfieldSecondes;




-(IBAction)backgroundTouched:(id)sender
{
    [textfieldSecondes resignFirstResponder];
    [textfieldMinutes resignFirstResponder];
    [textfieldHeures resignFirstResponder];
  
    
}

-(IBAction)toggleButton:(id)sender {
//if (!test) {
        UIImage *buttonImage8 = [UIImage imageNamed:@"GallerieABleu.png"];
        
    
    passeAuticiel=1;
        [boutonAuticiel setImage:buttonImage8 forState:UIControlStateNormal];
    
          UIImage *buttonImage3 = [UIImage imageNamed:@"GallerieTGris.png"];
            [boutonTelephone setImage:buttonImage3 forState:UIControlStateNormal];

//            test=1;  
//    }
//    else {
//        
//        UIImage *buttonImage = [UIImage imageNamed:@"GallerieAGris.png"];
//        [boutonAuticiel setImage:buttonImage forState:UIControlStateNormal];
//        
//        UIImage *buttonImage4 = [UIImage imageNamed:@"GallerieTBleu.png"];
//        [boutonTelephone setImage:buttonImage4 forState:UIControlStateNormal];
//        
//
//        test=0;
//
//    }

}
-(IBAction)toggleButton1:(id)sender {
    
//    if (!test) {
//        UIImage *buttonImage = [UIImage imageNamed:@"GallerieTGris.png"];
//            UIImage *buttonImage1 = [UIImage imageNamed:@"GallerieABleu.png"];
//        [boutonAuticiel setImage:buttonImage1 forState:UIControlStateNormal];
//        passeAuticiel=1;
//
////        test=1;
//        [boutonTelephone setImage:buttonImage forState:UIControlStateNormal];
    
//    }
//    else {
//        
        UIImage *buttonImage7 = [UIImage imageNamed:@"GallerieTBleu.png"];
        [boutonTelephone setImage:buttonImage7 forState:UIControlStateNormal];
        UIImage *buttonImage2 = [UIImage imageNamed:@"GallerieAGris.png"];
        [boutonAuticiel setImage:buttonImage2 forState:UIControlStateNormal];
//
//        test=0;
//
//    }
    
}

-(IBAction) GoGo :(id)sender{
    secondes = [[textfieldSecondes text] floatValue];
    minutes = [[textfieldMinutes text] floatValue];
    heures = [[textfieldHeures text] floatValue];
    
    a = secondes + minutes*60 + heures*3600;
    
    //on va naviguer vers la page en fonction  du bouton qui passe en bleu
if(passeAuticiel==0)
    
    
{   ChoisirImageAlbum *detailVC = [[ChoisirImageAlbum alloc] initWithNibName:@"ChoisirImageAlbum" bundle:nil];

    [self.navigationController pushViewController:detailVC animated:YES];
    
}
else
{
    CompteInternet *detailVC = [[CompteInternet alloc] initWithNibName:@"CompteInternet" bundle:nil];

    [self.navigationController pushViewController:detailVC animated:YES];
}
    
    
}

- (IBAction)goBack:(id)sender {
  
    RootViewController *detailVC22 = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
//    chargementPremier=1;
//    x=-640;
    [self.navigationController pushViewController:detailVC22 animated:YES];}









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
{//on déclenche l'observer
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardDidShow:)
													 name:UIKeyboardDidShowNotification
												   object:nil];
	} else {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
	}
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    //on mais en veille l'observer
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    
    [self setBoutonAuticiel:nil];
    [self setBoutonTelephone:nil];
    boutonTelephone = nil;
    boutonAuticiel = nil;
    [self setTextfieldSecondes:nil];
    textfieldSecondes = nil;
    textfieldMinutes = nil;
    [self setTextfieldMinutes:nil];
    textfieldHeures = nil;
    [self setTextfieldHeures:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//ajout du bouton au keyboard
- (void)addButtonToKeyboard {
	// create custom button
	UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
	doneButton.frame = CGRectMake(0, 163, 106, 53);
	doneButton.adjustsImageWhenHighlighted = NO;
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
		[doneButton setImage:[UIImage imageNamed:@"DoneUp3.png"] forState:UIControlStateNormal];
		[doneButton setImage:[UIImage imageNamed:@"DoneDown3.png"] forState:UIControlStateHighlighted];
	} else {
		[doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
		[doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
	}
	[doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
	// locate keyboard view
	UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
	UIView* keyboard;
	for(int i=0; i<[tempWindow.subviews count]; i++) {
		keyboard = [tempWindow.subviews objectAtIndex:i];
		// keyboard found, add the button
		if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
			if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
				[keyboard addSubview:doneButton];
		} else {
			if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
				[keyboard addSubview:doneButton];
		}
	}
}
- (void)doneButton:(id)sender {
    
    [textfieldSecondes resignFirstResponder];
    
    [textfieldMinutes resignFirstResponder];
    [textfieldHeures resignFirstResponder];
}
- (void)keyboardWillShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] < 3.2) {
		[self addButtonToKeyboard];
	}
}

- (void)keyboardDidShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[self addButtonToKeyboard];
    }
}



@end
