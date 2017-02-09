//
//  Run+CoreDataProperties.m
//  MapRunner
//
//  Created by Parth Dubal on 1/12/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "Run+CoreDataProperties.h"

@implementation Run (CoreDataProperties)

+ (NSFetchRequest<Run *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:@"Run"];
}

@dynamic distance;
@dynamic duration;
@dynamic timestamp;
@dynamic completedRun;
@dynamic locations;

@end
