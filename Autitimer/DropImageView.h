//
//  ModeRond.h
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DropImageView : UIView 
{
    IBOutlet UIScrollView  *scrollView;
    IBOutlet UIButton *openMenu;
    int draw1;
}


@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;


- (IBAction)NextView:(id)sender;

- (IBAction)openMenu:(id)sender;








@end
