//
//  AppDelegate.h
//  DCImageDownloader
//
//  Created by 岩出 広大 on 2015/08/22.
//  Copyright (c) 2015年 DevCafe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

/** AppDelegate */
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

