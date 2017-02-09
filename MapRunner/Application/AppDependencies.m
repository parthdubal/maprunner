//
//  AppDependencies.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "AppDependencies.h"
#import "RootWireframe.h"
#import "HomeWireframe.h"
#import "SOMotionDetector.h"

@interface AppDependencies()
{
    HomeWireframe* rootInterface;
    
}
@end

@implementation AppDependencies

- (id)init
{
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}

- (void)initiatRootViewControllerWindow:(UIWindow*)window
{
    // *** present first wireframe here
    [rootInterface showHomefromWindow:window];
}

- (void)configureDependencies
{
    // -----
    // root classes
    
    [self setupSupportModules];
    
    RootWireframe *rootWireframe = [[RootWireframe alloc] init];
    rootInterface = [[HomeWireframe alloc]init];
    
    // *** add datastore
    
    rootInterface.rootWireframe = rootWireframe;
    
    // *** module initialization
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    [[CoreDataStore sharedStore] cleanupUnfinishedRun];
}
-(void)setupSupportModules
{
    [CoreDataStore sharedStore];
    
    // Setting location parameters;

    [SOLocationManager sharedInstance].activityType = CLActivityTypeFitness;
    [SOLocationManager sharedInstance].distanceFilter = 20;
    [SOLocationManager sharedInstance].allowsBackgroundLocationUpdates = true;
    [SOMotionDetector sharedInstance];
}
@end
