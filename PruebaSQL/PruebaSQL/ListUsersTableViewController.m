//
//  ListUsersTableViewController.m
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ListUsersTableViewController.h"

@interface ListUsersTableViewController ()
{
    int nRow;
}
@end

@implementation ListUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userList = [[User alloc]init];
    
    [userList moveDataBaseAtLibrary];
    [userList loadAllUsersOfDataBase];
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
    return [userList.arrayUsers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [(RepoUser*)[userList.arrayUsers objectAtIndex:indexPath.row] nameUser];
    cell.detailTextLabel.text = [(RepoUser*)[userList.arrayUsers objectAtIndex:indexPath.row] docUser];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    viewDetail = [segue destinationViewController];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    //Fila seleccionada!!
    nRow = [self.tableView indexPathForSelectedRow].row;
    
    viewDetail.nameUserDetail = [(RepoUser*)[userList.arrayUsers objectAtIndex:nRow] nameUser];
    
    viewDetail.docUserDetail = [(RepoUser*)[userList.arrayUsers objectAtIndex:nRow] docUser];
    
    viewDetail.ageUserDetail = [(RepoUser*)[userList.arrayUsers objectAtIndex:nRow] ageUser];
    
    viewDetail.dateUserDetail = [(RepoUser*)[userList.arrayUsers objectAtIndex:nRow] dateUser];
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
