//
//  Common.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "Common.h"

static bool const isMetric = YES;
static float const metersInKM = 1000;
static float const metersInMile = 1609.344;

@implementation Common

+ (NSString *)stringifyDistance:(CGFloat)meters
{
    CGFloat unitDivider;
    NSString *unitName;
    
    // metric
    if (isMetric) {
        unitName = @"km";
        // to get from meters to kilometers divide by this
        unitDivider = metersInKM;
        // U.S.
    } else {
        unitName = @"mi";
        // to get from meters to miles divide by this
        unitDivider = metersInMile;
    }
    
    return [NSString stringWithFormat:@"%.2f %@", (meters / unitDivider), unitName];
}

+ (NSString *)stringifySecondCount:(NSInteger)seconds usingLongFormat:(BOOL)longFormat
{
    NSInteger remainingSeconds = seconds;
    NSInteger hours = remainingSeconds / 3600;
    remainingSeconds = remainingSeconds - hours * 3600;
    NSInteger minutes = remainingSeconds / 60;
    remainingSeconds = remainingSeconds - minutes * 60;
    
    if (longFormat) {
        if (hours > 0) {
            return [NSString stringWithFormat:@"%ldhr %ldmin %ldsec", (long)hours, (long)minutes, (long)remainingSeconds];
        } else if (minutes > 0) {
            return [NSString stringWithFormat:@"%ldmin %ldsec", (long)minutes, (long)remainingSeconds];
        } else {
            return [NSString stringWithFormat:@"%ldsec", (long)remainingSeconds];
        }
    } else {
        if (hours > 0) {
            return [NSString stringWithFormat:@"%02ld:%02li:%0ldi", (long)hours, (long)minutes, (long)remainingSeconds];
        } else if (minutes > 0) {
            return [NSString stringWithFormat:@"%02ld:%02ld", (long)minutes, (long)remainingSeconds];
        } else {
            return [NSString stringWithFormat:@"00:%02ld", (long)remainingSeconds];
        }
    }
}

+ (NSString *)stringifyAvgPaceFromDist:(CGFloat)meters overTime:(NSInteger)seconds
{
    if (seconds == 0 || meters == 0) {
        return @"0";
    }
    
    float avgPaceSecMeters = seconds / meters;
    
    float unitMultiplier;
    NSString *unitName;
    
    // metric
    if (isMetric) {
        unitName = @"min/km";
        unitMultiplier = metersInKM;
        // U.S.
    } else {
        unitName = @"min/mi";
        unitMultiplier = metersInMile;
    }
    
    int paceMin = (int) ((avgPaceSecMeters * unitMultiplier) / 60);
    int paceSec = (int) (avgPaceSecMeters * unitMultiplier - (paceMin*60));
    
    return [NSString stringWithFormat:@"%i:%02i %@", paceMin, paceSec, unitName];
}

+ (NSString*)dateForamte:(NSDate*)date toForamte:(NSString*)formate
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = formate;
    NSString* strDate = [formatter stringFromDate:date];
    return strDate;
}

@end
