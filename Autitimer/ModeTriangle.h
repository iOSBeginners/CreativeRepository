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
    float x,k,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,g,p,pas1,pas2,pas3,pas4,pas5,pas6,pas7,pas8,pas9,pas10,pas11,pas12,pas13,distanceSegment1,distanceSegment2,distanceSegment3,distanceSegment4,distanceSegment5,distanceSegment6,distanceSegment7,distanceSegment8,distanceSegment9,distanceSegment10,distanceSegment11,distanceSegment12,distanceSegment13,pourcentage1,pourcentage2,pourcentage3,pourcentage4,pourcentage5,pourcentage6,pourcentage7,pourcentage8,pourcentage9,pourcentage10,pourcentage11,pourcentage12,pourcentage13;
    int passe1,passe2,passe3,passe4,passe5,passe6,passe7,passe8,passe9,passe10,passe11,passe12,passe13,complet1,complet2,complet3,complet4,complet5,complet6,complet7,complet8,complet9,complet10,complet11,complet12,complet13,touch;
    float decompte;
    float touchChrono;
    float chronoSecondes;
    float chronoMinutes;
    float chronoHeures;
    IBOutlet UILabel *labelChronoMinutes;
    IBOutlet UILabel *labelChronoSecondes;
    IBOutlet UILabel *labelChronoHeures;
    
}

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoMinutes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoSecondes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoHeures;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


- (IBAction)pushTop :(id)sender ;
- (void)drawRect:(CGRect)rect; 




@end
