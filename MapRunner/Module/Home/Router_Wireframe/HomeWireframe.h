//
//  HomeWireframe.h
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeWireframeInteractor <NSObject>

-(void)presentMyRunController;
-(void)presentStartRunController;
-(void)configureMyRunController:(UIViewController*)controller;
-(void)configureStartRunController:(UIViewController*)controller;
@end

@class RootWireframe;
@interface HomeWireframe : NSObject <HomeWireframeInteractor>
{
    
}
@property (nonatomic,strong) RootWireframe* rootWireframe;
-(void)showHomefromWindow:(UIWindow*)window;

@end
