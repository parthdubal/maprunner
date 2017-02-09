//
//  Run+CoreDataClass.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Run+CoreDataClass.h"
#import "Location+CoreDataClass.h"

@implementation Run

-(NSArray<Location *>* _Nonnull) locationSetsbyOrder
{
    NSSortDescriptor* dateKey = [NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:true];
    NSArray<Location *>* sortedResult = [self.locations.allObjects sortedArrayUsingDescriptors:@[dateKey]];
    return sortedResult;
}

@end
