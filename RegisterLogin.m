//
//  RegisterLogin.m
//  Autitimer
//
//  Created by Piret on 16/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegisterLogin.h"
#import "RootViewController.h"
#import "HomeLogin.h"
@implementation RegisterLogin
@synthesize password,password2;


@synthesize login;

//hide the keyboard of text field when we press done button
- (IBAction)doneButton:(id)sender {
    
    [login resignFirstResponder];
    
    [password resignFirstResponder];
     [password2 resignFirstResponder];
      [nom resignFirstResponder];
}

//vérifier que le format du mail est valide
- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
//si le format n'est pas valide afficher une alert
- (void)checkEmailAndDisplayAlert {
    if(![self validateEmail:[login text]]) {
        // user entered invalid email address
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Entrer une adresse mail valide ." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        passe=1;
        [alert show];
     
    } else {
        passe=0;
        // user entered valid email address
    }
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
    password.secureTextEntry = YES;
    
    password2.secureTextEntry=YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    login = nil;
    [self setLogin:nil];
    password = nil;
    [self setPassword:nil];


    password2 = nil;
    [self setPassword2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//Action du bouton VALIDER
- (IBAction)Home:(id)sender {
   
    if ([login.text isEqualToString:@""]|| [password.text isEqualToString:@""]|| [password2.text isEqualToString:@""])
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Vous devez remplir tout les champs " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //on utilise la variable passe1 pour empéché l'exécution du code qui permet de passer à la page suivante au cas ou les champ de a saisie du temps son vide(l'utilisateur n'a pas saisie le temps)
        passe=1;
        [alert show];
    }
    if(passe==0)
         [self checkEmailAndDisplayAlert];
    if(passe==0){
        
        if (password.text==password2.text)
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Les mot de passe sont différent " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //on utilise la variable passe1 pour empéché l'exécution du code qui permet de passer à la page suivante au cas ou les champ de a saisie du temps son vide(l'utilisateur n'a pas saisie le temps)
            passe=1;
            [alert show];
        }
        
    }
        
    if(passe==0)
    {  
        
        
        //enregistrer dans la base de donnée sqlite(local)
        
        NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
        sqlite3_stmt    *statement;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0]; 
    
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"compteFr1.db"]];
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {//doit être en majuscule la requête sinon sa ne marche pas 
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO COMPTE (ID, LOGIN,PASSWORD) values (?,?,?)"];
        
        
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        sqlite3_bind_int(statement,1,1);      
        sqlite3_bind_text(statement,2,[login.text UTF8String],-1,SQLITE_TRANSIENT);
        sqlite3_bind_text(statement,3,[password.text UTF8String],-1,SQLITE_TRANSIENT);
       
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {//quand on ajoute le contact on mait à jour la statut et on vide les champs de texte
         NSLog( @"Contact added");
           
            
        } else {
            NSLog(@"Failed to add contact");
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }

//enregistrer dans la base de donnée distante SQL
        NSMutableString *postString = [NSMutableString stringWithString:kPostURL];

        [ postString appendString:[NSString stringWithFormat:@"?%@=%@",kLogin, login.text]];
        [ postString appendString:[NSString stringWithFormat:@"&%@=%@",kPassword, password.text]];
//        [ postString appendString:[NSString stringWithFormat:@"&%@=%@",kNom, nom.text]];
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        [request setHTTPMethod:@"POST"];
        postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        
        
    
    RootViewController *CLogin=[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:Nil ];
    [self.navigationController pushViewController:CLogin animated:YES];
    }
    passe=0;
}
- (IBAction)goHome:(id)sender {
    RootViewController *gB=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:gB animated:YES];
}

- (IBAction)goHomeLogin:(id)sender {
    HomeLogin *hl=[[ HomeLogin alloc]initWithNibName:@"HomeLogin" bundle:Nil];
    
    [self.navigationController pushViewController:hl animated:YES  ];

}
@end
