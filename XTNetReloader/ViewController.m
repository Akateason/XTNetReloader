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
    __block XTNetReloader *netReloader = [[XTNetReloader alloc] initWithFrame:self.view.frame
                                                                  reloadBlock:^{
                                                                      NSLog(@"click") ;
                                                                      [netReloader dismiss] ;
                                                                  }] ;
    netReloader.labelName = @"jingdi";
    netReloader.image = [UIImage imageNamed:@"01"];
    [netReloader showInView:self.view] ;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
