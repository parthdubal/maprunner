//
//  MyRunVC.m
//  MapRunner
//
//  Created by Parth Dubal on 1/6/17.
//  Copyright © 2017 Parth Dubal. All rights reserved.
//

#import "MyRunVC.h"

@interface MyRunVC ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *tableView;
    
}
@end

@implementation MyRunVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"My Run";
    [self setSelfBackEvents:@"Back"];
    [self addEditOption];
    [self.myRunPresenter loadRunHistory];
    
    [self updateDelegates];
}
-(void)updateDelegates
{
    tableView.delegate = self;
    tableView.dataSource = self;
}
-(void)handleBackClick
{
    tableView.editing = false;
    [self.navigationController popViewControllerAnimated:true];
}

-(void)addEditOption
{
    if (self.navigationItem.rightBarButtonItem == nil)
    {
        UIBarButtonItem* back = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(editClick:)];
        self.navigationItem.rightBarButtonItem = back;
    }
    
}
-(void)removeeditOperation
{
    self.navigationItem.rightBarButtonItem = nil;
}
-(void)editClick:(UIBarButtonItem*)btnItem
{
    if (tableView.editing)
    {
        tableView.editing = false;
        btnItem.title = @"Edit";
    }
    else
    {
        tableView.editing = true;
        btnItem.title = @"Done";
    }
}
#pragma mark
#pragma mark - interface interactor methods

-(void)noContentView
{
    // update ui for no result
}
-(void)updateView
{
    [tableView reloadData];
}
#pragma mark
#pragma mark - table delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* result = [self.myRunPresenter runHistory];
    
    if (result.count>0)
    {
        [self addEditOption];
    }
    else
    {
        [self removeeditOperation];
    }
    return result.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView_ dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSArray* arrRuns = [self.myRunPresenter runHistory];
    
    Run* runDetails = [arrRuns objectAtIndex:indexPath.row];
    NSString* strDate = [Common dateForamte:runDetails.timestamp toForamte:@"dd/MM/YYYY HH:mm"];
    cell.textLabel.text = [NSString stringWithFormat:@"Date: %@",strDate];
    NSString* txtDistance = [Common stringifyDistance:runDetails.distance];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Distance: %@",txtDistance];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView_ didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView_.editing)
    {
        return;
    }
    [tableView_ deselectRowAtIndexPath:indexPath animated:true];
    [self.myRunPresenter showRundetailsForIndex:indexPath.row];
}
-(BOOL)tableView:(UITableView *)tableView_ canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView_.editing)
    {
        return true;
    }
    return false;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView_ editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView_ commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.myRunPresenter deleteRunDetails:indexPath.row];
        [tableView_ beginUpdates];
        [tableView_ deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView_ endUpdates];
        
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [self.myRunPresenter configureSegue:segue];
}


@end
