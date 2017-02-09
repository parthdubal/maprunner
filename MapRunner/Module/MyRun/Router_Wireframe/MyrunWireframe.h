//
//  MyrunWireframe.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyrunWireframeInteractor <NSObject>

-(void)presentRunReport;
-(void)configureRunReportController:(UIViewController*)controller withRunDetails:(Run*)runDetails;
@end

@interface MyrunWireframe : NSObject<MyrunWireframeInteractor>
{
    
}
-(void)configureMyRunController:(UIViewController*)controller;
@end
