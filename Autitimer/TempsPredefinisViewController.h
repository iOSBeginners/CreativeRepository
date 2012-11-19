//
//  TempsPredefinisViewController.h
//  Autitimer
//
//  Created by Piret on 02/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


extern float a;

@interface TempsPredefinisViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *bouton30s;
@property (strong, nonatomic) IBOutlet UIButton *bouton1m;
@property (strong, nonatomic) IBOutlet UIButton *bouton5m;

@property (strong, nonatomic) IBOutlet UIButton *bouton10m;
@property (strong, nonatomic) IBOutlet UIButton *bouton15m;
@property (strong, nonatomic) IBOutlet UIButton *bouton20m;
@property (strong, nonatomic) IBOutlet UIButton *bouton30m;
@property (strong, nonatomic) IBOutlet UIButton *bouton45m;
@property (strong, nonatomic) IBOutlet UIButton *bouton1h;
@property (strong, nonatomic) IBOutlet UIButton *bouton2h;

- (IBAction)seeTempsPredefini1:(id)sender;
- (IBAction)seeTempsPredefini2:(id)sender;
- (IBAction)seeTempsPredefini3:(id)sender;
- (IBAction)seeTempsPredefini4:(id)sender;
- (IBAction)seeTempsPredefini5:(id)sender;
- (IBAction)seeTempsPredefini6:(id)sender;
- (IBAction)seeTempsPredefini7:(id)sender;
- (IBAction)seeTempsPredefini8:(id)sender;
- (IBAction)seeTempsPredefini9:(id)sender;
- (IBAction)seeTempsPredefini10:(id)sender;

- (IBAction)goBack:(id)sender;


@end
