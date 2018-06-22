//
//  HybridWKWebviewViewController.m
//  Objc_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

#import "HybridWKWebviewViewController.h"
#import <AceTM/AceTM-Swift.h>
@import WebKit;

@interface HybridWKWebviewViewController () <WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@end

@implementation HybridWKWebviewViewController
@synthesize classNameLabel, wkWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s called", __FUNCTION__);
    [classNameLabel setText:NSStringFromClass(self.class)];
    [AceTM viewDidLoadWithResponder:self autoPv:NO];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *jsctrl = [[WKUserContentController alloc] init];
    
    [config setUserContentController:jsctrl];
    
    CGFloat topStatusBarHeight = 100.0;
    CGFloat bottomNativeButtonHeight = 80.0;
    CGRect mainFrame = [[UIScreen mainScreen] bounds];
    CGRect webViewFrame = CGRectMake(mainFrame.origin.x,
                                     mainFrame.origin.y + topStatusBarHeight,
                                     mainFrame.size.width, mainFrame.size.height - topStatusBarHeight - bottomNativeButtonHeight);
    NSURL *url = [NSURL URLWithString:@"http://www.amazingsoft.com/webview/index.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    wkWebView = [[WKWebView alloc] initWithFrame:webViewFrame configuration:config];
    [wkWebView setUIDelegate:self];
    [wkWebView setNavigationDelegate:self];
    [wkWebView loadRequest:request];
    [AceTM loadView:self wkUserContentController:jsctrl];
    [self.view addSubview:wkWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s called", __FUNCTION__);
    [AceTM wkWebViewDidStartLoadWithWebView:webView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s called", __FUNCTION__);
    [AceTM wkWebViewDidFinishLoadWithWebView:webView];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%s called", __FUNCTION__);
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"%s called", __FUNCTION__);
    [AceTM userContentController:userContentController didReceive:message];
}

@end
