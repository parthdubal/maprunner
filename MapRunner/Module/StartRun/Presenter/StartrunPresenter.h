//
//  StartrunPresenter.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StartrunInteractor.h"
#import "StartrunModuleInterface.h"
#import "StartrunViewInterface.h"
#import "Startrunwireframe.h"

@interface StartrunPresenter : NSObject<StartrunInteractorOutput,StartrunModuleInterface>
{
    
}

@property (weak,nonatomic) _Nullable id<StartrunViewInterface> viewInterface;
@property (nonatomic) _Nullable id<StartrunInteractorInput> interactor;
@property (weak,nonatomic) _Nullable id<StartrunwireframeInteractor> wireframe;

@end
