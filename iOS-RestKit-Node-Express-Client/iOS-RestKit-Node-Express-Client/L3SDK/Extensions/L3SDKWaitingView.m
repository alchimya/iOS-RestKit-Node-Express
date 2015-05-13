//
//  L3SDKWaitingView.m
//  WaitingView
//
//  Created by Domenico Vacchiano on 12/04/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKWaitingView.h"

@implementation UIView (L3SDKWaitingView)
#define WAITING_VIEW_HEIGHT 150
#define WAITING_VIEW_WIDTH 150
#define ACTIVITY_INDICATOR_VIEW_SIDE 20
#define LABEL_HEIGHT 22
CGRect waitingViewFrame;
UIView*waitingView;
UILabel*progressLabel;

-(void)showWaitingWithTitle:(NSString*)title{
    
    //remove existing view
    if (waitingView) {
        [self hideWaiting];
    }
    
    
    //creates waiting view with frame
    if (CGRectIsEmpty(waitingViewFrame)) {
        waitingView=[[UIView alloc] initWithFrame:CGRectMake(0,
                                                             0,
                                                             WAITING_VIEW_WIDTH,
                                                             WAITING_VIEW_HEIGHT)];
        waitingView.center=self.center;
        
    }else{
        waitingView=[[UIView alloc] initWithFrame:CGRectMake(waitingViewFrame.origin.x,
                                                             waitingViewFrame.origin.y,
                                                             waitingViewFrame.size.width,
                                                             waitingViewFrame.size.height)];
    }
    
    //set waiting view layout
    waitingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    waitingView.clipsToBounds = YES;
    waitingView.layer.cornerRadius = 10.0;
    
    //creates an activity indicator and add it on waiting view
    UIActivityIndicatorView*_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _activityIndicatorView.frame = CGRectMake(
                                              (WAITING_VIEW_WIDTH/2-ACTIVITY_INDICATOR_VIEW_SIDE/2),
                                              (WAITING_VIEW_HEIGHT/2-ACTIVITY_INDICATOR_VIEW_SIDE/2),
                                              ACTIVITY_INDICATOR_VIEW_SIDE,
                                              ACTIVITY_INDICATOR_VIEW_SIDE);
    [waitingView addSubview:_activityIndicatorView];
    [_activityIndicatorView startAnimating];
    
    
    
    //creates a UILable for title
    UILabel*titleLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(0,
                                     _activityIndicatorView.frame.origin.y+_activityIndicatorView.frame.size.height+10,
                                     waitingView.frame.size.width,
                                     LABEL_HEIGHT)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    [waitingView addSubview:titleLabel];
    
    //creates a UILable for progress value
    progressLabel = [[UILabel alloc] initWithFrame:
                     CGRectMake(0,
                                WAITING_VIEW_HEIGHT-LABEL_HEIGHT,
                                waitingView.frame.size.width,
                                LABEL_HEIGHT)];
    progressLabel.backgroundColor = [UIColor clearColor];
    progressLabel.textColor = [UIColor whiteColor];
    progressLabel.adjustsFontSizeToFitWidth = YES;
    progressLabel.textAlignment = NSTextAlignmentCenter;
    [waitingView addSubview:progressLabel];
    
    //add waiting view
    [self addSubview:waitingView];
    
}

-(void)updateWaitingValue:(NSString*)value{
    //update text of progress label indicator
    [NSThread detachNewThreadSelector: @selector(setText:) toTarget:progressLabel withObject:value];
}

-(void)hideWaiting{
    //remove waiting view
    [waitingView removeFromSuperview];
}

-(void)setWaitingViewFrame:(CGRect)frame{
    //waitingViewFrame setter
    //allows to create a waiting view with a custom frame
    waitingViewFrame=frame;
}

-(CGRect)waitingViewFrame{
    //waitingViewFrame getter
    return waitingViewFrame;
}

@end
