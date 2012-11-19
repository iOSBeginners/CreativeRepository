//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeRondViewController1.h"
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface ModeRond1 : UIView {
    
    int touch;
    float m;
    float x,k,g,b2,x11,y1,z1,w1;
    float decompte;
    float touchChrono;
    float chronoSecondes;
    float chronoMinutes;
    float chronoHeures;
    IBOutlet UILabel *labelChronoMinutes;
    IBOutlet UILabel *labelChronoSecondes;
    IBOutlet UILabel *labelChronoHeures;


}


@property (nonatomic, retain) IBOutlet UILabel *labelChronoMinutes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoSecondes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoHeures;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

- (IBAction)pushTop :(id)sender ;
- (void)drawRect:(CGRect)rect; 




@end
