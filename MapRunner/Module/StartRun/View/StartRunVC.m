//
//  StartRunVC.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "StartRunVC.h"

@interface StartRunVC ()
{
    __weak IBOutlet UILabel *lblSpeed;
    __weak IBOutlet UILabel *lblStatus;
    __weak IBOutlet UILabel *lblTime;
    __weak IBOutlet UILabel *lblDistance;
    
    __weak IBOutlet UIButton *btnCancel;
    __weak IBOutlet UIButton *btnStart;
    BOOL didCancel;
}
@end

@implementation StartRunVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Start New Run";
    [self setSelfBackEvents:@"Back"];
    [self defaultUIState];
}

-(void)defaultUIState
{
    didCancel = false;
    btnStart.enabled = true;
    btnCancel.enabled = false;
    [btnStart setTitle:@"Start" forState:UIControlStateNormal];

    lblSpeed.text = @"0.0 km/h";
    lblStatus.text = @"Not moving";
    
    lblTime.text = [NSString stringWithFormat:@"Time: 00:00:00"];
    lblDistance.text = [NSString stringWithFormat:@"Distance: 0 KM"];
}
#pragma mark -
#pragma mark -  UI Events

-(void)handleBackClick
{
    if ([self.startRunPresenter isActiveRun])
    {
        [self.startRunPresenter showConfirmcancel];
        return;
    }
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)startRunClick:(UIButton *)sender
{
    if([self.startRunPresenter isActiveRun])
    {
        [self.startRunPresenter showConfirmFinish];
    }
    else
    {
        [btnStart setTitle:@"Finish" forState:UIControlStateNormal];
        [self.startRunPresenter startRunFitness];
        btnCancel.enabled = true;
    }
}
- (IBAction)cancelRunClick:(UIButton *)sender
{
    if ([self.startRunPresenter isActiveRun])
    {
        didCancel = true;
        [self.startRunPresenter showConfirmcancel];
    }
}
#pragma mark -
#pragma mark - View Interface
-(void)speedUpdateObserver:(NSString*)txtSpeed
{
    lblSpeed.text = txtSpeed;
}
-(void)speedTypeObserver:(NSString*)txtSpeedType
{
    lblStatus.text = txtSpeedType;
}
-(void)runTimes:(NSString*)txtTime
{
    lblTime.text = [NSString stringWithFormat:@"Time: %@",txtTime];
}
-(void)runDistance:(NSString*)txtDistance
{
    lblDistance.text = [NSString stringWithFormat:@"Distance: %@",txtDistance];
}
-(void)didCancelRun
{
    if (didCancel)
    {
        [self defaultUIState];
    }
}
-(void)didFinishRunFitnes;
{
    [self defaultUIState];
    [self.startRunPresenter finishRunFitness];
    btnCancel.enabled = false;
    [btnStart setTitle:@"Start" forState:UIControlStateNormal];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.startRunPresenter configureSegue:segue];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
@end
