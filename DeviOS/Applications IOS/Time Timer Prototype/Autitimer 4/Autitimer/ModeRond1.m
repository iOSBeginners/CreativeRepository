//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeRond1.h"
#import "ModeRondViewController1.h"
#import "PersonnalisationViewController.h"
#import "ClassiqueModeViewController.h"

NSTimer *myTimer;

@implementation ModeRond1

@synthesize labelChronoSecondes, labelChronoMinutes, labelChronoHeures, label,audioPlayer;




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
        
            
//UIImage *img = [UIImage imageNamed:@"bouton-1-heure.png"];   
//UIImage *image = [UIImage imageNamed:@"forme-super.png"];  

//            //superposer deux images
//            UIImage *backgroundImage = [UIImage imageNamed:@"bouton-1-heure.png"];
//            UIImage *watermarkImage = [UIImage imageNamed:@"forme-super.png"];
//            
//            UIGraphicsBeginImageContext(backgroundImage.size);
//            [backgroundImage drawInRect:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)];
//            [watermarkImage drawInRect:CGRectMake(backgroundImage.size.width - watermarkImage.size.width, backgroundImage.size.height - watermarkImage.size.height, watermarkImage.size.width, watermarkImage.size.height)];
//            UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//            NSLog(@"entrer sa va ")

            
            
            
            
            //pour insérer une partie d'une image dans une position de l'écran bien déterminé 
            //testé sa marche
//                 UIImage *imageToCrop = [UIImage imageNamed:@"fond-forme-01.png"];
//
//            CGContextRef currentContext = UIGraphicsGetCurrentContext();
//            
//            CGRect clippedRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
//            CGContextClipToRect( currentContext, clippedRect);
//            //x: le premier de gauche à droite
//            //y: dexiéme de haut en bas
//            //z:le troisiéme paramétre c'est la largeur de la coupe de l'image
//            //w:le quatriéme paramétre c'est la hauteur de la coupe de l'image
//            CGRect drawRect = CGRectMake(100,
//                                         300,
//                                         300,
//                                         300);
//            
//            CGContextDrawImage(currentContext, drawRect, imageToCrop.CGImage);
//            
//            UIImage *cropped = UIGraphicsGetImageFromCurrentImageContext();
//            
//            UIGraphicsEndImageContext();
//
//            // Drawing code
           CGContextRef context = UIGraphicsGetCurrentContext();

//            
//            //Fond
//            //c'est le cercle jaune c'est juste le fond quand on efface le cercle blei le cercle jaune apparait
//            //on mélange deux colleurs pour avoir le jaune
//            CGContextSetRGBFillColor(context, 255, 255, 0.0, 1.0);
//la couleur de remplissage gris à 50 %
//             CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 1.0); 
// nuance de gris
             CGContextSetGrayFillColor(context, 0.5, 1.0); 
            CGContextAddArc( context, 170.545, 325.8235, 120, M_PI * 0 , M_PI * 2, false);
            CGContextFillPath(context);
            // And draw with a white(blanc) fill color
            CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
            // Draw them with a 2.0 stroke width so they are a bit more visible.
            CGContextSetLineWidth(context, 2.0);
            //camembert
            //premier et deuxiéme paramétre ce sont les coordonnées du cercle bleu
            // 3 éme paramétre c'est la largeur du diamétre
            CGContextAddArc( context, 170.545, 325.8235, 120, k , M_PI * 2, false);
            CGContextAddArcToPoint(context, 170.545, 325.8235,60, 60, 0);
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
//        CGContextSetRGBFillColor(context, 255, 255, 0.0, 1.0);
 CGContextSetGrayFillColor(context, 0.5, 1.0); 
        CGContextAddArc( context, 170.545, 325.8235, 120, M_PI * 0 , M_PI * 2, false);
        CGContextFillPath(context);
        //stop the timer
        [myTimer invalidate];
        //on élimine la variable d'instance(myTimer) au cas ou on invoque la fonction invalidate a nouveau sa ne génére pas d'excéption 
        myTimer = nil;
        //jouer un son à la fin
        NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                               [[NSBundle mainBundle] 
                                pathForResource:@"norecording" ofType:@"wav"]];
        self.audioPlayer =  [[AVAudioPlayer alloc] 
                             initWithContentsOfURL:noSoundFileURL error:nil];
        [self.audioPlayer play];
        label.text = @"fini";
    }
    
}




@end
