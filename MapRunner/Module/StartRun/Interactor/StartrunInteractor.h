//
//  StartrunInteractor.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StartrunInteractorInput <NSObject>

//-(void)registerSpeedObserver;
//-(void)deregisterSpeedObserver;
-(void)startMyRun;
-(void)cancelMyRun;
-(void)finishMyRun;

@end

@protocol StartrunInteractorOutput <NSObject>

-(void)speedUpdateObserver:(NSString* _Nonnull)txtSpeed;
-(void)speedTypeObserver:(NSString* _Nonnull)txtSpeedType;
-(void)runTimes:(NSString* _Nonnull)txtTime;
-(void)runDistance:(NSString* _Nonnull)txtDistance;
-(void)updateLocationDetails:(CLLocation* _Nonnull)locationUpdate;
-(void)updateTime:(float)time andDistance:(float)distance;
@end

/**
 Any data interaction with data model and app module logic
 */
@interface StartrunInteractor : NSObject <StartrunInteractorInput>

@property (nonatomic,weak) _Nullable id<StartrunInteractorOutput> output;
@end
