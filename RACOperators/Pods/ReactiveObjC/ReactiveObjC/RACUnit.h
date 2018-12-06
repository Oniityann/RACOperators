//
//  RACUnit.h
//  ReactiveObjC
//
//  Created by Josh Abernathy on 3/27/12.
//  Copyright (c) 2012 GitHub, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// A unit represents an empty value.
///
/// It should never be necessary to create a unit yourself. Just use +defaultUnit.
@interface RACUnit : NSObject

/// A singleton instance.
+ (RACUnit *)defaultUnit;

@end

NS_ASSUME_NONNULL_END
