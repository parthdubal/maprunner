//
//  MyRunVC.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "BaseViewController.h"
#import "MyrunViewInterface.h"
#import "MyrunPresenter.h"

@interface MyRunVC : BaseViewController<MyrunViewInterface>
{
    
}

@property(weak) id<MyrunModuleInterface> myRunPresenter;
@property(nonatomic) id<MyrunWireframeInteractor>  wireframe;

@end
