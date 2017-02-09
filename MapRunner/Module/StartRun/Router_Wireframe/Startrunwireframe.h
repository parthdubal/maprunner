//
//  Startrunwireframe.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StartrunwireframeInteractor <NSObject>

-(void)presentRunReportScreen;
-(void)showCancelRunConfirmaiton;
-(void)showFinishConfirmation;

-(void)configureRunReportController:(UIViewController*)controller withRunInfo:(Run*)run historyInfo:(BOOL)isHistroy;

@end

@interface Startrunwireframe : NSObject<StartrunwireframeInteractor>
{
    
}
-(void)configureStartRunController:(UIViewController*)controller;
@end
