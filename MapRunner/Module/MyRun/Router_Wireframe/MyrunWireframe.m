//
//  MyrunWireframe.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "MyrunWireframe.h"
#import "MyRunVC.h"

#import "ReportrunWireframe.h"
@interface MyrunWireframe ()
{
    __weak MyRunVC* viewController;
    MyrunPresenter* myrunPresenter;
}
@end

@implementation MyrunWireframe

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self configureArchitec];
    }
    return self;
}
-(void)configureArchitec
{
    MyrunInteractor* interector = [[MyrunInteractor alloc] init];
    myrunPresenter = [[MyrunPresenter alloc] init];
    myrunPresenter.interactor = interector;
    myrunPresenter.wireframe = self;
    interector.output = myrunPresenter;
}

#pragma mark
#pragma mark - wireframe interactor methods

-(void)configureRunReportController:(UIViewController*)controller withRunDetails:(Run*)runDetails
{
    ReportrunWireframe* runReportWireframe_ = [[ReportrunWireframe alloc] init];
    [runReportWireframe_ configureRunReportController:controller withRunDetails:runDetails withHistory:true];
}
-(void)presentRunReport
{
    [viewController performSegueWithIdentifier:[SegueIdentifer segueRunReportIdentifer] sender:viewController];
}


#pragma mark
#pragma mark - public methods
-(void)configureMyRunController:(UIViewController*)controller
{
    viewController = (MyRunVC*)controller;
    viewController.wireframe = self;
    viewController.myRunPresenter = myrunPresenter;
    myrunPresenter.viewInterface = viewController;
}
@end
