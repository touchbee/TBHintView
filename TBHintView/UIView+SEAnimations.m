//
//  UIView+SEAnimations.m
//  TBHintView
//
//  Created by Stefan Immich on 9/7/11.
//  Copyright 2011 touchbee Solutions. All rights reserved.
//

#import "UIView+SEAnimations.h"
#import "SEAnimationFactory.h"
#import <QuartzCore/QuartzCore.h>


@implementation UIView (SEAnimations)

-(void) animationFadeInWithDuration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] fadeIn:self duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationFadeIn];
}


-(void) animationFadeInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] fadeIn:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationFadeIn];
}


-(void) animationFadeOutWithDuration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] fadeOut:self duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationFadeOut];
}


-(void) animationFadeOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] fadeOut:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationFadeOut];
}


-(void) animationDropInWithDuration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] dropIn:self duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationDropIn];
}


-(void) animationDropInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] dropIn:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationDropIn];
}


-(void) animationDropOutWithDuration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] dropOut:self duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationDropOut];
}


-(void) animationDropOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] dropOut:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationDropOut];
}


-(void) animationSwirlInWithDuration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] swirlIn:self duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationSwirlIn];
}


-(void) animationSwirlInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] swirlIn:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationSwirlIn];
}


-(void) animationSwirlOutWithDuration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] swirlOut:self duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationSwirlOut];
}


-(void) animationSwirlOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] swirlOut:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationSwirlOut];
}


-(void) animationSlideInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] slideIn:self direction:direction boundaryView:boundaryView duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationSlideIn];
}


-(void) animationSlideInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] slideIn:self direction:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationSlideIn];
}


-(void) animationSlideOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] slideOut:self direction:direction boundaryView:boundaryView duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationSlideOut];
}


-(void) animationSlideOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] slideOut:self direction:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationSlideOut];
}


-(void) animationBounceInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] bounceIn:self direction:direction boundaryView:boundaryView duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationBounceIn];
}


-(void) animationBounceInWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] bounceIn:self direction:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationBounceIn];
}


-(void) animationBounceOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] bounceOut:self direction:direction boundaryView:boundaryView duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationBounceOut];
}


-(void) animationBounceOutWithDirection:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] bounceOut:self direction:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
	[self.layer addAnimation:animation forKey:kSEAnimationBounceOut];
}


-(void) animationStartPulseWithMinScale:(float)minScale maxScale:(float)maxScale
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] pulse:self minScale:minScale maxScale:maxScale];
	[self.layer addAnimation:animation forKey:kSEAnimationPulse];
}


-(void) animationStopPulse
{
	[self.layer removeAnimationForKey:kSEAnimationPulse];
}


-(void) animationStartBounceWithHeight:(float)height
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] bounce:self height:height];
	[self.layer addAnimation:animation forKey:kSEAnimationBounce];
}


-(void) animationStopBounce
{
	[self.layer removeAnimationForKey:kSEAnimationBounce];
}


-(void) animationStartRotateWithTimePerSpin:(NSTimeInterval)timePerSpin spinDirection:(SEAnimationSpinDirection)spinDirection
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] rotate:self spinDirection:spinDirection timePerSpin:timePerSpin];
	[self.layer addAnimation:animation forKey:kSEAnimationRotate];
}


-(void) animationStopRotate
{
	[self.layer removeAnimationForKey:kSEAnimationRotate];
}


-(void) animationStartWiggle
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] wiggle:self maxDegrees:2.0f maxTranslation:2.0f];
	[self.layer addAnimation:animation forKey:kSEAnimationWiggle];
}


-(void) animationStopWiggle
{
	[self.layer removeAnimationForKey:kSEAnimationWiggle];
}


-(void) moveTo:(CGPoint)to duration:(NSTimeInterval)duration 
{
	CAAnimation* animation = [[SEAnimationFactory sharedInstance] move:self to:to duration:duration];
	[self.layer addAnimation:animation forKey:kSEAnimationMoveTo];
}

@end
