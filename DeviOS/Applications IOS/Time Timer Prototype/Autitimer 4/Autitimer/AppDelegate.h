//
//  AppDelegate.h
//  Autitimer
//
//  Created by Piret on 22/01/12.
//  Copyright (c) 2012 Auticiel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassiqueModeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
     UIImageView *splashView;
    
@private
	UINavigationController *_navController;
}

@property (nonatomic, retain) IBOutlet ClassiqueModeViewController *viewController;
@property (strong, nonatomic) UIWindow *window;


- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;


@end
