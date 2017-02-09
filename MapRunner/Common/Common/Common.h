//
//  Common.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Common : NSObject
+ (NSString *)stringifyDistance:(CGFloat)meters;
+ (NSString *)stringifySecondCount:(NSInteger)seconds usingLongFormat:(BOOL)longFormat;
+ (NSString *)stringifyAvgPaceFromDist:(CGFloat)meters overTime:(NSInteger)seconds;
+ (NSString*)dateForamte:(NSDate*)date toForamte:(NSString*)formate;
@end
