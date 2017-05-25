//
//  ViewController.m
//  TBBaseApp
//
//  Created by toby on 27/03/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "ViewController.h"
#import "APPUtils.h"
#import "TBPredicate.h"
#import "TBRuquestManager.h"
#import "TBRequestOnAdmin.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"device:%@", [APPUtils getDeviceModel]);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    NSLog(@"%d", [TBPredicate share].checkPhone(@"13356436785").boolWithResult());
//    NSLog(@"%@",[TBPredicate share].checkPhone(@"1335643685").stringWithResult());
    
//    [TBRuquestManager test1WithParameters:@{@"test1":@"TEST1_hahha"} success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
    
//    [TBRuquestManager queryOrderWithUserID:@"14949025190" success:^(NSURLSessionDataTask *task, id responseObject) {
//    
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
    
    [TBRequestOnAdmin allPointsWithUUID:@"80BFEC61-59A7-4991-9212-148A3DDFE705"
                                success:^(NSURLSessionDataTask *task, id responseObject) {
        
                                }
                                failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    [TBRequestOnAdmin userCountAtSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
    }   failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
