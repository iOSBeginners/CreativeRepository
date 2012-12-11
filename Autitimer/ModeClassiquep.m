//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeClassique.h"
#import "ModeClassiqueViewController.h"
#import "ClassiqueModeViewController.h"
#import "ModeRondViewController1.h"
#import "TempsPredefinisViewController.h"

#import "math.h"
#import "ChoisirImageAlbum.h"

#import <AVFoundation/AVFoundation.h>
NSTimer *myTimer;
NSTimer *myTimer1;
NSTimer *myTimer2;
UIImage *image10;
@implementation ModeClassique
@synthesize myLabel;
@synthesize image2,image77;

@synthesize labelChronoSecondes, labelChronoMinutes, labelChronoHeures,bouton1,image1;

-(void)willMoveToWindow:(UIWindow *)newWindow{

    
//     self.backgroundColor = [UIColor clearColor];
    //initialisation dés le lancement de l'application
//    if(change==0)
//    {myLabel.text=@"Se Brosser les dents"; 
//        UIImage *plate1 = [UIImage imageNamed:@"brosseLesdents.jpg"];
//        [image1 setImage:plate1];}
//    else
//    {myLabel.text=myString;
//        
//        [self.image1 setImage:image10];}
//Initialisation
        h1=35;
        j1=155;
        k1=250;
        l1=250;
        x1=160;
        y1=280;
        z1=115;
        w1=110;
//        touch=1;
    

        image1.frame=CGRectMake(-158, 142, 158, 262);
        image2.frame=CGRectMake(h1, j1, k1, l1);
        bouton1.frame=CGRectMake(0, 200, 26, 51);

    }
-(IBAction)ShowImage:(id)sender{

}
- (IBAction)pushTop :(id)sender {
  
 // permet de ne pas relancer le chrono et d'apeller deux fois "chrono" si on retouche le bouton chrono

    if(touchChrono==1)
    {    
        b2=b;
     [myTimer invalidate]; 


    }

    if(touchChrono==0)
    {

//        k = 0;
        
 
        myTimer=[NSTimer scheduledTimerWithTimeInterval: (b) target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    }
    
if(touchChrono==1)
    touchChrono=0;
    else
        touchChrono=1;

}





- (id)initWithFrame:(CGRect)frame
{
    
    

    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.


- (void)drawRect:(CGRect)rect
{
   

    if (a > (decompte) ) {

        //convertir du type float vers string et l'afficher dans le label correspendant
        labelChronoSecondes.text = [NSString stringWithFormat:@"%.f", chronoSecondes];
           chronoSecondes = chronoSecondes + b;

        decompte=decompte+b;
        
        labelChronoMinutes.text = [NSString stringWithFormat:@"%.f", chronoMinutes];
        labelChronoHeures.text = [NSString stringWithFormat:@"%.f", chronoHeures];
        
        if (chronoSecondes >= 60) {
            chronoSecondes = 0;
            chronoMinutes = chronoMinutes + 1;
        }
        if (chronoMinutes >= 60) {
            chronoMinutes = 0;
            chronoHeures = chronoHeures + 1;
        }
        
        
        if (k<2*M_PI) {
            
            // Drawing code
            CGContextRef context = UIGraphicsGetCurrentContext();

            //on a due introduire un autre contexte
            CGContextRef context1 = UIGraphicsGetCurrentContext();
//bleu Ciel
           CGContextSetRGBFillColor(context1,0xff/255.0, 0x7f / 255.0, 0x00 / 255.0, 1.0);

            CGContextAddArc( context1, x1, y1, z1, M_PI * 0 , M_PI * 2, false);
                CGContextFillPath(context1);

            //couleur Blanc

            CGContextSetRGBFillColor(context1, 255, 255, 255, 1.0);

            CGContextAddArc( context, x1, y1, w1, M_PI * 0 , M_PI * 2, false);
            
            CGContextFillPath(context);
//vert
            if(decompte<((a/2)+(a/4)))
 CGContextSetRGBFillColor(context,0xff/255.0, 0x7f/ 255.0, 0x00/ 255.0, 1.0);
//rouge
            else
  CGContextSetRGBFillColor(context,0xff/255.0, 0x24/ 255.0, 0x00/ 255.0, 1.0);

            // Draw them with a 2.0 stroke width so they are a bit more visible.
            CGContextSetLineWidth(context, 2.0);
            //camembert
            //trosième paramétre c'est la longueur du diamétre 
            CGContextAddArc( context, x1, y1, w1, (M_PI*1.5)+k , M_PI * 3.5, false);
            CGContextAddArcToPoint(context, x1, y1, 60, 60, 00);
            CGContextFillPath(context);
        
            k=k+(((2 * M_PI)/a)/25);

       
        }
        
    }
    
    else {
        
        //la derniére seconde est déja incrémenter dans le premier if mais elle n'est pas stocké puisque les instruction de stockage viennenet avant l'incrémentation
        if(g==0)
        {
            
            labelChronoSecondes.text = [NSString stringWithFormat:@"%.f", chronoSecondes];
            labelChronoMinutes.text = [NSString stringWithFormat:@"%.f", chronoMinutes];
            labelChronoHeures.text = [NSString stringWithFormat:@"%.f", chronoHeures];
            
            g=g+1;
            
            
        }
        CGContextRef context1 = UIGraphicsGetCurrentContext();      
        //            UIColor *myColor = [UIColor colorWithRed:51.0f/255.0f green:102.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
        ////            //Fond
        //            CGContextSetRGBFillColor(context, 255, 255, 0.0, 1.0);
               
        CGContextSetRGBFillColor(context1,0xff/255.0, 0x7f / 255.0, 0x00 / 255.0, 1.0);


        
        CGContextAddArc( context1, x1, y1, z1, M_PI * 0 , M_PI * 2, false);
        CGContextFillPath(context1);
        // Dessiner le cercle jaune complet 
        CGContextRef context = UIGraphicsGetCurrentContext();
       //blanc
        CGContextSetRGBFillColor(context1, 255, 255, 255, 1.0);
        CGContextAddArc( context, x1, y1, w1, M_PI * 0 , M_PI * 2, false);
        CGContextFillPath(context);
          
        //stop the timer
        [myTimer invalidate];
        //on élimine la variable d'instance(myTimer) au cas ou on invoque la fonction invalidate a nouveau sa ne génére pas d'excéption 
        myTimer = nil;
        w=1;
        
        NSString *soundFilePath =
        [[NSBundle mainBundle] pathForResource: @"son"
                                        ofType: @"mp3"];
        
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
        
        AVAudioPlayer *newPlayer =
        [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                               error: nil];
     
        
        [newPlayer play];
        
     

    }
    
}




@end
