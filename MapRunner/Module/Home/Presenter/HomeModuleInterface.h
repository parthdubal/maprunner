//
//  HomeModuleInterface.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModuleInterface <NSObject>

-(void)startRequestMotionUpdate;
-(void)stopRequestMotionUpdate;
-(void)showMyRunDetails;
-(void)showStartDetails;

/**
 configure segue with details if any for passing.
 */

-(void)configureSegue:(UIStoryboardSegue*)segue;
@end
