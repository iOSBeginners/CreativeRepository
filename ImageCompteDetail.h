//
//  ImageAlbumDetail.h
//  Autitimer
//
//  Created by Piret on 09/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface ImageCompteDetail : UIViewController
{
    UIImage *image;
    IBOutlet UIImageView *imageD;

    NSString *texte;
    IBOutlet UIImageView *barreVerte;
    int test;
    IBOutlet UIButton *monBouton;
}

@property (strong, nonatomic)     IBOutlet UIButton *monBouton;

@property (strong, nonatomic)    IBOutlet UIImageView *barreVerte;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageD;


@property (nonatomic,retain) NSString *texte;


-(IBAction)toggleButton:(id)sender;
- (IBAction)goBack:(id)sender;

-(IBAction)goHome:(id)sender;

@end
