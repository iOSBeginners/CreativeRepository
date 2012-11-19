//
//  ConnectLogin.m
//  Autitimer
//
//  Created by Piret on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConnectLogin.h"
#import "RootViewController.h"
#import "SBJson.h"
@implementation ConnectLogin
@synthesize passwordC;
@synthesize loginC;
- (IBAction)doneButton:(id)sender {
    
    [loginC resignFirstResponder];
    
    [passwordC resignFirstResponder];

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
passwordC.secureTextEntry = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    loginC = nil;
    [self setLoginC:nil];
    passwordC = nil;
    [self setPasswordC:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//vérifier que le format du mail est valide
- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
//si le format n'est pas valide afficher une alert
- (void)checkEmailAndDisplayAlert {
    if(![self validateEmail:[loginC text]]) {
        // user entered invalid email address
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Entrer une adresse mail valide ." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        passe2=1;
        [alert show];
        
    } else {
        passe2=0;
        // user entered valid email address
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{NSLog(@"Bouton clicked");
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"compteFr1.db"]];
    
    const char *dbpath = [databasePath UTF8String];
    
    if([title isEqualToString:@"Se Connecter"])
    {
            if(existDeconnect==0)
            {  sqlite3_stmt    *statement;
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {//doit être en majuscule la requête sinon sa ne marche pas
            NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO COMPTE (ID, LOGIN,PASSWORD) values (?,?,?)"];
            
            
            
            const char *insert_stmt = [insertSQL UTF8String];
            
            sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
            sqlite3_bind_int(statement,1,1);
            sqlite3_bind_text(statement,2,[loginC.text UTF8String],-1,SQLITE_TRANSIENT);
            sqlite3_bind_text(statement,3,[passwordC.text UTF8String],-1,SQLITE_TRANSIENT);

            
            if (sqlite3_step(statement) == SQLITE_DONE)
            {//quand on ajoute le contact on mait à jour la statut et on vide les champs de texte
                NSLog( @"Contact added");
                
                
            } else {
                NSLog(@"Failed to add contact");
            }
            sqlite3_finalize(statement);
            sqlite3_close(contactDB);}

                    
        }
        
        
        RootViewController *CLogin=[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:Nil ];
        //        CLogin.label.text=nomC;
        [self.navigationController pushViewController:CLogin animated:YES];
        
        
        }
        }
- (IBAction)Home:(id)sender {

    if ([loginC.text isEqualToString:@""]|| [passwordC.text isEqualToString:@""]) 
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Vous devez remplir tout les champs " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //on utilise la variable passe1 pour empéché l'exécution du code qui permet de passer à la page suivante au cas ou les champ de a saisie du temps son vide
        passe3=1;
        passe2=1;
        [alert show];
    }
    if(passe3==0)
     [self checkEmailAndDisplayAlert];
    if(passe2==0)
    {
        SBJsonParser* parser = [[SBJsonParser alloc] init];
        // On initialise un objet NSURLRequest, avec l'URL qui va bien
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8888/getCompte.php"]];
        // On récupère le résultat de la requête
        NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        // On transforme le résultat en String
        NSString* jsonString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        // On parse le tout en un NSArray
        NSArray *comptes = [parser objectWithString:jsonString error:nil];
        // On initialise le parser
        
        // On initialise le parser
        
        // Ensuite, on peut tout afficher, ou en faire ce qu'on veut...
        for (NSDictionary  *compte in  comptes) {
            
            
            
            NSString *chaineLogin= [compte objectForKey:@"login"];
            NSLog(@"%@",chaineLogin);
            NSString *chainePassword= [compte objectForKey:@"password"];
            
            NSLog(@"%@",chainePassword);
            
if([chaineLogin isEqualToString:loginC.text]&&[chainePassword isEqualToString:passwordC.text])
            {
                NSString *chaineNom= [compte objectForKey:@"nom"];
                NSLog(@"%@",chaineNom);
                nomC=chaineNom;
                NSLog(@"compte trouvé" );
                passe=1;}
            
        }
    }
        // si exisrDeconnect c'est a dire il n'y a pas un compte déjà créer donc on va chercher coté web si il y a un compte qui correspond ou non
//        if(existDeconnect==0)
//        {
//
//    }
    
 
    if(passe==1)
    {NSLog(@"le nom est %@",nomC);
      
        UIAlertView * alert3 = [[UIAlertView alloc] initWithTitle:@"Information" message:@"On a trouvé votre compte .  Voulez vous se connecter !! " delegate:self cancelButtonTitle:@"Retour" otherButtonTitles:@"Se Connecter",nil];
        [alert3 show];

    }
    else 
    {  NSLog(@"compte pas trouvé" );
         UIAlertView * alert1 = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Votre Compte n'est pas trouvé veuillez Réessayez" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
                                }
    
    passe=0;
    passe2=0;
    passe3=0;
}
- (IBAction)goHome:(id)sender {
    RootViewController *gB=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:gB animated:YES];
}
@end
