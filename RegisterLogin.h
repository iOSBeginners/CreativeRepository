//
//  RegisterLogin.h
//  Autitimer
//
//  Created by Piret on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface RegisterLogin : UIViewController
{  NSString        *databasePath;
        sqlite3 * contactDB;
    IBOutlet UITextField *login;
    IBOutlet UITextField *nom;
    IBOutlet UITextField *password;
    
    IBOutlet UITextField *password2;
    int passe;
    int idOne;
    NSURLConnection *postConnection;
}
- (IBAction)goHome:(id)sender;

- (IBAction)goHomeLogin:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *password;


@property (strong, nonatomic) IBOutlet UITextField *password2;

@property (strong, nonatomic) IBOutlet UITextField *login;
- (IBAction)doneButton:(id)sender;
- (IBAction)Home:(id)sender;

@end
