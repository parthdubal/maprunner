//
//  RunReportVC.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "BaseViewController.h"
#import "ReportrunViewInterface.h"

#import "ReportrunPresenter.h"

@interface RunReportVC : BaseViewController <ReportrunViewInterface>
{
    
}

@property(weak) id<ReportrunModuleInterface> runReportPresenter;
@property(nonatomic) id<ReportrunWireframeInteractor>  wireframeRunReport;

@end
