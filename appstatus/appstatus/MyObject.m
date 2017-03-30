//
//  MyObject.m
//  appstatus
//
//  Created by lgq on 2017/3/25.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject

- (instancetype)init
{
    self = [super init];
    NSLog(@"%s",__FUNCTION__);
    return self;
}

+ (void)load
{
    [super load];
    NSLog(@"%s",__FUNCTION__);
}

+ (void)initialize
{
    [super initialize];
    NSLog(@"%s",__FUNCTION__);
}

- (void)messagge{
    NSLog(@"%s",__FUNCTION__);
}

@end
