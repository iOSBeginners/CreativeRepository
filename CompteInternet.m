//
//  CompteInternet.m
//  Autitimer
//
//  Created by Piret on 03/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "ImageCompte.h"
#import "CompteInternet.h"
#import "GallerieCompte.h"
#import "RootViewController.h"
#import "ImageCompteDetail.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SBJson.h"
#import "Reachability.h"
#import "HomeLogin.h"
//ressource:  tutorial http://blog.adhumi.fr/parser-json-objective-c
NSString *loginMysql;
NSString *passwordMysql;
@implementation CompteInternet

@synthesize tableView,activity;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];

    if([title isEqualToString:@"Retour"])
    {
        GallerieCompte *gc=[[GallerieCompte alloc] initWithNibName:@"GallerieCompte" bundle:Nil];
        [self.navigationController pushViewController:gc animated:YES];
    }
else if([title isEqualToString:@"Register"])
{
    HomeLogin *hl=[[HomeLogin alloc] initWithNibName:@"HomeLogin" bundle:Nil];
    [self.navigationController pushViewController:hl animated:YES];

}
}

//fonction that resize an image
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, [[UIScreen mainScreen] scale]);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if(dontPasse==0)
    { UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	//Get the selected country
	NSString *texte = cell.textLabel.text;
	
	//Initialize the detail view controller and display it.
	ImageCompteDetail *dvController = [[ImageCompteDetail alloc] initWithNibName:@"ImageCompteDetail" bundle:[NSBundle mainBundle]];
	dvController.texte = texte;
    NSDictionary* info = [json objectAtIndex:indexPath.row];
    NSString *chaine3  = [info objectForKey:@"id"];
    int i = [chaine3 intValue];
    
    NSLog(@"Picked number %d ", i); 
    NSLog(@"%@",chaine3);

     NSString *chaine1  = [info objectForKey:@"filename"];
    NSString *chaine =  [NSString stringWithFormat:@"http://localhost:8888/images/%@", chaine1];
    //redimensionner l'image à partir de l'originale car si on prend l'image redimensionner on aura un e qualité d'image moin bonne
    [cell.imageView setImageWithURL:[NSURL URLWithString:chaine] ];
        cell.imageView.image = [self imageWithImage:cell.imageView.image scaledToSize:CGSizeMake(150, 150)];

    
    dvController.image=cell.imageView.image;
	[self.navigationController pushViewController:dvController animated:YES];
	
        dvController = nil;}
}


-(void) getData: (NSData *) data{

    NSError *error;
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

 [self.tableView reloadData];
 
}

-(void) start {
    if(dontPasse==0)
    { NSURL *url=[NSURL URLWithString:KGetUrl];
    NSData *data=[NSData dataWithContentsOfURL:url];
 
        [self getData:data];}
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     return [json count];

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
  
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    //unsigned lung  ---> %lu

 
//NSString *str1 = [array objectAtIndex:0];
    //c'est une nouvelle façon de parserun json en utilisant la bibliothéque SBJson

    
//    NSLog(@"je suis entrer");
if(dontPasse==0)
{ for(int l=0 ; l<size;l++)
    { NSString *str = [array objectAtIndex:l];
        int element=[str intValue];
        NSLog(@"l'élément numéro %d array est %d",l,element);
        if(id12==element){
            NSDictionary *info = [json objectAtIndex:indexPath.row];
            //    
            NSString *chaine22  = [info objectForKey:@"id"];
            id12=[chaine22 intValue];
            NSLog(@"%d",id12);
            NSString *chaine12  = [info objectForKey:@"filename"];
            NSString *chaine =  [NSString stringWithFormat:@"http://localhost:8888/images/%@", chaine12];
            //    
            [cell.imageView setImageWithURL:[NSURL URLWithString:chaine] ];
            //redimensionner l'image
            cell.imageView.image = [self imageWithImage:cell.imageView.image scaledToSize:CGSizeMake(40, 40)];
            //    
            cell.textLabel.text = chaine12;
                       [activity stopAnimating];
        }
        
    }
}
return cell;

    
}



-(IBAction)goBack:(id)sender{

    GallerieCompte *detailVC22 = [[GallerieCompte alloc] initWithNibName:@"GallerieCompte" bundle:nil];
    
    [self.navigationController pushViewController:detailVC22 animated:YES];}

