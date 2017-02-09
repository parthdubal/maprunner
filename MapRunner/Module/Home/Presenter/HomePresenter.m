//
//  HomePresenter.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "HomePresenter.h"

@implementation HomePresenter

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

#pragma mark
#pragma mark - module interface

-(void)startRequestMotionUpdate
{
    [self.interactor registerSpeedObserver];
}
-(void)stopRequestMotionUpdate
{
    [self.interactor deregisterSpeedObserver];
}
-(void)showMyRunDetails
{
    [_wireframe presentMyRunController];
}
-(void)showStartDetails
{
    [_wireframe presentStartRunController];
}
-(void)configureSegue:(UIStoryboardSegue*)segue
{
    UIViewController* destinationController = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:[SegueIdentifer segueStartRunIdentifer]])
    {
        // start run configuration
        [_wireframe configureStartRunController:destinationController];
    }
    else if ([[segue identifier] isEqualToString:[SegueIdentifer segueMyrunIdentifer]])
    {
        // my run configuration
        [_wireframe configureMyRunController:destinationController];
    }
}
#pragma mark
#pragma mark - Interactor output
-(void)speedUpdateObserver:(NSString*)txtSpeed
{
    [self.viewInterface speedUpdateResult:txtSpeed];
}
-(void)speedTypeObserver:(NSString*)txtSpeedType
{
    [self.viewInterface speedTypeResult:txtSpeedType];
}
@end
