//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ModeTriangleViewController.h"
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "ClassiqueModeViewController.h"

@interface ModeTriangle : UIView {
    
    float j,m,Total,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,y,x1,a1,PasDP1,PasDP2;
    float g,k;
    int touch;
    float decompte;
    float touchChrono;
    float chronoSecondes;
    float chronoMinutes;
    float chronoHeures;
    IBOutlet UILabel *labelChronoMinutes;
    IBOutlet UILabel *labelChronoSecondes;
    IBOutlet UILabel *labelChronoHeures;
    
}

@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoMinutes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoSecondes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoHeures;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


- (IBAction)pushTop :(id)sender ;
- (void)drawRect:(CGRect)rect; 




@end
