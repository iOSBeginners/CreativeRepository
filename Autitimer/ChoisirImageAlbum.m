
#import "ChoisirImageAlbum.h"
#import "RootViewController.h"
#import <AssetsLibrary/AssetsLibrary.h> 
#import "UIButton+Glossy.h"
#import "ModeClassique.h"
#import "GallerieCompte.h"
#import "ImageAlbumDetail.h"
int change;
@implementation ChoisirImageAlbum

@synthesize tableView,activity,Items,b1;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (IBAction)definirImageActivite:(id)sender

{
//    if(selectImage==1)
//    {  changerLibelle *detailVC1 = [[changerLibelle alloc] initWithNibName:@"changerLibelle" bundle:nil];
//    
//        [self.navigationController pushViewController:detailVC1 animated:YES];}
  if(selectImage!=1)
{  UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Vous devez séléctionner une image " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
 [alert autorelease];}
    
}

#pragma mark - View lifecycle
- (void) goBack :(id)sender
{
    GallerieCompte *detailVC1 = [[GallerieCompte alloc] initWithNibName:@"GallerieCompte" bundle:nil];
    
    [self.navigationController pushViewController:detailVC1 animated:YES];
     [detailVC1 autorelease];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	//Get the selected country
//	NSString *texte = cell.textLabel.text;
	
	//Initialize the detail view controller and display it.
	ImageAlbumDetail *dvController = [[ImageAlbumDetail alloc] initWithNibName:@"ImageAlbumDetail" bundle:[NSBundle mainBundle]];

    dvController.image=cell.image;
	[self.navigationController pushViewController:dvController animated:YES];
	
	[dvController autorelease];;
}
//
//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"Hello I'm selected %@",indexPath);
//    NSLog(@"Hello I'm selected %@",cell.textLabel.text);
//    image10= cell.imageView.image;
//    selectImage=1;
//
//    //    if(dvController==nil)
//    //    {
//    //        DetailViewController *aController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
//    //        self.dvController = aController;
//    //    }
//    //        [dvController.image1 setImage:cell.imageView.image];
//    //[dvController updateImage:image1];
//    //    [[self navigationController] pushViewController:dvController animated:YES];
//    
//}

- (void)viewDidLoad {
    NSLog(@"la valeur du temps est :%f",a);
    NSLog(@"Image Téléphone");
    [b1 setBackgroundToGlossyRectOfColor:[UIColor colorWithRed:.05 green:.65 blue:.05 alpha:1] withBorder:NO forState:UIControlStateNormal];
    [super viewDidLoad];
    change=1;
    Items = [[NSMutableArray alloc] init];  
    
    [activity startAnimating];
    ALAssetsGroupEnumerationResultsBlock assetEnumerator = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
        
        if(result != NULL) {
            
            [Items addObject:result];
            
        }
        
    };
    
    ALAssetsLibraryGroupsEnumerationResultsBlock assetGroupEnumerator = ^(ALAssetsGroup *group, BOOL *stop) {
        //On doit créer sur l'iphone un album nommer Autiste et on va mettre tout les Photo de l'autiste dans cette album
        //si on a un nom d'album précis à ajouter on ajoute la condition sinon il va charger tout les images dans l'iphone
        //dans cette boucle on va charger les Photos que contient cet album 
//        if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:@"Autiste"]) {
            [group enumerateAssetsUsingBlock:assetEnumerator];
//        } 
        //        if(group != nil) {
        //            
        //            //[group setAssetsFilter:[ALAssetsFilter allVideos]];
        //            
        //            [group enumerateAssetsUsingBlock:assetEnumerator];
        //            
        //        }
        
        [self.tableView reloadData];
        
        [self.activity stopAnimating];
        
        [self.activity setHidden:YES];
        
    };
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupAll
     
                           usingBlock:assetGroupEnumerator
     
                         failureBlock: ^(NSError *error) {
                             
                             NSLog(@"Failure");
                             
                         }];
    
    
}
//    #pragma mark UITableViewDataSource Methods

// Customize the number of rows in the table view.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [Items count];
    
}



- (void)tableView:(UITableView *)tableView1 accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 
{
    
	[self tableView:tableView1 didSelectRowAtIndexPath:indexPath];
}

// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"id";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier] ;
        
    }
    
    
    
	ALAsset *asset = [Items objectAtIndex:indexPath.row];
	[cell.imageView setImage:[UIImage imageWithCGImage:[asset thumbnail]]];
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"Photo %d", indexPath.row+1]];
 
    return cell;
    
}

//pour les fléches
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	//return UITableViewCellAccessoryDetailDisclosureButton;
	return UITableViewCellAccessoryDisclosureIndicator;
}



- (void)viewDidUnload {


    [super viewDidUnload];
}
- (IBAction)goHome:(id)sender {
    
    RootViewController *Vc=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:Nil ];
    [self.navigationController pushViewController:Vc animated:YES];
    
    
    [Vc autorelease];
    
    
    
}
@end