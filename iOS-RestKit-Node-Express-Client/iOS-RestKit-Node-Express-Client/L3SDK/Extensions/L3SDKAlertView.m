//
//  L3SDKAlertView.m
//  QRPark
//
//  Created by Domenico Vacchiano on 27/03/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import "L3SDKAlertView.h"
#import "L3SDKUtilityApp.h"
@implementation UIAlertView(L3SDKAlertView)

+(void)warning:(NSString*)message{
    [self warning:message andTitle:nil];
}
+(void)warning:(NSString*)message andTitle:(NSString*)title{
    
    NSString*_title=title!=nil ? title : [L3SDKUtilityApp name];
    
    UIAlertView*alert=[[UIAlertView alloc] initWithTitle:_title
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
@end
