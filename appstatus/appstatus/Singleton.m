//
//  Singleton.m
//  appstatus
//
//  Created by lgq on 2017/3/24.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *_instance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [Singleton sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone*)zone{
    return [Singleton sharedInstance];
}

@end
