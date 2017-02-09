//
//  MyrunInteractor.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MyrunInteractorInput <NSObject>

-(void)loadRunReports;
-(void)deleteRunDetail:(Run* _Nonnull)runDetail;
@end

@protocol MyrunInteractorOutput <NSObject>
-(void)runReportResults:(NSArray<Run*>* _Nonnull)arrRunReports;
@end

@interface MyrunInteractor : NSObject<MyrunInteractorInput>

@property (weak) id<MyrunInteractorOutput> _Nullable output;

@end
