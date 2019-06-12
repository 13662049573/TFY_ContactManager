//
//  AppDelegate.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [TFY_ContactManager sharedInstance].contactChangeHandler = ^{
      NSLog(@"通讯录修改咯");
        
        [[TFY_ContactManager sharedInstance] accessContactsComplection:^(BOOL succeed, NSArray<TFY_PersonModel *> * _Nonnull contacts) {
          
            NSLog(@"TFY_PersonModel--contacts----%@", contacts);
            
        }];
        
        [[TFY_ContactManager sharedInstance] accessSectionContactsComplection:^(BOOL succeed, NSArray<TFY_SectionPerson *> * _Nonnull contacts, NSArray<NSString *> * _Nonnull keys) {
            
            NSLog(@"TFY_SectionPerson---%@--%@", contacts, keys);
        }];
    };
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor  whiteColor];
    
     TFY_NavigationController *navVC = [[TFY_NavigationController alloc]initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = navVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
