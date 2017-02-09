//
//  Location+CoreDataProperties.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Location+CoreDataProperties.h"

@implementation Location (CoreDataProperties)

+ (NSFetchRequest<Location *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Location"];
}

@dynamic lattitude;
@dynamic longitude;
@dynamic timestamp;
@dynamic run;

@end
