//
//  CompteConnecter.m
//  Autitimer
//
//  Created by Antoine Piret on 08/11/12.
//
//

#import "CompteConnecter.h"
#import "PlusInfo.h"
#import "RootViewController.h"

@interface CompteConnecter ()

@end

@implementation CompteConnecter
- (IBAction)goBack:(id)sender {
    RootViewController *gB=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:gB animated:YES];
}

-(IBAction)goInfo:(id)sender{
    
    PlusInfo *pI=[[PlusInfo alloc]initWithNibName:@"PlusInfo" bundle:nil];
    [self.navigationController pushViewController:pI animated:YES];
    
}

//- (IBAction)Sedeconnecter:(id)sender {
//    
//    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Confirmer déconnection"
//                                                      message:@"Etes-vous sûr de vouloir vous déconnecter"
//                                                     delegate:self
//                            
//                                            cancelButtonTitle:@"Se déconnecter"
//                                            otherButtonTitles:@"Retour", nil];
//    [message show];
//    
//    
//    
//    
//    
//    
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"compteFr1.db"]];
    
    const char *dbpath = [databasePath UTF8String];
    
    if([title isEqualToString:@"Supprimer"])
    {
        sqlite3_stmt    *statement1;
        

        NSString *deleteSQL=nil ;
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            deleteSQL = [NSString stringWithFormat: @"DELETE FROM COMPTE WHERE ID = ?"];
            
            
            const char *delete_stmt = [deleteSQL UTF8String];
            
            sqlite3_prepare_v2(contactDB, delete_stmt, -1, &statement1, NULL);
            //ici l'indice 1 indique non pas l'ordre dans la base de données mais l'ordre des paramètres dans la requête SQL :)
           
            if(sqlite3_bind_int(statement1, 1, 1)!=SQLITE_DONE)
                NSLog(@"bind failed");
            
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {//quand on ajoute le contact on mait à jour la statut et on vide les champs de texte
                NSLog( @"Contact Deleted");
                
            } else {
                NSLog( @"Failed to Delete contact");
            }
            sqlite3_finalize(statement1);
            sqlite3_close(contactDB);
        }
        
        RootViewController *CLogin=[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:Nil ];
        [self.navigationController pushViewController:CLogin animated:YES];

    }
//    else if([title isEqualToString:@"Se déconnecter"]){
//        sqlite3_stmt    *statement1;
//        
//        const char *dbpath = [databasePath UTF8String];
//        NSString *updateSQL=nil ;
//        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
//        {
//            updateSQL = [NSString stringWithFormat: @"UPDATE COMPTE SET BOOLCONNECT= ?"];
//            
//            
//            const char *update_stmt = [updateSQL UTF8String];
//            
//            sqlite3_prepare_v2(contactDB, update_stmt, -1, &statement1, NULL);
//              sqlite3_bind_int(statement1, 3, 0);
//
//            if (sqlite3_step(statement1) == SQLITE_DONE)
//            {//quand on ajoute le contact on mait à jour la statut et on vide les champs de texte
//                NSLog(@"compte Déconnecter");
//       
//            } else {
//                 NSLog( @"Failed to Deconnect compte");
//            }
//            sqlite3_finalize(statement1);
//            sqlite3_close(contactDB);
//        }
//        RootViewController *CLogin=[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:Nil ];
//        [self.navigationController pushViewController:CLogin animated:YES];
//    }
   
}
- (IBAction)SupprimerCompte:(id)sender {
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Confirmer Suppression"
                                                      message:@"Etes-vous sûr de vouloir supprimer définitivement votre compte ?  Cela entraînera la suppression de toutes vos données de compte Auticiel"
                                                     delegate:self
                
                                            cancelButtonTitle:@"Retour"
                                            otherButtonTitles:@"Supprimer", nil];
    [message show];
    
    
    
        
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
