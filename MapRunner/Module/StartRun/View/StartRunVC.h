//
//  StartRunVC.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "BaseViewController.h"
#import "StartrunViewInterface.h"

#import "StartrunPresenter.h"

@interface StartRunVC : BaseViewController<StartrunViewInterface>
{
    
}

@property(weak) id<StartrunModuleInterface> startRunPresenter;
@property(nonatomic) id<StartrunwireframeInteractor>  wireframe;

@end
