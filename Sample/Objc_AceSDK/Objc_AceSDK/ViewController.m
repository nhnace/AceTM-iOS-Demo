//
//  ViewController.m
//  Objc_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

#import "ViewController.h"
#import <AceTM/AceTM-Swift.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize pv;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [AceTM viewDidLoadWithResponder:self autoPv:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pvClicked:(UIButton *)sender {
    [AceTM pvWithResponder:self];
}

- (IBAction)returnFromSegueActions:(UIStoryboardSegue *)segue {
    
}

@end
