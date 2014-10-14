//
//  ListMarketTableViewController.m
//  Lista de Mercado
//
//  Created by Jhon Wilfer Orrego on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ListMarketTableViewController.h"
#import "SWTableViewCell.h"
#import "UMTableViewCell.h"

@interface ListMarketTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL useCustomCells;
@property (nonatomic, weak) UIRefreshControl *refreshControl;

@end

@implementation ListMarketTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //----------------------------------------------------------------
    //Para Swipe de botones en Celda
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //self.tableView.rowHeight = 90;
    
    //self.navigationItem.title = @"Pull to Toggle Cell Type";
    
    // Setup refresh control for example app
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(toggleCells:) forControlEvents:UIControlEventValueChanged];
    refreshControl.tintColor = [UIColor blueColor];
    
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    
    // If you set the seperator inset on iOS 6 you get a NSInvalidArgumentException...weird
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // Makes the horizontal row seperator stretch the entire length of the table view
    }
    //----------------------------------------------------------------
    
    listMarket = [[Market alloc]init];
    //Solo trae lista con id=1
    [listMarket loadMarketWithIdListMarket:_dataTransferIdList];
    [listMarket sumValuesMarketList:_dataTransferIdList];
    _totalMarketLabel.text = [NSString stringWithFormat:@"Total: $ %@",listMarket.totalValuesMarket];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [listMarket.arrayProduct count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UMTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"UMCell" forIndexPath:indexPath];
    //SWTableViewCell * cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"UMCell"];
    
    /*
    if (cell == nil) {
        cell.rightUtilityButtons = [self rightButtons];
        //cell.delegate = self;
    }
    */
    
    [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:58.0f];
    cell.delegate = self;
    
    cell.dsProductLabel.text = [listMarket.arrayProduct objectAtIndex:indexPath.row];
    
    cell.cantProductLabel.text = [listMarket.arrayCantProduct objectAtIndex:indexPath.row];
    
    cell.subtotalProductLabel.text = [listMarket.arraySubTotal objectAtIndex:indexPath.row];
    
    cell.delegate = self;
    
    return cell;
}

/*
- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"More"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}
*/

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"check.png"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock.png"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross.png"]];
    
    return rightUtilityButtons;
}

-(void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            NSLog(@"left button 0 Chulo");
            break;
        case 1:
            NSLog(@"left button 1 0");
            break;
        case 2:
            NSLog(@"left button X");
            break;
        case 3:
            NSLog(@"left btton Igual");
        case 4:
            NSLog(@"Mi boton: Chulo!!");
            
        default:
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selecciono la celda: %@", [self.tableView indexPathForSelectedRow]);
    
    if (!tableView.isEditing) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)toggleCells:(UIRefreshControl*)refreshControl
{
    [refreshControl beginRefreshing];
    self.useCustomCells = !self.useCustomCells;
    if (self.useCustomCells)
    {
        self.refreshControl.tintColor = [UIColor yellowColor];
    }
    else
    {
        self.refreshControl.tintColor = [UIColor blueColor];
    }
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state
{
    switch (state) {
        case 0:
            NSLog(@"utility buttons closed");
            break;
        case 1:
            NSLog(@"left utility buttons open");
            break;
        case 2:
            NSLog(@"right utility buttons open");
            break;
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    switch (state) {
        case 1:
            // set to NO to disable all left utility buttons appearing
            return YES;
            break;
        case 2:
            // set to NO to disable all right utility buttons appearing
            return YES;
            break;
        default:
            break;
    }
    
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
