//
//  ViewController.m
//  TouchTracking
//
//  Created by Dennis White on 5/4/15.
//  Copyright (c) 2015 dniswhite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    bool isMoving;
    CGPoint lastTouchLocation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    isMoving = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentLocation = [touch locationInView:[self imageView]];

    isMoving = NO;
    
    lastTouchLocation = currentLocation;

    NSLog(@"user has started to touch screen %@.", NSStringFromCGPoint(lastTouchLocation));
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint currentLocation = [touch locationInView:[self imageView]];

    if (YES == isMoving) {
        NSLog(@"user finished moving from  %@ to %@.", NSStringFromCGPoint(lastTouchLocation), NSStringFromCGPoint(currentLocation));
    } else {
        NSLog(@"user just tapped the screen without moving at %@.", NSStringFromCGPoint(lastTouchLocation));
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    isMoving = YES;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentLocation = [touch locationInView:[self imageView]];

    NSLog(@"user is moving from %@ to %@", NSStringFromCGPoint(lastTouchLocation), NSStringFromCGPoint(currentLocation));
    
    lastTouchLocation = currentLocation;
}


@end
