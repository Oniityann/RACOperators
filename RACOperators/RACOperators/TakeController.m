//
//  TakeController.m
//  RACOperators
//
//  Created by Oniityann on 2018/12/7.
//  Copyright © 2018 Oniityann. All rights reserved.
//

#import "TakeController.h"

@interface TakeController ()

@end

@implementation TakeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取前2次的
    @weakify(self);
//    [[self.subject
//      take:2]
//     subscribeNext:^(id  _Nullable x) {
//         @strongify(self);
//         [self.dataSource addObject:x];
//         [self.tableView reloadData];
//     }];
    
//    [[self.subject
//      takeWhileBlock:^BOOL(id  _Nullable x) {
//          return [x integerValue] % 2 == 0;
//      }] subscribeNext:^(id  _Nullable x) {
//          @strongify(self);
//          [self.dataSource addObject:x];
//          [self.tableView reloadData];
//      }];
    
//    [[self.subject
//      takeUntilBlock:^BOOL(id  _Nullable x) {
//          return [x integerValue] % 2 == 0;
//      }] subscribeNext:^(id  _Nullable x) {
//          @strongify(self);
//          [self.dataSource addObject:x];
//          [self.tableView reloadData];
//      }];
    
    // 配合 complete 事件
//    [[self.subject
//      takeLast:2]
//     subscribeNext:^(id  _Nullable x) {
//         @strongify(self);
//         [self.dataSource addObject:x];
//         [self.tableView reloadData];
//     }];
    
//    [[self.subject
//      takeUntil:self.rac_willDeallocSignal]
//     subscribeNext:^(id  _Nullable x) {
//         @strongify(self);
//         [self.dataSource addObject:x];
//         [self.tableView reloadData];
//     }];
    
}

- (void)add:(UIBarButtonItem *)sender {
    [self.subject sendNext:@"2"];
    [self.subject sendNext:@"1"];
    [self.subject sendNext:@"4"];
    [self.subject sendNext:@"5"];
    [self.subject sendCompleted];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

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
