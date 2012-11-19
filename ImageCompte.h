//
//  ImageCompte.h
//  Autitimer
//
//  Created by Piret on 09/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCompte : NSObject
{
    UIImage *image;
    NSString *name;

}
@property (nonatomic,retain) UIImage *image;
 @property (nonatomic,retain)   NSString *name;
@end
