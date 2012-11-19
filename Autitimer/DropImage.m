//
//  ModeRondViewController.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropImage.h"


@implementation DropImage




- (IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"DropImage";
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
   
    // Create the image from a png file
//    UIImage *image = [UIImage imageNamed:@"recette.jpg"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    
//    // Get size of current image
//    CGSize size = [image size];
//    
//    // Frame location in view to show original image
//    [imageView setFrame:CGRectMake(0, 0, size.width, size.height)];
//    [[self view] addSubview:imageView];
//    
//    
//    // Create rectangle that represents a cropped image  
//    // from the middle of the existing image
//    //trosième paramètre représente la largeur de la coupe
//    //quatriéme paramètre représente la hauteur de la coupe
//    CGRect rect = CGRectMake(0, 400 ,(size.width ), 80);
//    
//    // Create bitmap image from original image data,
//    // using rectangle to specify desired crop area
//    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
//    UIImage *img = [UIImage imageWithCGImage:imageRef]; 
//    CGImageRelease(imageRef);
//    
//    // Create and show the new image from bitmap data
//    imageView = [[UIImageView alloc] initWithImage:img];
//    //partie de l'image à insérer
//    //premièr et deuxième paramètre représente la position du coin haut gauche ou on va insérer l'image
//    //troisiéme et quatriéme paramètre représente la dimension de la partie de l'image à représenté
//    [imageView setFrame:CGRectMake(0,0, (size.width ),80)];
//    [[self view] addSubview:imageView];
    
    
    

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
