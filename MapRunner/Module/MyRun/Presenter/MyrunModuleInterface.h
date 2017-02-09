//
//  MyrunModuleInterface.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyrunModuleInterface <NSObject>

-(void)loadRunHistory;
-(NSArray<Run*>* _Nonnull )runHistory;
-(void)showRundetailsForIndex:(NSInteger)index;
-(void)deleteRunDetails:(NSInteger)index;
-(void)configureSegue:(UIStoryboardSegue* _Nonnull)segue;
@end
