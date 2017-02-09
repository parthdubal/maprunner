//
//  MyrunPresenter.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyrunModuleInterface.h"
#import "MyrunInteractor.h"
#import "MyrunViewInterface.h"
#import "MyrunWireframe.h"

@interface MyrunPresenter : NSObject<MyrunInteractorOutput,MyrunModuleInterface>
{
    
}

@property (weak,nonatomic) _Nullable id<MyrunViewInterface> viewInterface;
@property (nonatomic) _Nullable id<MyrunInteractorInput> interactor;
@property (weak,nonatomic) _Nullable id<MyrunWireframeInteractor> wireframe;

@end
