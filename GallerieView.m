//
//  GallerieView.m
//  Autitimer
//
//  Created by Antoine Piret on 30/10/12.
//
//

#import "GallerieView.h"

@implementation GallerieView

//la classe doit être de type UIControl

-(IBAction)backgroundTouche:(id)sender
{
    
    //se permet de cacher le clavier si on clique n'importe ou dans l'écran
    //sa ne marche que dans une classe de type UIControl
    [self endEditing:YES];
    
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
