//
//  HomeViewInterface.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeViewInterface <NSObject>

-(void)speedUpdateResult:(NSString*)txtSpeedValue;
-(void)speedTypeResult:(NSString*)txtSpeedType;

@end
