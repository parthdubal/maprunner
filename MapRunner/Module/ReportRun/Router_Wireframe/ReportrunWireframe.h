//
//  ReportrunWireframe.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReportrunWireframeInteractor <NSObject>

-(void)dismissHistoryreport;
-(void)dismissnewRunReport;

@end

@interface ReportrunWireframe : NSObject <ReportrunWireframeInteractor>
{
    
}
-(void)configureRunReportController:(UIViewController*)controller withRunDetails:(Run*)runDetails withHistory:(BOOL)isHistory;
@end
