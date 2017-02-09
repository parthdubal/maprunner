//
//  StartrunViewInterface.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StartrunViewInterface <NSObject>

-(void)speedUpdateObserver:(NSString*)txtSpeed;
-(void)speedTypeObserver:(NSString*)txtSpeedType;
-(void)runTimes:(NSString*)txtTime;
-(void)runDistance:(NSString*)txtDistance;
-(void)didCancelRun;
-(void)didFinishRunFitnes;

@end

