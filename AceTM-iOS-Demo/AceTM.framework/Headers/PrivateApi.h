//
//  PrivateApi.h
//  Pods
//
//  Created by MoonJongRak on 2016. 12. 5..
//
//

#import <Foundation/Foundation.h>

@interface PrivateApi : NSObject

+ (NSArray *) getInstalledApplication;

+ (NSArray *) getRunningProcesses;

+ (NSDictionary *) getIPAddresses;

+ (NSString *) sha1:(NSString *)input;
@end

