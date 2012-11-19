//
//  AppDelegate.m
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 Auticiel. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "HomeLogin.h"
@implementation AppDelegate

@synthesize window;
@synthesize viewController = _viewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    //How to disable the standby or the sleeping mode while your iPhone application is running .
    [UIApplication sharedApplication].idleTimerDisabled=YES;
    
    
    //Warining:Important: You should set this property only if necessary and should be sure to reset it to NO when the need no longer exists. Most applications should let the system turn off the screen when the idle timer elapses. This includes audio applications. With appropriate use of Audio Session Services, playback and recording proceed uninterrupted when the screen turns off. The only applications that should disable the idle timer are mapping applications, games, or similar programs with sporadic user interaction.
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"compteFr1.db"]];
      const char *dbpath = [databasePath UTF8String];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
		const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            char *errMsg;
      
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS COMPTE (ID INTEGER, LOGIN TEXT, PASSWORD TEXT,PRIMARY KEY (ID,LOGIN,PASSWORD))";
            
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
             
                NSLog(@"Failed to create table");
            }
            
            sqlite3_close(contactDB);
            
        } else {
        
            NSLog(@"Failed to create table");
        }
    }
    
  
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM COMPTE "];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            //vérifier si la table est vide ou non 
            //si la table est vide on va charger la view :ROOTViewController sinon on charge 
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                existeRow=0;
            } else {
                existeRow=1;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    
    // navcontroller :
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
//il faut inverser les existeRow pour que sa marche correctement 
    //mais la solution peut être quelque chose d'autre ;)
//        if(existeRow==0)
//
//    {  
//        
//        
//        
//        HomeLogin *firstVC = [[HomeLogin alloc] initWithNibName:@"HomeLogin" bundle:nil];
//        _navController = [[UINavigationController alloc] initWithRootViewController:firstVC];
//        [self.window addSubview:_navController.view];
//        
//        _navController.navigationBar.hidden = YES;
//        existeRow=0;
//       
//        }
////    else if(existeRow==0)
//   else if(existeRow==1)
     RootViewController *firstVC = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
        _navController = [[UINavigationController alloc] initWithRootViewController:firstVC];

    //iOS 3 compatibility:
    if ([self.window respondsToSelector:@selector(setRootViewController:)]) {
        self.window.rootViewController = _navController;
    } else {
        [self.window addSubview:_navController.view];
    }
    
    
    
//    
//    
//        [self.window addSubview:_navController.view];
    
        _navController.navigationBar.hidden = YES;
    

    
    
    
    
    // SplashScreen :
    
    splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    splashView.image = [UIImage imageNamed:@"Default.png"];
    [window addSubview:splashView];
    [window bringSubviewToFront:splashView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector (startupAnimationDone:finished:context:)];
    splashView.frame = CGRectMake(-60, -60, 440, 600); splashView.alpha = 0.0; [UIView commitAnimations];
    
    
    
    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
    [firstVC autorelease];
    

    
}



- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    [splashView removeFromSuperview];
}






- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
//source:www.xappsoftware.com/wordpress/2011/03/05/disable-standby-or-sleeping-mode-while-running-your-application/