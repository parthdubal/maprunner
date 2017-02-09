//
//  Run+CoreDataClass.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

NS_ASSUME_NONNULL_BEGIN

@interface Run : NSManagedObject
-(NSArray<Location*>* _Nonnull) locationSetsbyOrder;
@end

NS_ASSUME_NONNULL_END

#import "Run+CoreDataProperties.h"
