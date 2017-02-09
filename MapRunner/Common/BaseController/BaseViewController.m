//
//  BaseViewController.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

-(void)setSelfBackEvents:(NSString*)backTitle
{
    UIBarButtonItem* back = [[UIBarButtonItem alloc]initWithTitle:backTitle style:UIBarButtonItemStyleDone target:self action:@selector(handleBackClick)];
    self.navigationItem.leftBarButtonItem = back;
}
-(void)handleBackClick
{
    [self.navigationController popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
