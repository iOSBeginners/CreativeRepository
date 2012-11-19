//
//  ClassiqueModeViewController.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClassiqueModeViewController.h"
#import "ModeClassiqueViewController.h"
#import "RootViewController.h"
#import "ClassiqueModeViewController.h"
#import "UIButton+Glossy.h"
#import "ChoisirImageAlbum.h"
#import "RootViewController.h"
#import "ModeRondViewController1.h"
#import "ModeTriangleViewController.h"
#import "GallerieCompte.h"
#import "ModeSerpentinViewController.h"
#import "ClassiqueMode.h"

float a;
float b;

float secondes;
float minutes;
float heures;
int x;
int chargementPremier;

@implementation ClassiqueModeViewController



@synthesize textfieldSecondes,textfieldMinutes, textfieldHeures;

- (void)doneButton:(id)sender {

    [textfieldSecondes resignFirstResponder];
   
    [textfieldMinutes resignFirstResponder];
       [textfieldHeures resignFirstResponder];
}
-(IBAction)backgroundTouched:(id)sender
{
    [textfieldSecondes resignFirstResponder];
        [textfieldMinutes resignFirstResponder];
        [textfieldHeures resignFirstResponder];
    
}
-(IBAction)Go :(id)sender {
    test=0;
    //début code1
    // ce code sert a afficher un warning a cas ou l'utilisateur n'a pas saisie la durée
    NSString *strText1=textfieldSecondes.text;
      NSString *strText2=textfieldMinutes.text;
       NSString *strText3=textfieldHeures.text;
    if ([strText1 isEqualToString:@""]&&[strText2 isEqualToString:@""]&&[strText3 isEqualToString:@""]) 
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Vous devez préciser d'abord le temps " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //on utilise la variable passe1 pour empéché l'exécution du code qui permet de passer à la page suivante au cas ou les champ de a saisie du temps son vide(l'utilisateur n'a pas saisie le temps)
        passe1=1;
        [alert show];
    }
    else passe1=0;
    // fin code1
    if (passe1==0)
    { secondes = [[textfieldSecondes text] floatValue];
    minutes = [[textfieldMinutes text] floatValue];
    heures = [[textfieldHeures text] floatValue];
    
    a = secondes + minutes*60 + heures*3600; 
        // a nombre total de secondes
        b=0.04;
       
    if(x==0)
    {       ModeRondViewController1 *detailVC = [[ModeRondViewController1 alloc] initWithNibName:@"ModeRondViewController1" bundle:nil];
  
        


     [self.navigationController pushViewController:detailVC animated:YES];}
        else if(x==-960)
        {ModeTriangleViewController *detailVC = [[ModeTriangleViewController alloc] initWithNibName:@"ModeTriangleViewController" bundle:nil];
           
         [self.navigationController pushViewController:detailVC animated:YES];}

        else if(x==-640)
        {   ModeClassiqueViewController *detailVC = [[ModeClassiqueViewController alloc] initWithNibName:@"ModeClassique" bundle:nil];
            [self.navigationController pushViewController:detailVC animated:YES];}
        else if(x==-320)
        { ModeSerpentinViewController *detailVC = [[ModeSerpentinViewController alloc] initWithNibName:@"ModeSerpentin" bundle:nil];
            
            [self.navigationController pushViewController:detailVC animated:YES];
        }
 
      
    }
    
}






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSString *strText1=textfieldSecondes.text;
    NSString *strText2=textfieldMinutes.text;
       NSString *strText3=textfieldHeures.text;
   if ([strText1 isEqualToString:@""]&&[strText2 isEqualToString:@""]&&[strText3 isEqualToString:@""]) 
       {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Vous devez préciser d'abord le temps " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
           passe2=1;
           [alert show];
        }
        else passe2=0;
       if(passe2==0)
       {secondes = [[textfieldSecondes text] floatValue];
           minutes = [[textfieldMinutes text] floatValue];
           heures = [[textfieldHeures text] floatValue];
           
           a = secondes + minutes*60 + heures*3600; }
    // a nombre total de secondes
           
           

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Classique Mode";
        
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

-(void) goBack:(id)sender{
    
    RootViewController *rt=[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:Nil];
    [self.navigationController pushViewController:rt animated:YES];
}
- (void)viewDidLoad
{
    x1=x;
    x1=-640;
//ajout d'un observer pour l'affichage du clavier
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

}

- (void)viewDidUnload
{[[NSNotificationCenter defaultCenter] removeObserver:self];
//    [self setForme:nil];
//    forme = nil;
//    animation = nil;
//    [self setAnimation:nil];
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
