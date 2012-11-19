//
//  ModeRondViewController.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ClassiqueModeViewController.h"

extern int test;
extern int w;
extern int x1;

@interface ModeClassiqueViewController : UIViewController

{UIImage *image10;}
@property (weak, nonatomic) IBOutlet UIButton *myBouton;

- (IBAction)goHome:(id)sender;

- (IBAction)goBack:(id)sender;

-(IBAction)toggleButton:(id)sender;
@end
