//
//  ViewController.h
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//


#import "BaseViewController.h"
#import "HomePresenter.h"
@interface ViewController : BaseViewController <HomeViewInterface>

@property(weak) id<HomeModuleInterface> homePresenter;

@end

