//
//  ConnectLogin.h
//  Autitimer
//
//  Created by Piret on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface ConnectLogin : UIViewController <UIAlertViewDelegate>
{
    int passe2;
    int passe3;
    IBOutlet UITextField *passwordC;

    IBOutlet UITextField *loginC;
    int passe;
     NSString        *databasePath;
     sqlite3 * contactDB;
    NSString *nomC;
    int existDeconnect;
}

@property (strong, nonatomic) IBOutlet UITextField *passwordC;

@property (strong, nonatomic) IBOutlet UITextField *loginC;

- (IBAction)goHome:(id)sender;

- (IBAction)Home:(id)sender;

- (IBAction)doneButton:(id)sender;


@end
