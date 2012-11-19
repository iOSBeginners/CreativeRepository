//
//  ModeRondViewController.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClassiqueModeViewController.h"

extern int x1;
extern int x2;

@interface ModeTriangleViewController : UIViewController
{

    IBOutlet UIButton *myBouton;

}

@property(nonatomic,retain)   IBOutlet UIButton *myBouton;

- (IBAction)goBack:(id)sender;

-(IBAction)toggleButton:(id)sender;

@end
