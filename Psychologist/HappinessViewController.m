//
//  HappinessViewController.m
//  Happiness
//
//  Created by Tom Owen on 4/28/12.
//  Copyright (c) 2012 Owen & Owen. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"
@interface HappinessViewController () <FaceViewDataSource>

@property (nonatomic, weak) IBOutlet FaceView *faceView;

@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (void) setHappiness:(int)happiness {
    _happiness = happiness;
    [self.faceView setNeedsDisplay]; // whenever happiness is set the setNeedsDisplay will be called
}
- (void) setFaceView:(FaceView *)faceView{
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    // since happiness controller is handling this pan up/down the target is self not faceView
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];
    // setting happinessViewController as the deleagte for datasource 
    self.faceView.dataSource = self;
}
- (void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture 
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y / 2;
        [gesture setTranslation:translation inView:self.faceView];
        
    }
}
- (float) smileForFaceView:(FaceView *)sender {
    // in faceView smile is between -1 and 1
    return (self.happiness - 50) / 50.0;
}
                                        
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES; // allow for rotating
}

@end
