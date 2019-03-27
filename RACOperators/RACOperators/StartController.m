//
//  StartController.m
//  RACOperators
//
//  Created by Oniityann on 2018/12/20.
//  Copyright © 2018 Oniityann. All rights reserved.
//

#import "StartController.h"

@interface StartController ()

@property (copy, nonatomic) NSArray *theDataSource;
@property (strong, nonatomic) NSMutableArray *data;

@property (strong, nonatomic) RACCommand *command;

@end

@implementation StartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = @[
                  @{@"id": @1, @"title": @"text1"},
                  @{@"id": @2, @"title": @"text2"},
                  @{@"id": @3, @"title": @"text3"},
                  @{@"id": @1, @"title": @"text1"},
                  @{@"id": @2, @"title": @"text2"},
                  @{@"id": @3, @"title": @"text3"},
                  ].mutableCopy;
    
    self.theDataSource = @[self.data];
    
    [[RACObserve(self, theDataSource)
      distinctUntilChanged]
     subscribeNext:^(id  _Nullable x) {
         [self.tableView reloadData];
     }];
    
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@[
                                   @{@"id": @1, @"title": @"text1"},
                                   @{@"id": @4, @"title": @"text4"},
                                   @{@"id": @5, @"title": @"text5"}
                                   ].mutableCopy];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    // 先 log 一次 self.data.copy 的内容
    // command 执行后发出新获取到的数据
//    [[self.command.executionSignals.switchToLatest startWith:self.data.copy] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"~~~%@~~~", x);
//    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        RAC(self, data) = [[self.command.executionSignals.switchToLatest
                            startWith:self.data]
                           map:^id _Nullable(NSMutableArray * _Nullable events) {
                               [events addObject:@{@"id": @9, @"title": @"text9"}];
                               NSLog(@"%@", events);
                               return events;
                           }];
    });
   
}

- (void)add:(UIBarButtonItem *)sender {
    [self.command execute:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.theDataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.theDataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dict = self.theDataSource[indexPath.section][indexPath.row];
    cell.textLabel.text = dict[@"title"];
    
    return cell;
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
