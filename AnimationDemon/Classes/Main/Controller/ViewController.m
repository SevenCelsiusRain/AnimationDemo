//
//  ViewController.m
//  AnimationDemon
//
//  Created by wanc on 2017/3/17.
//  Copyright © 2017年 zdsoft. All rights reserved.
//

#import "ViewController.h"
#import "BasicController.h"
#import "SpringController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)operationAction:(UIButton *)sender {
    
    UIViewController *nextVC;
    
    switch (sender.tag) {
        case 0:
            
            nextVC = [[BasicController alloc] init];
            
            break;
            
        case 1:
            
            nextVC = [[SpringController alloc] init];
            
            break;

        case 2:
            
            break;

        case 3:
            
            break;

        default:
            break;
    }
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
