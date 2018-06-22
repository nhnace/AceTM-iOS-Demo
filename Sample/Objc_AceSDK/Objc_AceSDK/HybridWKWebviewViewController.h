//
//  HybridWKWebviewViewController.h
//  Objc_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface HybridWKWebviewViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *classNameLabel;
@property (nonatomic, retain) WKWebView *wkWebView;

@end
