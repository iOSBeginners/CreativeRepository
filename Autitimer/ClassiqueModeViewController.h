//
//  ClassiqueModeViewController.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ModeClassiqueViewController.h"

extern int chargementPremier;
extern float a;
extern float b;
extern int x;

@interface ClassiqueModeViewController : UIViewController {
    int passe1,passe2;
    IBOutlet UITextField *textfieldSecondes;
    IBOutlet UITextField *textfieldMinutes;
    IBOutlet UITextField *textfieldHeures;
    
//    IBOutlet UIImageView *animation;

}

//@property (strong, nonatomic) IBOutlet UIImageView *animation;

@property (nonatomic, retain) IBOutlet UITextField *textfieldSecondes;
@property (nonatomic, retain) IBOutlet UITextField *textfieldMinutes;
@property (nonatomic, retain) IBOutlet UITextField *textfieldHeures;




-(IBAction) Go :(id)sender;
- (IBAction)backgroundTouched:(id)sender;
- (IBAction)goBack:(id)sender;

@end