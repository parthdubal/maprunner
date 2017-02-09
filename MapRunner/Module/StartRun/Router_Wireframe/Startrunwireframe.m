//
//  Startrunwireframe.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "Startrunwireframe.h"
#import "StartRunVC.h"

#import "StartrunPresenter.h"
#import "StartrunInteractor.h"

#import "ReportrunWireframe.h"

@interface Startrunwireframe()
{
    __weak StartRunVC* viewController;
    StartrunPresenter* startRunPresenter;
    
    
}

@end
@implementation Startrunwireframe
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self configureStartRunArchitect];
    }
    return self;
}
-(void)configureStartRunArchitect
{
    StartrunInteractor* interector = [[StartrunInteractor alloc] init];
    startRunPresenter = [[StartrunPresenter alloc] init];
    startRunPresenter.interactor = interector;
    startRunPresenter.wireframe = self;
    interector.output = startRunPresenter;
}
-(void)configureStartRunController:(UIViewController*)controller
{
    viewController = (StartRunVC*)controller;
    viewController.wireframe = self;
    viewController.startRunPresenter = startRunPresenter;
    startRunPresenter.viewInterface = viewController;
}

#pragma mark - 
#pragma mark -  Wireframe Interactor
-(void)configureRunReportController:(UIViewController*)controller withRunInfo:(Run*)run historyInfo:(BOOL)isHistroy
{
    ReportrunWireframe* reportRunwireframe = [[ReportrunWireframe alloc] init];
    [reportRunwireframe configureRunReportController:controller withRunDetails:run withHistory:isHistroy];
}
-(void)presentRunReportScreen
{
    [viewController performSegueWithIdentifier:[SegueIdentifer segueRunReportIdentifer] sender:viewController];
}
-(void)showCancelRunConfirmaiton
{
    __weak typeof(self) weakSelf = self;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Confrim!" message:@"Are you sure want to cancel your run activity?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [weakSelf performYesOperation];
        
    }];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:yesAction];
    [alert addAction:noAction];
    [viewController presentViewController:alert animated:true completion:nil];
}
-(void)showFinishConfirmation;
{
    __weak typeof(self) weakSelf = self;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Confrim!" message:@"Are you sure want to finish your run activity?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [weakSelf performFinishYesOperation];
        
    }];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:yesAction];
    [alert addAction:noAction];
    [viewController presentViewController:alert animated:true completion:nil];
}


#pragma mark
#pragma mark - internal methods

-(void)performFinishYesOperation
{
    [startRunPresenter finishRunFitness];
}

-(void)performYesOperation
{
    [startRunPresenter cancelRunFitness];
}

-(void)dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
@end
