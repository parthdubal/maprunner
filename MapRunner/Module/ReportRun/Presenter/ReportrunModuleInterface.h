//
//  ReportrunModuleInterface.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol ReportrunModuleInterface <NSObject>

-(Run* _Nullable)runReportDetails;
-(void)dismissReportScreen;
-(void)loadMapOperation:(MKMapView* _Nonnull)mapView;


@end
