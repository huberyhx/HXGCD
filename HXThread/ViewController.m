//
//  ViewController.m
//  HXThread
//
//  Created by hubery on 2017/6/23.
//  Copyright © 2017年 hubery. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self syncMain];
}
//异步函数 + 并发队列
- (void)asyncConcurrent{
    //创建一个并发队列
    dispatch_queue_t queue = dispatch_queue_create("name", DISPATCH_QUEUE_CONCURRENT);
    //用异步函数 将任务加入并发队列
    dispatch_async(queue, ^{
        NSLog(@"-------download1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------download2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------download3--%@",[NSThread currentThread]);
    });
}

//异步函数 + 串行队列
- (void)asyncSerial{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("name", DISPATCH_QUEUE_SERIAL);
    //用异步函数 将任务加入串行队列
    dispatch_async(queue, ^{
        NSLog(@"-------download1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------download2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------download3--%@",[NSThread currentThread]);
    });
}

//同步函数+并发队列
- (void)syncConcurrent{
    //获得全局并发队列
    dispatch_queue_t  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //用同步函数 把任务加入并行队列
    //用同步函数把任务放入串行队列:
    dispatch_sync(queue, ^{
        NSLog(@"-------download1--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"-------download2--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"-------download3--%@",[NSThread currentThread]);
    });

}

//同步函数+串行队列
- (void)syncSerial{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("name", DISPATCH_QUEUE_SERIAL);
    //用同步函数把任务放入串行队列:
    dispatch_sync(queue, ^{
        NSLog(@"-------download1--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"-------download2--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"-------download3--%@",[NSThread currentThread]);
    });
}

//异步函数+主队列
- (void)asyncMain{
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //用异步函数 把任务放到主队列中
    dispatch_async(queue, ^{
        NSLog(@"-------download1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------download2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------download3--%@",[NSThread currentThread]);
    });
}

//同步函数+主队列
- (void)syncMain{
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //用同步函数 将任务加入主队列
    dispatch_sync(queue, ^{
        NSLog(@"-------download1--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"-------download2--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"-------download3--%@",[NSThread currentThread]);
    });
}


@end
