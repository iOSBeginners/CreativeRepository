//
//  ClassiqueModeViewController.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeRondViewController.h"


extern float a;
extern float b;


@interface ClassiqueModeViewController : UIViewController {
    
    IBOutlet UITextField *textfieldSecondes;
    IBOutlet UITextField *textfieldMinutes;
    IBOutlet UITextField *textfieldHeures;
    
}


@property (nonatomic, retain) IBOutlet UITextField *textfieldSecondes;
@property (nonatomic, retain) IBOutlet UITextField *textfieldMinutes;
@property (nonatomic, retain) IBOutlet UITextField *textfieldHeures;



-(IBAction)textFieldReturn:(id)sender;
-(IBAction)seeModeRond :(id)sender;
-(IBAction)seePersonnalisation :(id)sender;

- (IBAction)goBack:(id)sender;

@end