//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


extern NSTimer *myTimer;

@interface ImageAlbumD : UIView {
    IBOutlet UIImageView *image1;
    int touchChrono;
    float x;
    float pas;

    float chronoSecondes;
    float chronoMinutes;
    float chronoHeures;
    IBOutlet UILabel *labelChronoMinutes;
    IBOutlet UILabel *labelChronoSecondes;
    IBOutlet UILabel *labelChronoHeures;

    IBOutlet UILabel *minute;

    IBOutlet UILabel *heure;
    
    IBOutlet UILabel *seconde;
    UIImage *image ;
}


@property (strong, nonatomic) IBOutlet UILabel *seconde;

@property (strong, nonatomic) IBOutlet UILabel *minute;

    
- (IBAction)pushTop:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *heure;

@property (nonatomic, retain) IBOutlet UILabel *labelChronoMinutes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoSecondes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoHeures;

@property (strong, nonatomic) IBOutlet UIImageView *image1;


@end
