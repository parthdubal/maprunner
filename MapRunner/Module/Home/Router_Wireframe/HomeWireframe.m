//
//  HomeWireframe.m
//  MapRunner
//
//  Created by Parth Dubal on 1/10/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "HomeWireframe.h"
#import "RootWireframe.h"

#import "ViewController.h"
#import "HomePresenter.h"

// connecting router wireframe
#import "Startrunwireframe.h"
#import "MyrunWireframe.h"


#import "MyRunVC.h"
#import "StartRunVC.h"

@interface HomeWireframe () <UIGestureRecognizerDelegate>
{
    __weak ViewController* rootController;
    RootWireframe* _rootWireframe;
    HomePresenter* homePresenter;
    
    // wireframe for all possible connections!
    Startrunwireframe* startRunWireframe;
    MyrunWireframe* myRunWireframe;
}
@end
@implementation HomeWireframe
@synthesize rootWireframe = _rootWireframe;

-(id)init{
    self = [super init];
    if (self)
    {
        [self configurateArchitech];
    }
    return self;
}
-(void)configurateArchitech
{
    HomeInteractor* interector = [[HomeInteractor alloc] init];
    homePresenter = [[HomePresenter alloc]init];
    homePresenter.interactor = interector;
    homePresenter.wireframe = self;
    interector.output = homePresenter;
    
}
-(void)showHomefromWindow:(UIWindow*)window
{
    UINavigationController* navController =  (UINavigationController*) window.rootViewController;
    navController.interactivePopGestureRecognizer.delegate = nil;
    
    rootController = navController.viewControllers.firstObject;
    homePresenter.viewInterface = rootController;
    rootController.homePresenter = homePresenter;
}
#pragma mark -
#pragma mark - Internal methods;
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return true;
}
#pragma mark -
#pragma mark - Wireframe interactor;

-(void)presentMyRunController
{
    [rootController performSegueWithIdentifier:[SegueIdentifer segueMyrunIdentifer] sender:rootController];
//    MyRunVC* runVC = [rootController.storyboard instantiateViewControllerWithIdentifier:@"MyRunVC"];
//    [rootController.navigationController pushViewController:runVC animated:true];
}
-(void)presentStartRunController
{
    [rootController performSegueWithIdentifier:[SegueIdentifer segueStartRunIdentifer] sender:rootController];
    
//    StartRunVC* runVC = [rootController.storyboard instantiateViewControllerWithIdentifier:@"StartRunVC"];
//    [rootController.navigationController pushViewController:runVC animated:true];
}
-(void)configureMyRunController:(UIViewController*)controller
{
    MyRunVC* runVC = (MyRunVC*) controller;
    
    MyrunWireframe* myRunWireframe_ = [[MyrunWireframe alloc]init];
    [myRunWireframe_ configureMyRunController:runVC];
}

-(void)configureStartRunController:(UIViewController*)controller
{
    StartRunVC* runVC = (StartRunVC*)controller;
    Startrunwireframe* _startRunWireframe = [[Startrunwireframe alloc]init];
    [_startRunWireframe configureStartRunController:runVC];
}

@end
