//
//  ReportrunInteractor.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReportrunInteractorInput <NSObject>



@end

@protocol ReportrunInteractorOutput <NSObject>

@end

@interface ReportrunInteractor : NSObject<ReportrunInteractorInput>
@property (nonatomic,weak) _Nullable id<ReportrunInteractorOutput> output;
@end
