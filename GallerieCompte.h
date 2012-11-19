//
//  GallerieCompte.h
//  Autitimer
//
//  Created by Piret on 03/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


extern int x1;
float a;

@interface GallerieCompte : UIViewController
{int test;
    int test1;
    int secondes,minutes,heures;
    IBOutlet UIButton *boutonAuticiel;

    IBOutlet UIButton *boutonTelephone;
    int passeAuticiel;
    
    IBOutlet UITextField *textfieldSecondes;
    
    IBOutlet UITextField *textfieldMinutes;
    
    IBOutlet UITextField *textfieldHeures;
    
}

@property (strong, nonatomic) IBOutlet UITextField *textfieldHeures;

@property (strong, nonatomic) IBOutlet UITextField *textfieldMinutes;


@property (strong, nonatomic) IBOutlet UITextField *textfieldSecondes;

@property (strong, nonatomic) IBOutlet UIButton *boutonAuticiel;

@property (strong, nonatomic) IBOutlet UIButton *boutonTelephone;

-(IBAction)backgroundTouched:(id)sender;
-(IBAction) GoGo :(id)sender;
-(IBAction)toggleButton1:(id)sender;
-(IBAction)toggleButton:(id)sender;

- (IBAction)goBack:(id)sender;
@end
