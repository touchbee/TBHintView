//
//  UIView+SEAnimations.h
//  TBHintView
//
//  Created by Stefan Immich on 9/7/11.
//  Copyright 2011 touchbee Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEAnimationFactory.h"


@interface UIView (SEAnimations)

-(void) animationFadeInWithDuration:(NSTimeInterval)duration;
-(void) animationFadeInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationFadeOutWithDuration:(NSTimeInterval)duration;
-(void) animationFadeOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationDropInWithDuration:(NSTimeInterval)duration;
-(void) animationDropInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationDropOutWithDuration:(NSTimeInterval)duration;
-(void) animationDropOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationSwirlInWithDuration:(NSTimeInterval)duration;
-(void) animationSwirlInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationSwirlOutWithDuration:(NSTimeInterval)duration;
-(void) animationSwirlOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationSlideInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void) animationSlideInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationSlideOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void) animationSlideOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationBounceInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void) animationBounceInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationBounceOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void) animationBounceOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void) animationStartPulseWithMinScale:(float)minScale maxScale:(float)maxScale;
-(void) animationStopPulse;

-(void) animationStartBounceWithHeight:(float)height;
-(void) animationStopBounce;

-(void) animationStartRotateWithTimePerSpin:(NSTimeInterval)timePerSpin spinDirection:(SEAnimationSpinDirection)spinDirection;
-(void) animationStopRotate;

-(void) animationStartWiggle;
-(void) animationStopWiggle;

-(void) moveTo:(CGPoint)to duration:(NSTimeInterval)duration;

@end
