//
//  ViewController.h
//  Objc_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *pv;

- (IBAction)pvClicked:(UIButton *)sender;
- (IBAction)returnFromSegueActions:(UIStoryboardSegue *)segue;

@end

