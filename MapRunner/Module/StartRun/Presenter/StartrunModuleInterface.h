//
//  StartrunModuleInterface.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StartrunModuleInterface <NSObject>
-(void)startRunFitness;
-(void)finishRunFitness;
-(void)cancelRunFitness;

-(BOOL)isActiveRun;

-(void)showConfirmcancel;

-(void)showConfirmFinish;

-(void)configureSegue:(UIStoryboardSegue* _Nonnull)segue;
@end
