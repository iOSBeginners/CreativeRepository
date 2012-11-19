//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropImageView.h"



@implementation DropImageView

@synthesize scrollView;

- (IBAction)NextView:(id)sender{

}

//équivalent de load View
//ce code s'applique avant le chargement de newWindow

-(void)willMoveToWindow:(UIWindow *)newWindow{
    draw1=0;
    scrollView.frame=CGRectMake(0, -100, 320, 100);
    
    //hide scroll bar horizental and vertical
    
//    [scrollView setShowsHorizontalScrollIndicator:NO];    
//    [scrollView setShowsVerticalScrollIndicator:NO];

    [scrollView setContentSize:CGSizeMake(960, 100)];
    //position button for menu open
    openMenu.frame=CGRectMake(115, 24, 72, 37);
  scrollView.backgroundColor=[UIColor redColor];


}
- (IBAction)openMenu:(id)sender{
    
    if(draw1==0){
    
        draw1=1;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0.0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
        [UIButton beginAnimations:nil context:nil];
        [UIButton setAnimationDuration:0.5];
        [UIButton setAnimationDelay:0.0];
        [UIButton setAnimationCurve:UIViewAnimationCurveEaseOut];
        //si on veut affiché le deuxième bouton
//        scrollView.frame=CGRectMake(-640, 0, 960, 100);
                scrollView.frame=CGRectMake(-640, 0, 960, 100);
        openMenu.frame=CGRectMake(115, 126, 72, 37);
        [self bringSubviewToFront:scrollView];
        [UIView commitAnimations]; 
    }  
    else
    {draw1=0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0.0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        [UIButton beginAnimations:nil context:nil];
        [UIButton setAnimationDuration:0.5];
        [UIButton setAnimationDelay:0.0];
        [UIButton setAnimationCurve:UIViewAnimationCurveEaseOut];
        scrollView.frame=CGRectMake(0, -100, 320, 100);
        openMenu.frame=CGRectMake(115, 24, 72, 37);
        [UIView commitAnimations];
    
    
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





@end
