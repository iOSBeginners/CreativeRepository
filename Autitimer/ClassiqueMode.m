//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClassiqueMode.h"
#import "ModeRondViewController1.h"
#import "ClassiqueModeViewController.h"
#import "ModeTriangleViewController.h"
@implementation ClassiqueMode


@synthesize boutonL;
@synthesize boutonR;
@synthesize scrollView;
@synthesize animation;
@synthesize forme1;

- (IBAction)backgroundTouched:(id)sender {
    [self endEditing:YES];
}

-(IBAction) arrowRight:(id)sender{

    if(x==-640)
    {
//        NSLog(@"je suis le -960 Image");
        UIImage *image23=[UIImage imageNamed:@"triangleT.png"];
        forme1.image=image23;
        x=-960;}
 
    else if(x==-320)
    {
        x=-640;
//        NSLog(@"je suis le -640 classique ");
        UIImage *image23=[UIImage imageNamed:@"classiqueT.png"];
        forme1.image=image23;
    }
    else    if(x==0)
    {x=-320;
//        NSLog(@"je suis le 320 serpentin ");
        UIImage *image23=[UIImage imageNamed:@"serpentinT.png"];
        forme1.image=image23;}

    else
        {
//            NSLog(@"je suis le 0 cercle");
            UIImage *image23=[UIImage imageNamed:@"cercleT.png"];
            forme1.image=image23;
            x=0;}
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];

    //si on veut affiché le deuxième bouton
    scrollView.frame=CGRectMake(x, 200, 1600, 137);

//si on veut que les boutons soit en dessus du scollView il faut mettre les boutons soit aprés le scollView dans la méthode bringSubViewTofront
 [self bringSubviewToFront:scrollView];

    [UIView commitAnimations]; 
    boutonR.frame=CGRectMake(293, 210, 31, 61);
    boutonL.frame=CGRectMake(4, 210, 31, 61);
    [self bringSubviewToFront:boutonL];
    [self bringSubviewToFront:boutonR];
}


-(IBAction) arrowLeft:(id)sender{
    
if(x==0)
{
//    NSLog(@"je suis le -1280 Triangle");
    UIImage *image23=[UIImage imageNamed:@"triangleT.png"];
    forme1.image=image23;
    x=-960;}

    else if(x==-960)
    {
        x=-640;
//        NSLog(@"je suis le -640 cercle ");
        UIImage *image23=[UIImage imageNamed:@"classiqueT.png"];
        forme1.image=image23;
    }
    else if (x==-640)
    {x=-320;
//        NSLog(@"je suis le 320 serpentin ");
        UIImage *image23=[UIImage imageNamed:@"serpentinT.png"];
        forme1.image=image23;}
    else 
    {
//        NSLog(@"je suis le 0 Classique");
        UIImage *image23=[UIImage imageNamed:@"cercleT.png"];
        forme1.image=image23;
        x=0;}
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];

    //si on veut affiché le deuxième bouton
    scrollView.frame=CGRectMake(x, 200, 1600, 137);
    
    [self bringSubviewToFront:scrollView];


    [UIView commitAnimations]; 

    boutonR.frame=CGRectMake(293, 210, 31, 61);
    boutonL.frame=CGRectMake(4, 210, 31, 61);
    [self bringSubviewToFront:boutonL];
    [self bringSubviewToFront:boutonR];
}





//équivalent de load View
//ce code s'applique avant le chargement de newWindow





-(void)willMoveToWindow:(UIWindow *)newWindow{
      forme1.frame=CGRectMake(173, 160, 43, 19);
     animation.frame=CGRectMake(200, 315, 43, 21);
    // comme les boutons sont caché par le scrollView on doit ajouter ses deux lignes pour les positionné en premier plan pour que les deux boutons soit visibles
    x=x1;
    if(chargementPremier==0)
    {x=-640;
        chargementPremier=1;}

    //position button for menu open
    boutonR.frame=CGRectMake(293, 210, 31, 61);
    boutonL.frame=CGRectMake(4, 210, 31, 61);

}



- (id)initWithFrame:(CGRect)frame
{

    
    self = [super initWithFrame:frame];
    if (self) {
     
        // Initialization code
    }
    return self;
    boutonR.frame=CGRectMake(293, 210, 31, 61);
    boutonL.frame=CGRectMake(4, 210, 31, 61);
    
    
    x=x1;

//    scrollView.frame=CGRectMake(x, 200, 320, 137);
    
    //hide scroll bar horizental and vertical
    
    [scrollView setShowsHorizontalScrollIndicator:NO];    
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    [scrollView setContentSize:CGSizeMake(1600, 137)];
    [self bringSubviewToFront:scrollView];
    [self bringSubviewToFront:boutonL];
    [self bringSubviewToFront:boutonR];
}



// Only override drawRect: if you perform custom drawing.





@end
