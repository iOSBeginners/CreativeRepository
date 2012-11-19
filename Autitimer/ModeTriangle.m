//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeTriangle.h"
#import "ModeTriangleViewController.h"

#import "ClassiqueModeViewController.h"

NSTimer *myTimer;

@implementation ModeTriangle
@synthesize textfield;

@synthesize labelChronoSecondes, labelChronoMinutes, labelChronoHeures,audioPlayer;




- (IBAction)pushTop :(id)sender {
    
    if(touch==0)
    {b=0.04;
        touch=1;
    }
    if(touchChrono==1)
    {    
        [myTimer invalidate]; 
        
        
        
        
        
    }
    
    
    
    
    if(touchChrono==0)
    {
        
        
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
            
             CGContextSetRGBFillColor(context, 255, 255, 255.0, 1.0);
            //Fond
            
            

            CGContextAddArc( context, 160, 315, 120, M_PI * 0 , M_PI * 2, false);
            CGContextFillPath(context);
            // And draw with a blue fill color
            if(decompte<(2*a)/3)
                CGContextSetRGBFillColor(context,0x7f/255.0, 0xff/ 255.0, 0x00/ 255.0, 0.6);
            //rouge
            else
                CGContextSetRGBFillColor(context,0xff/255.0, 0x24/ 255.0, 0x00/ 255.0, 1.0);
            // Draw them with a 2.0 stroke width so they are a bit more visible.
            CGContextSetLineWidth(context, 2.0);
            //camembert
            CGContextAddArc( context, 160, 315, 120, (M_PI*1.5)+k , M_PI * 3.5, false);
            CGContextAddArcToPoint(context, 160, 315, 60, 60, 00);
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
        
        CGContextSetRGBFillColor(context, 255, 255, 255.0, 1.0);
        CGContextAddArc( context, 160, 315, 120, M_PI * 0 , M_PI * 2, false);
        CGContextFillPath(context);
        //stop the timer
        [myTimer invalidate];
        //on élimine la variable d'instance(myTimer) au cas ou on invoque la fonction invalidate a nouveau sa ne génére pas d'excéption 
        myTimer = nil;
        

    }
    
    
    
    
}




@end
