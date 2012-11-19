//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeRondViewController12.h"
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVAudioPlayer.h>
@interface ModeRond12 : UIView {
    
    float m;
    float x,k,g;
    float decompte;
    float touchChrono;
    float chronoSecondes;
    float chronoMinutes;
    float chronoHeures;
    IBOutlet UILabel *labelChronoMinutes;
    IBOutlet UILabel *labelChronoSecondes;
    IBOutlet UILabel *labelChronoHeures;
    IBOutlet UILabel *label;
    
    
}


@property (nonatomic, retain) IBOutlet UILabel *labelChronoMinutes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoSecondes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoHeures;
@property (nonatomic, retain) IBOutlet UILabel *label;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


- (IBAction)pushTop :(id)sender ;
- (void)drawRect:(CGRect)rect; 




@end
