//
//  ChoisirImageAlbum.h
//  Autitimer
//
//  Created by Piret on 28/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h> 

extern int change;

@interface ChoisirImageAlbum : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *Items;

    int selectImage; 
    
}

- (IBAction)goHome:(id)sender;


@property (copy, nonatomic) NSMutableArray *Items;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;
- (IBAction)definirImageActivite:(id)sender;
- (IBAction) goBack :(id)sender ;
@property (strong, nonatomic) IBOutlet UIButton *b1;
@end
