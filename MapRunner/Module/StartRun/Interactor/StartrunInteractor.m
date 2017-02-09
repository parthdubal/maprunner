
//
//  StartrunInteractor.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "StartrunInteractor.h"
#import "SOMotionDetector.h"

@interface StartrunInteractor ()
{
    CGFloat seconds;
    CGFloat distance;
    NSTimer* activityTimer;
    NSMutableArray<CLLocation*>* arrLocations;
}
@end
@implementation StartrunInteractor

-(void)startMyRun
{
    [self registerSpeedObserver];
    [[SOMotionDetector sharedInstance] startDetection];
    [self startRunningActivity];
}
-(void)cancelMyRun
{
    [self finishRunning];
    [self stopRunningActivity];
    [self setDefaultvalues];
    [self updateDefaultstatestoUI];
}
-(void)finishMyRun
{
    [self finishRunning];
    [self stopRunningActivity];
    [self.output updateTime:seconds andDistance:distance];
    [self setDefaultvalues];
    [self updateDefaultstatestoUI];
}

#pragma mark
#pragma mark - ***Internal Methods****



-(void)registerSpeedObserver
{
    __weak typeof(self) weakSelf = self;
    [SOMotionDetector sharedInstance].useM7IfAvailable = true;
    
    [SOMotionDetector sharedInstance].motionTypeChangedBlock = ^(SOMotionType motionType) {
        NSString *type = @"";
        switch (motionType) {
            case MotionTypeNotMoving:
                type = @"Not moving";
                break;
            case MotionTypeWalking:
                type = @"Walking";
                break;
            case MotionTypeRunning:
                type = @"Running";
                break;
            case MotionTypeAutomotive:
                type = @"Automotive";
                break;
        }
        
        [weakSelf.output speedTypeObserver:type];
    };
    
    [SOMotionDetector sharedInstance].locationChangedBlock = ^(CLLocation *location) {
        [weakSelf updateLocationForRun:location];
    };
}
-(void)deregisterSpeedObserver
{
    [SOMotionDetector sharedInstance].motionTypeChangedBlock = nil;
    [SOMotionDetector sharedInstance].locationChangedBlock = nil;
}

-(void)finishRunning
{
    [self deregisterSpeedObserver];
    [[SOMotionDetector sharedInstance] stopDetection];
}


#pragma mark
#pragma mark - *** Internal updates methods ***

-(void)updateLocationForRun:(CLLocation*)location
{
    [self sendSpeedUpdates:[SOMotionDetector sharedInstance].currentSpeed];
    if (location.horizontalAccuracy < 20)
    {
        [self.output updateLocationDetails:location];
        
        if (arrLocations.count > 0)
        {
            distance += [location distanceFromLocation:arrLocations.lastObject];
        }
        [arrLocations addObject:location];
    }
}

-(void)updateDefaultstatestoUI
{
    [self sendSpeedUpdates:0.0];
    NSString* txtSeconds = [Common stringifySecondCount:seconds usingLongFormat:false];
    [self.output runTimes:txtSeconds];
    NSString* txtDistance = [Common stringifyDistance:distance];
    [self.output runDistance:txtDistance];
    [self.output speedTypeObserver:@"Not moving"];
}
-(void)sendSpeedUpdates:(double)speed
{
    NSString* txtSpeed = [NSString stringWithFormat:@"%.2f km/h",speed * 3.6f];
    [self.output speedUpdateObserver:txtSpeed];
}
-(void)startRunningActivity
{
    [self setDefaultvalues];
    activityTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(eachSecondActivity) userInfo:nil repeats:true];
    [[NSRunLoop mainRunLoop] addTimer: activityTimer forMode:NSDefaultRunLoopMode];
}
-(void)stopRunningActivity
{
    [self cleanupActivityResources];
}
-(void)eachSecondActivity
{
    seconds++;
    NSString* txtSeconds = [Common stringifySecondCount:seconds usingLongFormat:false];
    [self.output runTimes:txtSeconds];
    NSString* txtDistance = [Common stringifyDistance:distance];
    [self.output runDistance:txtDistance];
    
    __unused NSString* pace = [Common stringifyAvgPaceFromDist:distance overTime:seconds];
    
}
-(void)setDefaultvalues
{
    [self cleanupActivityResources];
    arrLocations = [NSMutableArray arrayWithCapacity:0];
    seconds = 0;
    distance = 0;
}
-(void)cleanupActivityResources
{
    [activityTimer invalidate];
    activityTimer = nil;
    [arrLocations removeAllObjects];
    arrLocations = nil;
}
-(void)dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
@end