- (void)viewDidLoad
{
    
    [activity startAnimating];
    NSLog(@"Compte Auticiel");
    NSTimer *myTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(start) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:myTimer forMode:NSDefaultRunLoopMode];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{ 
    Reachability *wifiReach = [Reachability reachabilityWithHostName: @"www.apple.com"];
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
    if(netStatus != NotReachable) {
    // connected
        NSLog(@"Connecter");
    
    //chercher le compte qui a comme ID=1
    
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
        NSString *querySQL = [NSString stringWithFormat: @"select * from compte where id=1"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
  int IdField = sqlite3_column_int(statement, 0);
         NSLog(@"l'id est :%d",IdField);
                NSString *loginField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                loginMysql=loginField;
                NSLog(@"le login est %@",loginMysql);
                
                NSString *passwordField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
               
                passwordMysql=passwordField;
                 NSLog(@"le password est%@",passwordMysql);

            } else {
                NSLog(@"Il n'y a pas de compte enregistrer");
                
                passe=1;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    
    //on vérifie qu'on a bien trouver le compte avec l'id=1
    
    
   if(passe==0)
   {  //aprés avoir récupérer le login et password du compte qui a comme Id=1 ,on cherche l'id corredpondant dans la table Mysql
    
    //c'est une nouvelle façon de parserun json en utilisant la bibliothéque SBJson
    SBJsonParser* parser = [[SBJsonParser alloc] init];
    // On initialise un objet NSURLRequest, avec l'URL qui va bien
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8888/getCompte.php"]];
    // On récupère le résultat de la requête
    NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // On transforme le résultat en String
    NSString* jsonString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    // On parse le tout en un NSArray
    comptes = [parser objectWithString:jsonString error:nil];
  
    
    // Ensuite, on peut tout afficher, ou en faire ce qu'on veut...
    for (NSDictionary* compte in  comptes) {
        
        
        
        NSString *chaineLogin= [compte objectForKey:@"login"];
        
        NSString *chainePassword= [compte objectForKey:@"password"];
        
        if([chaineLogin isEqualToString:loginMysql]&&[chainePassword isEqualToString:passwordMysql])
        { 
            NSString *chaineId= [compte objectForKey:@"id"];
            idMysql=[chaineId intValue];
            NSLog(@"%d",idMysql );}
    }





        //initialiser le tableau qui va contenir les id des images de l'utilisateur
        array = [[NSMutableArray alloc] initWithCapacity:30];
        parser1 = [[SBJsonParser alloc] init];
        // On initialise un objet NSURLRequest, avec l'URL qui va bien
        NSURLRequest* request1 = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8888/getJson.php"]];
        NSLog(@"request 1%@",request1);
        // On récupère le résultat de la requête
        NSError *error;
        NSString *chaine12;
        NSData* response1;
        response1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:nil  error:&error];

        // On transforme le résultat en String
        NSString *jsonString1 = [[NSString alloc] initWithData:response1 encoding:NSUTF8StringEncoding];
        // On parse le tout en un NSArray
        images = [parser1 objectWithString:jsonString1 error:nil];
        // Ensuite, on peut tout afficher, ou en faire ce qu'on veut...
        for (NSDictionary *image in  images) {
            
            NSString *chaineId= [image objectForKey:@"id"];
            id12=[chaineId intValue];
            chaine12 = [image objectForKey:@"filename"];
            //        NSString *chaineLogin= [image objectForKey:@"login"];
            
            //        NSString *chainePassword= [image objectForKey:@"password"];
            
            
            if(id12==idMysql)
            {
                
                
                
                size++;
                NSLog(@"the size is :%d",size);
                
                [array addObject:[NSNumber numberWithInt:id12]];
                
                
                NSLog(@"I m hear %d",idMysql );}
        }
   }
//else c'est a dire on a pas trouvé de compte dans la base de donnée sqlite donc
//l'utilisateur à besoin de s'enregistrer ou de se connecter
    else
   
   
    {
        UIAlertView *message1 = [[UIAlertView alloc] initWithTitle:@"Attention: un compte est nécessaire."
                                                          message:@"Connectez-vous à votre compte Auticiel ou bien créer un compte"
                                                         delegate:self
                                                cancelButtonTitle:@"Retour"
                                                otherButtonTitles: @"Register",nil];
        [message1 show];
    
    
    
    }
    
  

}
    else
    {     NSLog(@"Not connected");
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Attention:une connexion internet est nécessaire."
                                                      message:@"Connectez-vous à internet pour profiter de toutes les fonctionnalités"
                                                     delegate:self
                                            cancelButtonTitle:@"Retour"
                                            otherButtonTitles: nil];
        [message show];
    }
    
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
//donner la possibilité si on clique n'importe ou dans la cell elle le séléctionne
- (void)tableView:(UITableView *)tableView1 accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 
{
    
	[self tableView:tableView1 didSelectRowAtIndexPath:indexPath];
}

//- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
//	
////return UITableViewCellAccessoryDetailDisclosureButton;
//	return UITableViewCellAccessoryDisclosureIndicator;
//    
//}



- (void)viewDidUnload
{
    tableView = nil;
    [self setTableView:nil];

    activity = nil;
    [self setActivity:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goHome:(id)sender {
    
    RootViewController *detailVC1 = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    
    [self.navigationController pushViewController:detailVC1 animated:YES];   
    
    
}
@end
