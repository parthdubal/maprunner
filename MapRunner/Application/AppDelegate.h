//
//  AppDelegate.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@class AppDependencies;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}
@property (nonatomic,copy) NSMutableString* strValue;
@property (strong, nonatomic,readonly) AppDependencies  *appDependencies;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
- (NSManagedObjectContext*)manageObjectContext;

+(AppDelegate*)sharedDelegates;

@end

