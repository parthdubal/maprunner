//
//  ViewController.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *lblSpeed;
    
    __weak IBOutlet UILabel *lblStatus;
    
    __weak IBOutlet UIButton *btnRun;
    __weak IBOutlet UIButton *btnStartRun;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Map Runner";
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.homePresenter startRequestMotionUpdate];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.homePresenter stopRequestMotionUpdate];
}
- (IBAction)clickMyRun:(UIButton *)sender
{
    [_homePresenter showMyRunDetails];
}

- (IBAction)clickStartRun:(UIButton *)sender
{
    [_homePresenter showStartDetails];
}

#pragma mark
#pragma mark - home view interface
-(void)speedUpdateResult:(NSString*)txtSpeedValue
{
    lblSpeed.text = txtSpeedValue;
}
-(void)speedTypeResult:(NSString*)txtSpeedType
{
    lblStatus.text = txtSpeedType;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.homePresenter configureSegue:segue];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
