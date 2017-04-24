//
//  ViewController.m
//  XTNetReloader
//
//  Created by TuTu on 15/12/9.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "ViewController.h"
#import "XTNetReloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonClicked:(id)sender
{
    [XTNetReloader showInView:self.view
                  doReRefresh:^{
                       NSLog(@"开始刷新 。。。") ;
                      // 请求 ...
                      
                      // 请求完成后
                      [XTNetReloader dismiss] ;
                   }] ;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
