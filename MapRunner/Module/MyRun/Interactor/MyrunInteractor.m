//
//  MyrunInteractor.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "MyrunInteractor.h"

@interface MyrunInteractor ()
{
    
}
@end

@implementation MyrunInteractor

-(void)loadRunReports
{
    NSFetchRequest* runReqeust = [Run fetchRequest];
    NSPredicate* finishPredicate = [NSPredicate predicateWithFormat:@"completedRun == %@",@(true)];
    runReqeust.predicate = finishPredicate;
    NSError* error;
    NSArray<Run*>* arrResult = [[CoreDataStore sharedStore].managedObjectContext executeFetchRequest:runReqeust error:&error];
    
//    [[CoreDataStore sharedStore].managedObjectContext_Private performBlock:^{
//        for (int i =0; i<1000; i++)
//        {
//            Run* arrObj = arrResult[0];
//            
//            Run* obj = [[CoreDataStore sharedStore] newRunActivity:ContentPrivate];
//            
//            obj.distance = arrObj.distance;
//            obj.duration = arrObj.duration;
//            obj.timestamp = arrObj.timestamp;
//            obj.completedRun = arrObj.completedRun;
//            
//            for (Location* location in arrObj.locations.allObjects)
//            {
//                Location *newObj = [[CoreDataStore sharedStore] locationUpdateActivity:ContentPrivate];
//                newObj.lattitude = location.lattitude;
//                newObj.longitude = location.longitude;
//                newObj.timestamp = location.timestamp;
//                newObj.run = obj;
//            }
//        }
//        [[CoreDataStore sharedStore] save];
//    }];
  
    if (error)
    {
        NSLog(@"error run fetch request: %@",error);
        arrResult = [NSArray array];
    }
    [self sendResult:arrResult];
}
-(void)deleteRunDetail:(Run*)runDetail
{
    CoreDataStore* coredataObject = [CoreDataStore sharedStore];
    [coredataObject deleteObject:runDetail];
    [coredataObject save];
}

#pragma mark
#pragma mark - internal methods
-(void)sendResult:(NSArray<Run*>* _Nonnull)arrRunReports
{
    [self.output runReportResults:arrRunReports];
}
@end
