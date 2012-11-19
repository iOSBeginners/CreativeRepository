//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeRond1h.h"
#import "TempsPredefini9ViewController.h"
#import "ModeRondViewController.h"
#import "TempsPredefinisViewController.h"
NSTimer *myTimer;

@implementation ModeRond1h

@synthesize labelChronoSecondes, labelChronoMinutes, labelChronoHeures, label;




- (IBAction)pushTop :(id)sender {
    
    
    if (touchChrono==0) {
        
        touchChrono = 1; // permet de ne pas relancer le chrono et d'apeller deux fois "chrono" si on retouche le bouton chrono
        
        
        // Il y a n = 2000 étapes pour aller de 0 à 2PI
        // Soit x la durée en secondes, il faut donc : b = x / 2000 appels de la fonction Display
        k = 0;
        b=0.04;
        decompte = 0;
        chronoHeures = 0;
        chronoMinutes = 0;
        chronoSecondes = 0;
        
        myTimer=[NSTimer scheduledTimerWithTimeInterval: (b) target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
        
    }
    
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
        
        label.text = @"";  
        
        //convertir du type float vers string et l'afficher dans le label correspendant
        labelChronoSecondes.text = [NSString stringWithFormat:@"%.f", chronoSecondes];
        chronoSecondes = chronoSecondes + b;
        decompte = decompte + b;
        
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
            
            
            //Fond
            CGContextSetRGBFillColor(context, 255, 255, 0.0, 1.0);
            CGContextAddArc( context, 160, 280, 120, M_PI * 0 , M_PI * 2, false);
            CGContextFillPath(context);
            // And draw with a blue fill color
            CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
            // Draw them with a 2.0 stroke width so they are a bit more visible.
            CGContextSetLineWidth(context, 2.0);
            //camembert
            CGContextAddArc( context, 160, 280, 120, k , M_PI * 2, false);
            CGContextAddArcToPoint(context, 160, 280, 60, 60, 00);
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
        // Dessiner le cercle jaune complet 
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, 255, 255, 0.0, 1.0);
        CGContextAddArc( context, 160, 280, 120, M_PI * 0 , M_PI * 2, false);
        CGContextFillPath(context);
        //stop the timer
        [myTimer invalidate];
        //on élimine la variable d'instance(myTimer) au cas ou on invoque la fonction invalidate a nouveau sa ne génére pas d'excéption 
        myTimer = nil;
        
        //Setup the audio player
    

        label.text = @"fini";
    }
    
}




@end
