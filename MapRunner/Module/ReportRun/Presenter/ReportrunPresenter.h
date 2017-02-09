//
//  ReportrunPresenter.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ReportrunModuleInterface.h"
#import "ReportrunInteractor.h"
#import "ReportrunViewInterface.h"
#import "ReportrunWireframe.h"

@interface ReportrunPresenter : NSObject <ReportrunModuleInterface,ReportrunInteractorOutput>
{
    
}

@property (weak,nonatomic) _Nullable id<ReportrunViewInterface> viewInterface;
@property (nonatomic) _Nullable id<ReportrunInteractorInput> interactor;
@property (weak,nonatomic) _Nullable id<ReportrunWireframeInteractor> wireframe;


@property (nonatomic,weak,nullable) Run* runDetails;
@property (nonatomic,assign) BOOL isHistoryReport;

@end
