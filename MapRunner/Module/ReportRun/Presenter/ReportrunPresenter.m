//
//  ReportrunPresenter.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "ReportrunPresenter.h"

@interface ReportrunPresenter ()<MKMapViewDelegate>
{
    
}
@end

@implementation ReportrunPresenter

-(Run* _Nullable)runReportDetails
{
    return _runDetails;
}
-(void)dismissReportScreen
{
    if (_isHistoryReport)
    {
        [self.wireframe dismissHistoryreport];
    }
    else
    {
        [self.wireframe dismissnewRunReport];
    }
}
-(void)loadMapOperation:(MKMapView* _Nonnull)mapView
{
    mapView.delegate = self;
    [mapView setRegion:[self runRegion]];
    [mapView addOverlay:[self runPolyline]];
}
#pragma mark
#pragma mark - map delegates methods
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolyline *polyLine = (MKPolyline *)overlay;
        MKPolylineRenderer *aRenderer = [[MKPolylineRenderer alloc] initWithPolyline:polyLine];
        aRenderer.strokeColor = [UIColor blackColor];
        aRenderer.lineWidth = 3;
        return aRenderer;
    }
    
    return nil;
}
#pragma mark
#pragma mark - private methods
-(MKPolyline*)runPolyline
{
    NSArray* arrLocations = [_runDetails locationSetsbyOrder];

    CLLocationCoordinate2D coords[arrLocations.count];
    
    for (int i = 0; i < arrLocations.count; i++) {
        Location *location = [arrLocations objectAtIndex:i];
        coords[i] = CLLocationCoordinate2DMake(location.lattitude, location.longitude);
    }

    return [MKPolyline polylineWithCoordinates:coords count:arrLocations.count];
}
-(MKCoordinateRegion)runRegion
{
    MKCoordinateRegion region;
    NSArray* arrLocations = [_runDetails locationSetsbyOrder];
    Location *initialLoc = arrLocations.firstObject;
    
    float minLat = initialLoc.lattitude;
    float minLng = initialLoc.longitude;
    float maxLat = initialLoc.lattitude;
    float maxLng = initialLoc.longitude;
    
    for (Location *location in arrLocations)
    {
        if (location.lattitude < minLat) {
            minLat = location.lattitude;
        }
        if (location.longitude < minLng) {
            minLng = location.longitude;
        }
        if (location.lattitude > maxLat) {
            maxLat = location.lattitude;
        }
        if (location.longitude > maxLng) {
            maxLng = location.longitude;
        }
    }
    
    region.center.latitude = (minLat + maxLat) / 2.0f;
    region.center.longitude = (minLng + maxLng) / 2.0f;
    
    region.span.latitudeDelta = (maxLat - minLat) * 1.1f; // 10% padding
    region.span.longitudeDelta = (maxLng - minLng) * 1.1f; // 10% padding
    return region;
}
@end
