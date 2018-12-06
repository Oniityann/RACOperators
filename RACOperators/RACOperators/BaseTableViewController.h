//
//  BaseTableViewController.h
//  RACOperators
//
//  Created by Oniityann on 2018/12/6.
//  Copyright © 2018 Oniityann. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UITableViewController

@property (strong, nonatomic, readonly) RACSubject *subject;
@property (strong, nonatomic, readonly) NSMutableArray *dataSource;

- (void)add:(UIBarButtonItem *)sender;

@end

NS_ASSUME_NONNULL_END
