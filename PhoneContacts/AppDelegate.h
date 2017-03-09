//
//  AppDelegate.h
//  CoreDataTest
//
//  Created by Abdul Wahid on 3/8/17.
//  Copyright © 2017 GLOBAL RESCUE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

