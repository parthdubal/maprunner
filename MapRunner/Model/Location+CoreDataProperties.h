//
//  Location+CoreDataProperties.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Location+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Location (CoreDataProperties)

+ (NSFetchRequest<Location *> *)fetchRequest;

@property (nonatomic) double lattitude;
@property (nonatomic) double longitude;
@property (nullable, nonatomic, copy) NSDate *timestamp;
@property (nullable, nonatomic, retain) Run *run;

@end

NS_ASSUME_NONNULL_END
