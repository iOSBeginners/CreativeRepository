//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageAlbumD.h"
#import "GallerieCompte.h"
NSTimer *myTimer;
@implementation ImageAlbumD
@synthesize image1,labelChronoHeures,labelChronoMinutes,labelChronoSecondes,heure,minute,seconde;



-(void) start{

    if(x<=250)
    {
        //convertir du type float vers string et l'afficher dans le label correspendant
        labelChronoSecondes.text = [NSString stringWithFormat:@"%.f", chronoSecondes];
        chronoSecondes = chronoSecondes + 0.04;
        

        
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
        
        
        

    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    

    // On va jouer sur la longueur de la barre qui est 250 et on va la varier selon le temps
    [imageView setFrame:CGRectMake(8, 55, x, 30)];

    x=x+pas;
        [self addSubview:imageView];
        //On doit appliquer ses fonctions après avoir ajouter l'image to the front of the view
        //pour que les libellées ne soit pas cacher par la barre du temps
        [self bringSubviewToFront:labelChronoHeures];
        [self bringSubviewToFront:labelChronoMinutes];
        [self bringSubviewToFront:labelChronoSecondes];
        [self bringSubviewToFront:heure];
        [self bringSubviewToFront:minute];
        [self bringSubviewToFront:seconde];
     }
    
}

- (IBAction)pushTop:(id)sender {
   image = [UIImage imageNamed:@"progressBar.png"];
    pas=((250*0.04)/a);
    if(touchChrono==1)
    {
        
        

        [myTimer invalidate];
        
        
        
        
        
    }
    
    
    
    
    if(touchChrono==0)
    {
        
        //        k = 0;
        
        
        
        
        myTimer=[NSTimer scheduledTimerWithTimeInterval: (0.04) target:self selector:@selector(start) userInfo:nil repeats:YES];
        
    }
    
    if(touchChrono==1)
        touchChrono=0;
    else
        touchChrono=1;
    

}


-(void)willMoveToWindow:(UIWindow *)newWindow{


}

- (id)initWithFrame:(CGRect)frame
{
  
    NSLog(@"la valeur de a est :%f",a);
 
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.

@end
