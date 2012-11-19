//
//  ModeRondViewController.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


extern int x1;
extern int w;

@interface ModeRondViewController1 : UIViewController
{
    int test;
    IBOutlet UIButton *myBouton;

}

@property(nonatomic,retain) IBOutlet UIButton *myBouton;

- (IBAction)goBack:(id)sender;

-(IBAction)toggleButton:(id)sender;

@end
