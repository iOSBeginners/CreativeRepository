//
//  ImageAlbumDetail.h
//  Autitimer
//
//  Created by Piret on 09/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface ImageAlbumDetail : UIViewController
{
    UIImage *image;
    IBOutlet UIImageView *imageD;

    int test;
 

    IBOutlet UIButton *monBouton;
}

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageD;

@property (strong, nonatomic) IBOutlet UIButton *monBouton;


- (IBAction)goBack:(id)sender;
- (IBAction)goHome:(id)sender;

@end
