//
//  changerLibellé.h
//  Autitimer
//
//  Created by Piret on 01/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *myString;
@interface changerLibelle : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *bouton;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *b3;
-(IBAction)ClassicMode :(id)sender;
-(IBAction)textFieldReturn :(id)sender;
-(IBAction)goBack:(id)sender;
@end
