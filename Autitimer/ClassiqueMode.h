//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClassiqueModeViewController.h"

@interface ClassiqueMode: UIControl
{
    IBOutlet UIScrollView  *scrollView;

    IBOutlet UIImageView *animation;
   
    IBOutlet UIImageView *forme1;
}
@property (strong, nonatomic) IBOutlet UIButton *boutonL;

@property (strong, nonatomic) IBOutlet UIButton *boutonR;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIImageView *animation;

@property (strong, nonatomic) IBOutlet UIImageView *forme1;

-(IBAction) arrowRight:(id)sender;


-(IBAction) arrowLeft:(id)senderr;


- (IBAction)backgroundTouched:(id)sender;

@end
