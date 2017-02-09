//
//  MyrunPresenter.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "MyrunPresenter.h"

@interface MyrunPresenter ()
{
    NSMutableArray<Run*>* arrRunDetails;
    NSInteger indexDetail;
}
@end

@implementation MyrunPresenter


-(void)runReportResults:(NSArray<Run*>* _Nonnull)arrRunReports
{
    arrRunDetails = [NSMutableArray arrayWithArray:arrRunReports];
    [self sendViewUpdates];
}

-(void)loadRunHistory
{
    [self.interactor loadRunReports];
}

-(NSArray<Run*>*)runHistory
{
    return arrRunDetails;
}
-(void)deleteRunDetails:(NSInteger)index
{
    Run* runInfo = [arrRunDetails objectAtIndex:index];
    [arrRunDetails removeObjectAtIndex:index];
    [self.interactor deleteRunDetail:runInfo];
    [self sendViewUpdates];
}
-(void)showRundetailsForIndex:(NSInteger)index
{
    indexDetail = index;
    [_wireframe presentRunReport];
}
-(void)sendViewUpdates
{
    if (arrRunDetails.count > 0)
    {
        [self.viewInterface updateView];
    }
    else
    {
        [self.viewInterface noContentView];
    }
}
-(void)configureSegue:(UIStoryboardSegue* _Nonnull)segue
{
    if ([[segue identifier] isEqualToString:[SegueIdentifer segueRunReportIdentifer]])
    {
        Run* runInfo = arrRunDetails[indexDetail];
        [_wireframe configureRunReportController:segue.destinationViewController withRunDetails:runInfo];
    }
}
@end
