//
//  CoreDataStore.m
//  MapRunner
//
//  Created by Parth Dubal on 1/9/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "CoreDataStore.h"
#import <CoreData/CoreData.h>


static dispatch_once_t onceToken = 0;
static CoreDataStore* sharedObj = nil;
@interface CoreDataStore ()
{
    NSPersistentStoreCoordinator* persistentStoreCoordinator;
    NSManagedObjectModel* managedObjectModel;
    NSManagedObjectContext* managedObjectContext;
    NSManagedObjectContext* main_managedObjectContext_private;
    NSManagedObjectContext* managedObjectContext_Private;
}
@end

@implementation CoreDataStore
@synthesize managedObjectContext = managedObjectContext;
@synthesize managedObjectContext_Private = managedObjectContext_Private;

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}

+(CoreDataStore*)sharedStore
{
    dispatch_once(&onceToken, ^{
        sharedObj = [[super allocWithZone:nil]init];
    });
    return sharedObj;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setupCoreStack];
    }
    return self;
}
-(void)setupCoreStack
{
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"MapRunner" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:url];
    
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:managedObjectModel];
    
    NSSearchPathDomainMask domains = NSUserDomainMask;
    NSSearchPathDirectory directory = NSDocumentDirectory;
   
    NSURL *appDocumentDirectory = [[NSFileManager defaultManager] URLsForDirectory:directory inDomains:domains].firstObject;
    
    NSDictionary* options = @{NSMigratePersistentStoresAutomaticallyOption : @(true),NSInferMappingModelAutomaticallyOption : @(true)};
    NSURL *storeUrl = [appDocumentDirectory URLByAppendingPathComponent:@"mapprunner.sqlite"];
    
    NSError* error = nil;
    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error];
    
    main_managedObjectContext_private = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];

    main_managedObjectContext_private.persistentStoreCoordinator = persistentStoreCoordinator;
    main_managedObjectContext_private.undoManager = nil;
    
    managedObjectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    managedObjectContext.parentContext = main_managedObjectContext_private;
    managedObjectContext.undoManager = nil;
    
    
    managedObjectContext_Private = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    managedObjectContext_Private.persistentStoreCoordinator = persistentStoreCoordinator;
    managedObjectContext_Private.undoManager = nil;
}

-(BOOL)save
{
    [managedObjectContext performBlock:^{
        
        if ([managedObjectContext hasChanges])
        {
            NSError* error;
            [managedObjectContext save:&error];
            if (error)
            {
                //        NSLog(@"error saving context :%@",error);
                NSLog(@"Failed to save to data store: %@", [error localizedDescription]);
                NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
                if(detailedErrors != nil && [detailedErrors count] > 0) {
                    for(NSError* detailedError in detailedErrors) {
                        NSLog(@"  DetailedError: %@", [detailedError userInfo]);
                    }
                }
            }
        }
      
    }];
    
    [main_managedObjectContext_private performBlock:^{
        if ([main_managedObjectContext_private hasChanges])
        {
            NSError* error;
            
            [main_managedObjectContext_private save:&error];
            if (error)
            {
                //        NSLog(@"error saving context :%@",error);
                NSLog(@"Failed to save to data store: %@", [error localizedDescription]);
                NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
                if(detailedErrors != nil && [detailedErrors count] > 0) {
                    for(NSError* detailedError in detailedErrors) {
                        NSLog(@"  DetailedError: %@", [detailedError userInfo]);
                    }
                }
            }
        }
        
    }];
    
    [managedObjectContext_Private performBlock:^{
        
        if ([managedObjectContext_Private hasChanges])
        {
            NSError* error;
            [managedObjectContext_Private save:&error];
            if (error)
            {
                //        NSLog(@"error saving context :%@",error);
                NSLog(@"Failed to save to data store: %@", [error localizedDescription]);
                NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
                if(detailedErrors != nil && [detailedErrors count] > 0) {
                    for(NSError* detailedError in detailedErrors) {
                        NSLog(@"  DetailedError: %@", [detailedError userInfo]);
                    }
                }
            }
        }
        
    }];
    return true;
}

-(Run*)newRunActivity:(ContextType) type
{
    NSManagedObjectContext* _contenxt;
    if (type== ContextMain)
    {
        _contenxt = managedObjectContext;
    }
    else{
        _contenxt = managedObjectContext_Private;
    }
    
    Run* run = (Run*) [[NSManagedObject alloc] initWithEntity:[Run entity] insertIntoManagedObjectContext:_contenxt];
    run.timestamp = [NSDate date];
    run.completedRun = false;
    return run;
}
-(Location*)locationUpdateActivity:(ContextType) type
{
    NSManagedObjectContext* _contenxt;
    if (type== ContextMain)
    {
        _contenxt = managedObjectContext;
    }
    else{
        _contenxt = managedObjectContext_Private;
    }
    Location* locationUpdate = (Location*) [[NSManagedObject alloc] initWithEntity:[Location entity] insertIntoManagedObjectContext:_contenxt];
    return locationUpdate;
}


-(void)deleteObject:(NSManagedObject*)oject
{
    [managedObjectContext deleteObject:oject];
}
-(void)cleanupUnfinishedRun
{
    NSFetchRequest* runRequest = [Run fetchRequest];
    
    NSPredicate* unifinshPredicate = [NSPredicate predicateWithFormat:@"completedRun == %@",@(false)];
    runRequest.predicate = unifinshPredicate;
    
    NSBatchDeleteRequest* deleteRequest = [[NSBatchDeleteRequest alloc]initWithFetchRequest:runRequest];
    NSError* error;
    __unused NSPersistentStoreResult* result = [managedObjectContext executeRequest:deleteRequest error:&error];
    
    NSLog(@"result: %lu",(unsigned long)deleteRequest.resultType);
    NSLog(@"errorResult: %@",error);
    
    runRequest.predicate = nil;
    
    NSInteger count = [managedObjectContext countForFetchRequest:runRequest error:&error];
    NSLog(@"count result: %ld",(long)count);
    NSLog(@"count errorResult: %@",error);
    [self save];
}
@end
