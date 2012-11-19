//
//  PlusInfo.m
//  Autitimer
//
//  Created by Antoine Piret on 08/11/12.
//
//

#import "PlusInfo.h"
#import "Reachability.h"
#import "CompteConnecter.h"
#import "HomeLogin.h"
#import "RootViewController.h"
@interface PlusInfo ()

@end

@implementation PlusInfo

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

- (IBAction)goHome:(id)sender {
    RootViewController *gB=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:gB animated:YES];
}

- (IBAction)goBack:(id)sender {
    
    //on teste la connexion
    Reachability *wifiReach = [Reachability reachabilityWithHostName: @"www.apple.com"];
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
    if(netStatus != NotReachable) {
        // connected
        
        CompteConnecter *cc=[[CompteConnecter alloc] initWithNibName:@"CompteConnecter" bundle:Nil ];
        [self.navigationController pushViewController:cc animated:YES  ];
        
    }
    else {
        //not connected
        HomeLogin *hl=[[ HomeLogin alloc]initWithNibName:@"HomeLogin" bundle:Nil];
        
        [self.navigationController pushViewController:hl animated:YES  ];
        
    }

    
    
    
}
@end
