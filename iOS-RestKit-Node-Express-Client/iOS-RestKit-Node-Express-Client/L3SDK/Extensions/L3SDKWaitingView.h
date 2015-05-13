//
//  L3SDKWaitingView.h
//  WaitingView
//
//  Created by Domenico Vacchiano on 12/04/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import  <QuartzCore/QuartzCore.h>

//An UIView extension class to implement a waiting view

@interface  UIView (L3SDKWaitingView)
-(void)showWaitingWithTitle:(NSString*)title;
-(void)hideWaiting;
-(void)updateWaitingValue:(NSString*)value;
-(void)setWaitingViewFrame:(CGRect)frame;
-(CGRect)waitingViewFrame;
@end
