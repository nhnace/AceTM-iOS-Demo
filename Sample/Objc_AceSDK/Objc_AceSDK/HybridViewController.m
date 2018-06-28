//
//  HybridViewController.m
//  Objc_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

#import "HybridViewController.h"
#import <AceTM/AceTM-Swift.h>

@interface HybridViewController () <UIWebViewDelegate>

@end

@implementation HybridViewController
@synthesize classNameLabel, mWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [classNameLabel setText:NSStringFromClass(self.class)];
    [AceTM viewDidLoadWithResponder:self autoPv:NO];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.acecounter.com/www2/main.amz"]];
    [mWebView loadRequest:request];
    [mWebView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [AceTM uiWebViewWithWebView:webView shouldStartLoadWith:request navigationType:navigationType];
    return true;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [AceTM webViewDidStartLoadWithWebView:webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [AceTM webViewDidFinishLoadWithWebView:webView];
}
@end
