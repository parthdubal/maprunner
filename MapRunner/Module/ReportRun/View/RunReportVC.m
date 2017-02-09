//
//  RunReportVC.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "RunReportVC.h"
#import <MapKit/MapKit.h>

@interface RunReportVC ()
{
    
    __weak IBOutlet MKMapView *mapView;
    __weak IBOutlet UILabel *lblDate;
    __weak IBOutlet UILabel *lblDistance;
    __weak IBOutlet UILabel *lblTime;
    
}
@end

@implementation RunReportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Run Report";
    [self setSelfBackEvents:@"Back"];
    [self updateViews];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self releaseMapdetails];
}
-(void)updateViews
{
    Run * runDetails = [self.runReportPresenter runReportDetails];
    
    if (runDetails)
    {
        NSString* txtTime = [Common stringifySecondCount:runDetails.duration usingLongFormat:false];
        NSString* txtDistance = [Common stringifyDistance:runDetails.distance];
        NSString* strDate = [Common dateForamte:runDetails.timestamp toForamte:@"dd/MM/YYYY HH:mm"];
        
        lblDate.text = [NSString stringWithFormat:@"Date: %@",strDate];
        lblDistance.text = [NSString stringWithFormat:@"Distance: %@",txtDistance];
        lblTime.text = [NSString stringWithFormat:@"Time: %@",txtTime];
    }
    [self.runReportPresenter loadMapOperation:mapView];
}
-(void)releaseMapdetails
{
    [mapView setMapType:MKMapTypeHybrid];
    [mapView setDelegate:nil];
    [mapView removeFromSuperview];
    mapView = nil;
}
#pragma mark -
#pragma mark -  UI Events

-(void)handleBackClick
{
    [self.runReportPresenter dismissReportScreen];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


@end
