//
//  CoreDataStore.h
//  MapRunner
//
//  Created by Parth Dubal on 1/9/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ContextMain,
    ContentPrivate
} ContextType;

@interface CoreDataStore : NSObject
{
    
}
@property (readonly) NSManagedObjectContext* managedObjectContext;
@property (readonly) NSManagedObjectContext* managedObjectContext_Private;
+(CoreDataStore*)sharedStore;
-(BOOL)save;

-(Run*)newRunActivity:(ContextType) type;
-(Location*)locationUpdateActivity:(ContextType) type;



-(void)deleteObject:(NSManagedObject*)oject;
-(void)cleanupUnfinishedRun;
@end
