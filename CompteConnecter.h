//
//  CompteConnecter.h
//  Autitimer
//
//  Created by Antoine Piret on 08/11/12.
//
//


@interface CompteConnecter : UIViewController
{
    NSString        *databasePath;
    sqlite3 * contactDB;
}
- (IBAction)goBack:(id)sender;


-(IBAction)goInfo:(id)sender;

//- (IBAction)Sedeconnecter:(id)sender;

- (IBAction)SupprimerCompte:(id)sender;


@end
