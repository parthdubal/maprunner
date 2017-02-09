//
//  HomeInteractor.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol HomeInteractorInput <NSObject>

-(void)registerSpeedObserver;
-(void)deregisterSpeedObserver;

@end

@protocol HomeInteractorOutput <NSObject>

-(void)speedUpdateObserver:( NSString* _Nonnull )txtSpeed;
-(void)speedTypeObserver:( NSString* _Nonnull )txtSpeedType;

@end

@interface HomeInteractor : NSObject<HomeInteractorInput>

@property (nonatomic,weak) _Nullable id<HomeInteractorOutput> output;

@end
