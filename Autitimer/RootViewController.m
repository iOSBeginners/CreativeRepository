//
//  RootViewController.m
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 Auticiel. All rights reserved.
//

#import "RootViewController.h"
#import "ClassiqueModeViewController.h"
#import "TempsPredefinisViewController.h"

#import "GallerieCompte.h"
#import "CompteConnecter.h"
#import "HomeLogin.h"
//#import "SBJson.h"
@implementation RootViewController
@synthesize label,loginInput,passwordInput,nomEnfant;

//respond to alert View on click button


- (IBAction)goImage:(id)sender {
    
    GallerieCompte *Gc=[[GallerieCompte alloc]initWithNibName:@"GallerieCompte" bundle:Nil];
    [self.navigationController pushViewController:Gc animated:YES];
         [Gc autorelease];
}

- (IBAction)seeClassiqueMode: (id)sender {
    
    ClassiqueModeViewController *detailVC = [[ClassiqueModeViewController alloc] initWithNibName:@"ClassiqueModeViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
        [detailVC autorelease];
}


- (IBAction)seeTempsPredefinis: (id)sender {
    
    TempsPredefinisViewController *detailVC = [[TempsPredefinisViewController alloc] initWithNibName:@"TempsPredefinisViewController" bundle:nil];
    
	[self.navigationController pushViewController:detailVC animated:YES];
    
        [detailVC autorelease];
}


- (IBAction)goGestionCompte:(id)sender {

    //On va tester si il y a internet selon la connexion on va être rediriger vers la bonne page
    //on a deux pages une pour le cas connecter et une autre pour le cas contraire
    
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"compteFr1.db"]];
    const char *dbpath = [databasePath UTF8String];
  
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT ID,LOGIN,PASSWORD FROM COMPTE "];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            //vérifier si la table est vide ou non
            //si la table est vide on va charger la view :ROOTViewController sinon on charge
            if (sqlite3_step(statement) == SQLITE_ROW)
            {NSLog(@"La base de donnée contient de(s) row(s)");
                existRow=1;
            }
            else {
                NSLog(@"La base de données est vide");
                existRow=0;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    
//on teste la connection
   if(existRow==1) {
    // connected
       
       CompteConnecter *cc=[[CompteConnecter alloc] initWithNibName:@"CompteConnecter" bundle:Nil ];
       [self.navigationController pushViewController:cc animated:YES  ];
           [cc autorelease];
       
   }
       else {
       //not connected
           HomeLogin *hl=[[ HomeLogin alloc]initWithNibName:@"HomeLogin" bundle:Nil];
           
                  [self.navigationController pushViewController:hl animated:YES  ];
           [hl autorelease];
       }
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"RootViewController";
        
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
    
//    label.text=nomLabel;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    label = nil;
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
