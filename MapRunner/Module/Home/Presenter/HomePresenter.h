//
//  HomePresenter.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModuleInterface.h"
#import "HomeInteractor.h"
#import "HomeViewInterface.h"
#import "HomeWireframe.h"

@interface HomePresenter : NSObject<HomeModuleInterface,HomeInteractorOutput>
{
    
}

@property (weak,nonatomic) _Nullable id<HomeViewInterface> viewInterface;
@property (nonatomic) _Nullable id<HomeInteractorInput> interactor;
@property (weak,nonatomic) _Nullable id<HomeWireframeInteractor> wireframe;

@end
