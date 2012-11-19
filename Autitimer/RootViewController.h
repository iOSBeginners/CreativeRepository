//
//  RootViewController.h
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//




@interface RootViewController : UIViewController <UIActionSheetDelegate,UIAlertViewDelegate> {
    NSString        *databasePath;
    sqlite3 * contactDB;
    int passeBoucle;
    IBOutlet UILabel *label;

    NSString *nomLabel;
    int existRow;
    NSString *loginInput;
    NSString *passwordInput;
    NSString *nomEnfant;
    NSString *nomC;
    NSString *buttonPressedName;
        NSURLConnection *postConnection;
    //variable booléenne pour voir compte trouvé ou pas dans la base de données distante
    
    int compteTrouve;
    
    
    //c'est une variable booléenne qui permet de savoir si  on appuiyé sur le bouton connect ou register
    int connect;
    
}

@property (strong, nonatomic)  NSString *loginInput;
@property (strong, nonatomic)  NSString *passwordInput;
@property (strong, nonatomic)  NSString *nomEnfant;
@property (strong, nonatomic) IBOutlet UILabel *label;
- (IBAction)goImage:(id)sender;


- (IBAction)seeClassiqueMode: (id)sender;

- (IBAction)seeTempsPredefinis: (id)sender;


- (IBAction)goGestionCompte:(id)sender;


@end
