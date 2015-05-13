//
//  L3SDKAlertView.h
//  QRPark
//
//  Created by Domenico Vacchiano on 27/03/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//An UIAlertView extension class with some facilities
@interface  UIAlertView (L3SDKAlertView)

+(void)warning:(NSString*)message;
+(void)warning:(NSString*)message andTitle:(NSString*)title;
@end