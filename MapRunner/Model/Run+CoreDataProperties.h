//
//  Run+CoreDataProperties.h
//  MapRunner
//
//  Created by Parth Dubal on 1/12/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "Run+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Run (CoreDataProperties)

+ (NSFetchRequest<Run *> *)fetchRequest;

@property (nonatomic) float distance;
@property (nonatomic) int16_t duration;
@property (nullable, nonatomic, copy) NSDate *timestamp;
@property (nonatomic) BOOL completedRun;
@property (nullable, nonatomic, retain) NSSet<Location *> *locations;

@end

@interface Run (CoreDataGeneratedAccessors)

- (void)addLocationsObject:(Location *)value;
- (void)removeLocationsObject:(Location *)value;
- (void)addLocations:(NSSet<Location *> *)values;
- (void)removeLocations:(NSSet<Location *> *)values;

@end

NS_ASSUME_NONNULL_END
