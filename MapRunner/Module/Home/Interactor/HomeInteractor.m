//
//  HomeInteractor.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "HomeInteractor.h"
#import "SOMotionDetector.h"

@implementation HomeInteractor

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
#pragma mark
#pragma mark - input Interactor;
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
        NSString* txtSpeed = [NSString stringWithFormat:@"%.2f km/h",[SOMotionDetector sharedInstance].currentSpeed * 3.6f];
        [weakSelf.output speedUpdateObserver:txtSpeed];
    };
    [[SOMotionDetector sharedInstance] startDetection];
}
-(void)deregisterSpeedObserver
{
    [SOMotionDetector sharedInstance].motionTypeChangedBlock = nil;
    [SOMotionDetector sharedInstance].locationChangedBlock = nil;
    [[SOMotionDetector sharedInstance] stopDetection];
}

@end
