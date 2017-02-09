//
//  AppDelegate.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "AppDelegate.h"

struct okay
{
    int value;
};


@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize appDependencies = _appDependencies;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    struct okay t;
    t.value = 10;
    printf("tvalue: %d",t.value);
    _appDependencies = [[AppDependencies alloc]init];
    [_appDependencies initiatRootViewControllerWindow:_window];
    [self testDemo];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MapRunner"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
- (NSManagedObjectContext*)manageObjectContext
{
    return  self.persistentContainer.viewContext;
}

+(AppDelegate*)sharedDelegates
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

-(void)testDemo
{
 
    NSMutableString* str = [NSMutableString stringWithFormat:@"%@",@"HOW ARE YOU?"];
    NSMutableString* newStr = str; //[str mutableCopy];
    NSMutableString* newStr2 = [str copy];
    [(NSMutableString*)newStr appendString:@" updated value."];
    
    
    self.strValue = str;
    NSMutableString* strValuenew = self.strValue;
    NSMutableString* strValuenew2 = [self.strValue copy];
    NSMutableString* strValuenew3 = [self.strValue mutableCopy];
    NSLog(@"self.strValue: %@ and address %p",self.strValue,self.strValue);
    NSLog(@"copy with = strValuenew: %@ and address %p",strValuenew,strValuenew);
    NSLog(@"copy with func - strValuenew2: %@ and address %p",strValuenew2,strValuenew2);
    NSLog(@"mcopy with func - strValuenew2: %@ and address %p",strValuenew3,strValuenew3);
    
    NSLog(@"str: %@ and address %p",str,str);
    NSLog(@"newStr: %@ and address %p",newStr,newStr);
    NSLog(@"newStr2: %@ and address %p",newStr2,newStr2);
    NSLog(@"********");
    
    NSArray *myArray1;
    NSArray *myArray2;
    NSMutableString *tmpStr;
    NSMutableString *string1;
    NSMutableString *string2;
    NSMutableString *string3;
    NSData *buffer;
    
    string1 = [NSMutableString stringWithString: @"Red"];
    string2 = [NSMutableString stringWithString: @"Green"];
    string3 = [NSMutableString stringWithString: @"Blue"];
    
    myArray1 = [NSMutableArray arrayWithObjects: string1, string2, string3, nil];
    
    buffer = [NSKeyedArchiver archivedDataWithRootObject: myArray1];
    myArray2 =  [NSKeyedUnarchiver unarchiveObjectWithData: buffer];
    
    tmpStr = [myArray1 objectAtIndex: 0];
    
    [tmpStr setString: @"Yellow"];
    
    NSLog (@"First element of myArray1 = %@", [myArray1 objectAtIndex: 0]);
    NSLog (@"First element of myArray2 = %@", [myArray2 objectAtIndex: 0]);
    
}
@end
