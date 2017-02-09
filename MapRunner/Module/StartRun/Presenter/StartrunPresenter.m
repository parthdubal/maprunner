//
//  StartrunPresenter.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "StartrunPresenter.h"


@implementation StartrunPresenter
{
    Run* runDetails;
}

-(void)startRunFitness
{
    [self.interactor startMyRun];
    [self createActiveRun];
}
-(void)finishRunFitness
{
    [self.interactor finishMyRun];
    [self completeActiveRun];
    
    // send to report screen;
    [_wireframe presentRunReportScreen];
}
-(void)cancelRunFitness
{
    [self.interactor cancelMyRun];
    [self deleteActiveRun];
    [self.viewInterface didCancelRun];
}
-(void)configureSegue:(UIStoryboardSegue*)segue
{
    // update report details from here;
    if ([segue.identifier isEqualToString:[SegueIdentifer segueRunReportIdentifer]])
    {
        [_wireframe configureRunReportController:segue.destinationViewController withRunInfo:runDetails historyInfo:false];
    }
}

#pragma mark - 
#pragma mark - Interactor output
-(void)speedUpdateObserver:(NSString*)txtSpeed
{
    [self.viewInterface speedUpdateObserver:txtSpeed];
}
-(void)speedTypeObserver:(NSString*)txtSpeedType
{
    [self.viewInterface speedTypeObserver:txtSpeedType];
}
-(void)runTimes:(NSString*)txtTime
{
    [self.viewInterface runTimes:txtTime];
}
-(void)runDistance:(NSString*)txtDistance
{
    [self.viewInterface runDistance:txtDistance];
}
-(void)updateTime:(float)time andDistance:(float)distance
{
    runDetails.distance = distance;
    runDetails.duration = time;
}
-(BOOL)isActiveRun
{
    return (runDetails != nil);
}
-(void)showConfirmcancel
{
    [_wireframe showCancelRunConfirmaiton];
}
-(void)showConfirmFinish
{
    [_wireframe showFinishConfirmation];
}
#pragma mark -
#pragma mark - run activity udpates
-(void)updateLocationDetails:(CLLocation*)location
{
    Location* locationUpdate = [[CoreDataStore sharedStore] locationUpdateActivity:ContextMain];
    
    locationUpdate.lattitude = location.coordinate.latitude;
    locationUpdate.longitude = location.coordinate.longitude;
    locationUpdate.timestamp = location.timestamp;
    [runDetails addLocationsObject:locationUpdate];
    locationUpdate.run = runDetails;
    
    [[CoreDataStore sharedStore] save];
}

-(void)createActiveRun
{
    Run* run = [[CoreDataStore sharedStore] newRunActivity:ContextMain];
    [self fireCoreStoreSave];
    runDetails = run;
}
-(void)completeActiveRun
{
    runDetails.completedRun = true;
    [self fireCoreStoreSave];
}
-(void)deleteActiveRun
{
    runDetails.completedRun = false;
    [[CoreDataStore sharedStore] deleteObject:runDetails];
    [self fireCoreStoreSave];
    runDetails = nil;
}
-(void)fireCoreStoreSave
{
    [[CoreDataStore sharedStore] save];
}
-(void)dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
@end
