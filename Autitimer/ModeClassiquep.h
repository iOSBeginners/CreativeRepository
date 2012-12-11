//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ModeClassiqueViewController.h"
#import "ChoisirImageAlbum.h"

extern float k5;
extern NSTimer *myTimer;
extern NSTimer *myTimer1;
extern NSTimer *myTimer2;
extern UIImage *image10;

@interface ModeClassiquep : UIView {
    int draw1,touch;
    float m,h1,j1,k1,l1;
    float x,k,g,b2,x1,y1,z1,w1;
    float decompte;
    float touchChrono;
    float chronoSecondes;
    float chronoMinutes;
    float chronoHeures;
    IBOutlet UILabel *labelChronoMinutes;
    IBOutlet UILabel *labelChronoSecondes;
    IBOutlet UILabel *labelChronoHeures;

    
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;

    IBOutlet UIButton *bouton1;
    UIImage *theImage;
    
    NSString        *databasePath;
    
    IBOutlet UIImageView *image77;
    sqlite3 * contactDB;
}
@property (strong, nonatomic) IBOutlet UIImageView *image77;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@property (nonatomic, retain) IBOutlet UIButton *bouton1;
@property (nonatomic, retain) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIImageView *image2;


@property (nonatomic, retain) IBOutlet UILabel *labelChronoMinutes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoSecondes;
@property (nonatomic, retain) IBOutlet UILabel *labelChronoHeures;

-(IBAction)ShowImage:(id)sender;

- (IBAction)pushTop :(id)sender ;
- (void)drawRect:(CGRect)rect; 




@end
