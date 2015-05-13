//
//  App.m
//  QRPark
//
//  Created by Domenico Vacchiano on 27/03/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import "L3SDKUtilityApp.h"

@implementation L3SDKUtilityApp

+(NSString*)name{
    
    @try {
        return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    @catch (NSException *exception) {
        @throw exception;
    }

}
+(NSString*)identifier{
    @try {
        return [[NSBundle mainBundle] bundleIdentifier];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}
@end
