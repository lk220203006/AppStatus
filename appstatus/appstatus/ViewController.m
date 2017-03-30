//
//  ViewController.m
//  appstatus
//
//  Created by lgq on 2017/3/22.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "MyObject.h"


@interface ViewController ()

@property (nonatomic, copy) NSMutableArray *a;

@property (nonatomic, strong) NSMutableArray *b;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s",__FUNCTION__);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"=================1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"=================2");
        });
        NSLog(@"=================3");
    });
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@(1),@(2),@(3),@(4), nil];
    self.a = array;
    self.b = array;
    [array removeAllObjects];
    NSLog(@"array is [%@],[%@]",self.a,self.b);
    NSLog(@"1");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"1-1");
        dispatch_sync(queue, ^{
            NSLog(@"hello");
        });
    });
    
    NSLog(@"2");
    
    [self methoda];
    [self methodb];
    
    Method m1 = class_getInstanceMethod([self class], @selector(methoda));
    Method m2 = class_getInstanceMethod([self class], @selector(methodb));
    method_exchangeImplementations(m1, m2);
    
    [self methoda];
    [self methodb];
    
    
    NSString *str = @"2";
    NSArray *array2 = @[str];
    NSLog(@"array:%@",array2);
    str = @"3";
    NSLog(@"array:%@",array2);
    
    NSMutableArray *array3 = [[NSMutableArray alloc] init];
    NSLog(@"array3:%@",array3);
    void (^blk)(void) = ^ void (void){
        id obj = [[NSObject alloc] init];
        [array3 addObject:obj];
    };
    blk();
    NSLog(@"array3:%@",array3);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonclicked:(UIButton *)sender {
//    MyObject *obj = [[MyObject alloc] init];
//    [obj messagge];
//    obj = nil;
//    [obj messagge];
//    NSArray *array = @[@(1),@(2),@(3),@(4)];
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        dispatch_apply([array count], queue, ^(size_t index) {
//            NSLog(@"%zu : %@",index,array[index]);
//        });
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"done");
//        });
//    });
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 100000; i++) {
//        dispatch_async(queue, ^{
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            [array addObject:@(i)];
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
//    NSLog(@"array:%@,%@",array[0],array[array.count-1]);
    
    NSMutableArray *dataSorce = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
    NSLog(@"dataSorce value is%@",dataSorce);
    [self kuaipai:dataSorce withLeft:0 AndRight:dataSorce.count-1];
    NSLog(@"dataSorce value is%@",dataSorce);
}


- (void)methoda{
    NSLog(@"methoda");
}

- (void)methodb{
    NSLog(@"methodb");
}


- (void)kuaipai:(NSMutableArray*)datesource withLeft:(NSInteger)left AndRight:(NSInteger)right{
    if (left >= right) {
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [datesource[i] integerValue];
    while (i < j) {
        while (i < j && [datesource[j] integerValue] > key) {
            j--;
        }
        datesource[i] = datesource[j];
        while (i < j && [datesource[i] integerValue] <= key) {
            i++;
        }
        datesource[j] = datesource[i];
    }
    datesource[i] = @(key);
    [self kuaipai:datesource withLeft:left AndRight:i-1];
    [self kuaipai:datesource withLeft:i+1 AndRight:right];
}


@end
