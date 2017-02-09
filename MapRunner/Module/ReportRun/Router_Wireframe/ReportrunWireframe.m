//
//  ReportrunWireframe.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "ReportrunWireframe.h"

#import "RunReportVC.h"
#import "ReportrunPresenter.h"
#import "ReportrunInteractor.h"

@interface ReportrunWireframe ()
{
    __weak RunReportVC* runreportVC;
    ReportrunPresenter* runReportPresenter;
    
}
@end

@implementation ReportrunWireframe

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self configRunReportWireframe];
    }
    return self;
}
-(void)configRunReportWireframe
{
    ReportrunInteractor* interactor = [[ReportrunInteractor alloc] init];
    
    runReportPresenter = [[ReportrunPresenter alloc] init];
    runReportPresenter.wireframe = self;
    runReportPresenter.interactor = interactor;
    interactor.output = runReportPresenter;
}


#pragma mark - 
#pragma mark -  interactor
-(void)dismissHistoryreport
{
    [runreportVC.navigationController popViewControllerAnimated:true];
}
-(void)dismissnewRunReport
{
    [runreportVC.navigationController popToRootViewControllerAnimated:true];
}
-(void)configureRunReportController:(UIViewController*)controller withRunDetails:(Run*)runDetails withHistory:(BOOL)isHistory;
{
    runreportVC = (RunReportVC*)controller;
    runreportVC.runReportPresenter  = runReportPresenter;
    runReportPresenter.viewInterface = runreportVC;
    runreportVC.wireframeRunReport = self;
    
    runReportPresenter.isHistoryReport = isHistory;
    runReportPresenter.runDetails = runDetails;
}

@end
