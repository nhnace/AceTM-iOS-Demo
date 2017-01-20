//
//  Test.m
//  AceTM-iOS-Demo
//
//  Created by JongRak Moon on 2017. 1. 12..
//  Copyright © 2017년 MoonJongRak. All rights reserved.
//

#import "Test.h"
#import <AceTM/AceTM-Swift.h>
@implementation Test

+(void) test{
    AceProduct* product1 = [[AceProduct alloc] initWithName:@"제품명" code:@"제품코드" price:3000 quantity:2];
    AceProduct* product2 = [[AceProduct alloc] initWithName:@"옵션명" code:@"옵션코드" price:3000 quantity:2];
    [product2 addOptionWithOption:[[AceOption alloc] initWithCode:@"제품코드" name:@"제품명" quantity:3]];
    [AceTM payWithPayName:@"카카오페이" products:[NSArray arrayWithObjects:product1,product2, nil]];
    [AceTM buyListWithPaymentMethod:@"신용카드" orderNumber:@"A199999" totalPrice:20000 products:[NSArray arrayWithObjects:product1,product2, nil]];
}

@end
