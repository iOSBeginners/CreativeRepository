//
//  CompteInternet.h
//  Autitimer
//
//  Created by Piret on 03/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import <AssetsLibrary/AssetsLibrary.h> 

#import "SBJson.h"

extern  NSString *loginMysql;
extern     NSString *passwordMysql;

@interface CompteInternet : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
NSMutableArray *json; 
    NSMutableArray *json1; 
    IBOutlet UITableView *tableView;
    int numberRow;
    NSString        *databasePath;
int id12;
    sqlite3 * contactDB;
    int idMysql;
    NSArray *images;
    NSArray *comptes;
    int passe;
    NSMutableArray *array ;
    SBJsonParser* parser1;
    int size;
    int dontPasse;
    
    
    IBOutlet UIActivityIndicatorView *activity;
    
}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;


- (IBAction)goHome:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


-(IBAction)goBack:(id)sender;
@end
