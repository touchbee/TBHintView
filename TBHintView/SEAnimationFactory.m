//
//  SEAnimationManager.m
//  TBHintView
//
//  Created by Stefan Immich on 9/7/11.
//  Copyright 2011 touchbee Solutions. All rights reserved.
//

#import "SEAnimationFactory.h"
#import <QuartzCore/QuartzCore.h>

@interface SEAnimationFactory()

-(CAAnimation*) groupWithAnimations:(NSArray*)animations duration:(NSTimeInterval)duration view:(UIView*)view name:(NSString*)name type:(NSString*)type;
-(CGPoint) outOfBoundsCenterForView:(UIView*)view direction:(SEAnimationDirection)direction boundaryFrame:(CGRect)boundaryFrame;
-(CGPoint) bounceCenterForView:(UIView*)view direction:(SEAnimationDirection)direction;

@end

#define DEGREES_TO_RADIANS(degrees) (degrees * M_PI / 180.0f)


NSString* const kSEAnimationKeyView = @"kSEAnimationKeyView";
NSString* const kSEAnimationKeyName = @"kSEAnimationKeyName";
NSString* const kSEAnimationKeyType = @"kSEAnimationKeyType";
NSString* const kSEAnimationKeyDelegate = @"kSEAnimationKeyDelegate";
NSString* const kSEAnimationKeyStartSelector = @"kSEAnimationKeyStartSelector";
NSString* const kSEAnimationKeyStopSelector = @"kSEAnimationKeyStopSelector";

NSString* const kSEAnimationTypeIn = @"kSEAnimationTypeIn";
NSString* const kSEAnimationTypeOut = @"kSEAnimationTypeOut";
NSString* const kSEAnimationTypeActive = @"kSEAnimationTypeActive";

NSString* const kSEAnimationFadeIn = @"kSEAnimationFadeIn";
NSString* const kSEAnimationFadeOut = @"kSEAnimationFadeOut";
NSString* const kSEAnimationDropIn = @"kSEAnimationDropIn";
NSString* const kSEAnimationDropOut = @"kSEAnimationDropOut";
NSString* const kSEAnimationScale = @"kSEAnimationScale";
NSString* const kSEAnimationRotate = @"kSEAnimationRotate";
NSString* const kSEAnimationSwirlIn = @"kSEAnimationSwirlIn";
NSString* const kSEAnimationSwirlOut = @"kSEAnimationSwirlOut";
NSString* const kSEAnimationSlideIn = @"kSEAnimationSlideIn";
NSString* const kSEAnimationSlideOut = @"kSEAnimationSlideOut";
NSString* const kSEAnimationPulse = @"kSEAnimationPulse";
NSString* const kSEAnimationBounceIn = @"kSEAnimationBounceIn";
NSString* const kSEAnimationBounceOut = @"kSEAnimationBounceOut";
NSString* const kSEAnimationBounce = @"kSEAnimationBounce";
NSString* const kSEAnimationWiggle = @"kSEAnimationWiggle";
NSString* const kSEAnimationMoveTo = @"kSEAnimationMoveTo";


@implementation SEAnimationFactory

+(SEAnimationFactory*) sharedInstance
{
	static SEAnimationFactory* sharedInstance = nil;
	
	@synchronized( self ) 
	{
		if( !sharedInstance )
		{
            sharedInstance = [[SEAnimationFactory alloc] init];       
		}
    }
	
    return sharedInstance;
}


-(CGPoint) bounceCenterForView:(UIView*)view direction:(SEAnimationDirection)direction
{
	float bounceOffset = 10.0f;
	
	if( direction == kSEAnimationLeft )
	{
		return CGPointMake( view.center.x + bounceOffset, view.center.y );
	}
	else if( direction == kSEAnimationRight )
	{
		return CGPointMake( view.center.x - bounceOffset, view.center.y );
	}
	else if( direction == kSEAnimationTop )
	{
		return CGPointMake( view.center.x, view.center.y + bounceOffset );
	}
	else if( direction == kSEAnimationBottom )
	{
		return CGPointMake( view.center.x, view.center.y - bounceOffset );
	}
	else if( direction == kSEAnimationTopLeft )
	{
		return CGPointMake( view.center.x + bounceOffset, view.center.y + bounceOffset );
	}
	else if( direction == kSEAnimationTopRight )
	{
		return CGPointMake( view.center.x - bounceOffset, view.center.y + bounceOffset );
	}
	else if( direction == kSEAnimationBottomLeft )
	{
		return CGPointMake( view.center.x + bounceOffset, view.center.y - bounceOffset );
	}
	else if( direction == kSEAnimationBottomRight )
	{
		return CGPointMake( view.center.x - bounceOffset, view.center.y - bounceOffset );
	}

	return CGPointZero;
}


-(CGPoint) outOfBoundsCenterForView:(UIView*)view direction:(SEAnimationDirection)direction boundaryFrame:(CGRect)boundaryFrame
{
	if( direction == kSEAnimationLeft )
	{
		return CGPointMake( boundaryFrame.origin.x - ( view.bounds.size.width / 2.0f ), view.center.y );
	}
	else if( direction == kSEAnimationRight )
	{
		return CGPointMake( boundaryFrame.origin.x + boundaryFrame.size.width + ( view.bounds.size.width / 2.0f ), view.center.y );
	}
	else if( direction == kSEAnimationTop )
	{
		return CGPointMake( view.center.x, boundaryFrame.origin.y - ( view.bounds.size.height / 2.0f ));
	}
	else if( direction == kSEAnimationBottom )
	{
		return CGPointMake( view.center.x, boundaryFrame.origin.y + boundaryFrame.size.height + ( view.bounds.size.height / 2.0f ));
	}
	else if( direction == kSEAnimationTopLeft )
	{
		return CGPointMake( boundaryFrame.origin.x - ( view.bounds.size.width / 2.0f ), boundaryFrame.origin.y - ( view.bounds.size.height / 2.0f ));
	}
	else if( direction == kSEAnimationTopRight )
	{
		return CGPointMake( boundaryFrame.origin.x + boundaryFrame.size.width + ( view.bounds.size.width / 2.0f ), boundaryFrame.origin.y - ( view.bounds.size.height / 2.0f ));
	}
	else if( direction == kSEAnimationBottomLeft )
	{
		return CGPointMake( boundaryFrame.origin.x - ( view.bounds.size.width / 2.0f ), boundaryFrame.origin.y + boundaryFrame.size.height + ( view.bounds.size.height / 2.0f ));
	}
	else if( direction == kSEAnimationBottomRight )
	{
		return CGPointMake( boundaryFrame.origin.x + boundaryFrame.size.width + ( view.bounds.size.width / 2.0f ), boundaryFrame.origin.y + boundaryFrame.size.height + ( view.bounds.size.height / 2.0f ));
	}
	
	return CGPointZero;
}


-(CAAnimation*) groupWithAnimations:(NSArray*)animations duration:(NSTimeInterval)duration view:(UIView*)view name:(NSString*)name type:(NSString*)type
{
	CAAnimationGroup* group = [CAAnimationGroup animation];
	
	group.animations = [NSArray arrayWithArray:animations];
	
	group.duration = duration;
	group.removedOnCompletion = NO;
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	group.fillMode = kCAFillModeBoth;
	group.delegate = self;
	
	[group setValue:view forKey:kSEAnimationKeyView];
	[group setValue:name forKey:kSEAnimationKeyName];
	[group setValue:type forKey:kSEAnimationKeyType];
	
	return group;
}


-(CAAnimation*) fadeIn:(UIView*)view duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	
	[animation setValue:kSEAnimationFadeIn forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeIn forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSNumber numberWithFloat:0.0f];
	animation.toValue = [NSNumber numberWithFloat:1.0f];
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) fadeIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self fadeIn:view duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;
}


-(CAAnimation*) fadeOut:(UIView*)view duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	
	[animation setValue:kSEAnimationFadeOut forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeOut forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSNumber numberWithFloat:1.0f];
	animation.toValue = [NSNumber numberWithFloat:0.0f];
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeForwards;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) fadeOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self fadeOut:view duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;
}


-(CAAnimation*) slideIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
	
	[animation setValue:kSEAnimationSlideIn forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeIn forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSValue valueWithCGPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
	animation.toValue = [NSValue valueWithCGPoint:view.center];
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) slideIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self slideIn:view direction:direction boundaryView:boundaryView duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];

	return animation;
}


-(CAAnimation*) slideOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
	
	[animation setValue:kSEAnimationSlideOut forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeOut forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSValue valueWithCGPoint:view.center];
	animation.toValue = [NSValue valueWithCGPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	return animation;	
}


-(CAAnimation*) slideOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self slideOut:view direction:direction boundaryView:boundaryView duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;
}


-(CAAnimation*) bounceIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration
{
	CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	
	[animation setValue:kSEAnimationBounceIn forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeIn forKey:kSEAnimationKeyType];
	
	UIBezierPath* path = [UIBezierPath bezierPath];
	[path moveToPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
	[path addLineToPoint:[self bounceCenterForView:view direction:direction]];
	[path moveToPoint:view.center];
	
	animation.path = path.CGPath;
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) bounceIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self bounceIn:view direction:direction boundaryView:boundaryView duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;
}


-(CAAnimation*) bounceOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration
{
	CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	
	[animation setValue:kSEAnimationBounceOut forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeOut forKey:kSEAnimationKeyType];
	
	UIBezierPath* path = [UIBezierPath bezierPath];
	[path moveToPoint:view.center];
	[path addLineToPoint:[self bounceCenterForView:view direction:direction]];
	[path addLineToPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
	
	animation.path = path.CGPath;
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) bounceOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self bounceOut:view direction:direction boundaryView:boundaryView duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;
}


-(CAAnimation*) dropIn:(UIView*)view duration:(NSTimeInterval)duration
{
	CAAnimation* fadeAnim = [self fadeIn:view duration:duration];
	CAAnimation* scaleAnim = [self scale:view from:2.0f to:1.0f duration:duration];
	
	return [self groupWithAnimations:[NSArray arrayWithObjects:fadeAnim, scaleAnim, nil] duration:duration view:view name:kSEAnimationDropIn type:kSEAnimationTypeIn];	
}


-(CAAnimation*) dropIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self dropIn:view duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;	
}


-(CAAnimation*) dropOut:(UIView*)view duration:(NSTimeInterval)duration
{
	CAAnimation* fadeAnim = [self fadeOut:view duration:duration];
	CAAnimation* scaleAnim = [self scale:view from:1.0f to:0.01f duration:duration];
	
	return [self groupWithAnimations:[NSArray arrayWithObjects:fadeAnim, scaleAnim, nil] duration:duration view:view name:kSEAnimationDropOut type:kSEAnimationTypeOut];
}


-(CAAnimation*) dropOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self dropOut:view duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;
}


-(CAAnimation*) swirlIn:(UIView*)view duration:(NSTimeInterval)duration
{
	CAAnimation* rotateAnim = [self rotate:view duration:duration];
	CAAnimation* scaleAnim = [self scale:view from:0.01f to:1.0f duration:duration];
	
	return [self groupWithAnimations:[NSArray arrayWithObjects:rotateAnim, scaleAnim, nil] duration:duration view:view name:kSEAnimationSwirlIn type:kSEAnimationTypeIn];
}


-(CAAnimation*) swirlIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self swirlIn:view duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;	
}


-(CAAnimation*) swirlOut:(UIView*)view duration:(NSTimeInterval)duration
{
	CAAnimation* rotateAnim = [self rotate:view duration:duration];
	CAAnimation* scaleAnim = [self scale:view from:1.0f to:0.01f duration:duration];
	
	return [self groupWithAnimations:[NSArray arrayWithObjects:rotateAnim, scaleAnim, nil] duration:duration view:view name:kSEAnimationSwirlOut type:kSEAnimationTypeOut];
}


-(CAAnimation*) swirlOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
	CAAnimation* animation = [self swirlOut:view duration:duration];
	
	[animation setValue:delegate forKey:kSEAnimationKeyDelegate];
	[animation setValue:NSStringFromSelector(startSelector) forKey:kSEAnimationKeyStartSelector];
	[animation setValue:NSStringFromSelector(stopSelector) forKey:kSEAnimationKeyStopSelector];
	
	return animation;	
}


-(CAAnimation*) rotate:(UIView*)view spinDirection:(SEAnimationSpinDirection)spinDirection timePerSpin:(NSTimeInterval)timePerSpin
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	[animation setValue:kSEAnimationRotate forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSNumber numberWithFloat:0.0f];
	
	if( spinDirection == kSEAnimationSpinClockwise )
	{
		animation.toValue = [NSNumber numberWithFloat:2.0f * M_PI];
	}
	else 
	{
		animation.toValue = [NSNumber numberWithFloat:-2.0f * M_PI];
	}

	animation.duration = timePerSpin;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.repeatCount = HUGE_VALF;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) bounce:(UIView*)view height:(float)height
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
	
	[animation setValue:kSEAnimationBounce forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSValue valueWithCGPoint:CGPointMake( view.center.x, view.center.y )];
	animation.toValue = [NSValue valueWithCGPoint:CGPointMake( view.center.x, view.center.y - height )]; 
	animation.duration = 0.6f;
	animation.removedOnCompletion = NO;
	animation.autoreverses = YES;
	animation.repeatCount = HUGE_VALF;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) pulse:(UIView*)view minScale:(float)minScale maxScale:(float)maxScale
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	
	[animation setValue:kSEAnimationPulse forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSNumber numberWithFloat:minScale];
	animation.toValue = [NSNumber numberWithFloat:maxScale];
	animation.duration = 0.4f;
	animation.removedOnCompletion = NO;
	animation.autoreverses = YES;
	animation.repeatCount = HUGE_VALF;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) scale:(UIView*)view from:(float)from to:(float)to duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	
	[animation setValue:kSEAnimationScale forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSNumber numberWithFloat:from];
	animation.toValue = [NSNumber numberWithFloat:to];
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) rotate:(UIView*)view duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	[animation setValue:kSEAnimationRotate forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	animation.fromValue = [NSNumber numberWithFloat:0.0f];
	animation.toValue = [NSNumber numberWithFloat:2.0f * M_PI];
	animation.duration = duration;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBoth;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
	animation.delegate = self;
	
	return animation;
}


-(CAAnimation*) wiggle:(UIView*)view maxDegrees:(float)degrees maxTranslation:(float)translation
{
	// TODO: Apple seems to randomizes some components to make each wiggle animation look a little different
	
	float animDuration = 0.16f;
	
	CABasicAnimation* rotateLeftRight = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	[rotateLeftRight setValue:@"rotateLeftRight" forKey:kSEAnimationKeyName];
	[rotateLeftRight setValue:view forKey:kSEAnimationKeyView];
	[rotateLeftRight setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	rotateLeftRight.fromValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(-degrees)];
	rotateLeftRight.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(degrees)];
	rotateLeftRight.duration = animDuration;
	rotateLeftRight.removedOnCompletion = NO;
	rotateLeftRight.autoreverses = YES;
	rotateLeftRight.repeatCount = HUGE_VALF;
	rotateLeftRight.fillMode = kCAFillModeBoth;
	rotateLeftRight.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	rotateLeftRight.delegate = self;
	
		
	
	CABasicAnimation* upDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	
	[upDown setValue:@"upDown" forKey:kSEAnimationKeyName];
	[upDown setValue:view forKey:kSEAnimationKeyView];
	[upDown setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	upDown.fromValue = [NSNumber numberWithFloat:-translation];
	upDown.toValue = [NSNumber numberWithFloat:translation];
	upDown.duration = animDuration / 2.0f;
	upDown.removedOnCompletion = NO;
	upDown.autoreverses = YES;
	upDown.repeatCount = HUGE_VALF;
	upDown.fillMode = kCAFillModeBoth;
	upDown.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
	upDown.delegate = self;
	
	CAAnimation* anim = [self groupWithAnimations:[NSArray arrayWithObjects:rotateLeftRight, upDown, nil] duration:animDuration view:view name:kSEAnimationWiggle type:kSEAnimationTypeActive];
	
	anim.autoreverses = YES;
	anim.repeatCount = HUGE_VALF;
	
	return anim;
}


-(CAAnimation*) move:(UIView*)view to:(CGPoint)to duration:(NSTimeInterval)duration
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
	
	[animation setValue:kSEAnimationMoveTo forKey:kSEAnimationKeyName];
	[animation setValue:view forKey:kSEAnimationKeyView];
	[animation setValue:kSEAnimationTypeActive forKey:kSEAnimationKeyType];
	
	animation.toValue = [NSValue valueWithCGPoint:to];

	//anim.rotationMode = kCAAnimationRotateAuto;
	//animation.calculationMode = kCAAnimationPaced;
	//anim.repeatCount = HUGE_VALF;
	//anim.autoreverses = YES;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeForwards;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	
	animation.duration = duration;
	
	return animation;
}


-(CAAnimation*) moveFrom:(CGPoint)from to:(CGPoint)to duration:(NSTimeInterval)duration
{
    // TODO
	return nil;
}

-(CAAnimation*) moveAlongPath:(CGPathRef)path duration:(NSTimeInterval)duration
{
	/*
	CAKeyframeAnimation* anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	
	anim.path = trackPath.CGPath;
	//anim.rotationMode = kCAAnimationRotateAuto;
	anim.calculationMode = kCAAnimationPaced;
	anim.repeatCount = HUGE_VALF;
	anim.autoreverses = YES;
	anim.removedOnCompletion = NO;
	anim.fillMode = kCAFillModeForwards;
	anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	anim.duration = 4;
	 */
    
    // TODO
    return nil;
}


-(void) animationDidStart:(CAAnimation *)anim
{
	UIView* view = [anim valueForKey:kSEAnimationKeyView];
	NSString* animationType = [anim valueForKey:kSEAnimationKeyType];
	
	if( [animationType isEqualToString:kSEAnimationTypeIn] )
	{
		view.hidden = NO;
	}
	
	id animationDelegate = [anim valueForKey:kSEAnimationKeyDelegate];
	NSString* animationStartSelector = [anim valueForKey:kSEAnimationKeyStartSelector];
	
	if( animationDelegate )
	{
		SEL startSelector = NSSelectorFromString( animationStartSelector );
		
		if( [animationDelegate respondsToSelector:startSelector] )
		{
			[animationDelegate performSelector:startSelector withObject:anim withObject:view];
		}
	}
}


-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	UIView* view = [anim valueForKey:kSEAnimationKeyView];
	NSString* animationName = [anim valueForKey:kSEAnimationKeyName];
	NSString* animationType = [anim valueForKey:kSEAnimationKeyType];
	
	if( [animationType isEqualToString:kSEAnimationTypeOut] )
	{
		view.hidden = YES;
	}

	[view.layer removeAnimationForKey:animationName];
	
	id animationDelegate = [anim valueForKey:kSEAnimationKeyDelegate];
	NSString* animationStopSelector = [anim valueForKey:kSEAnimationKeyStopSelector];

	if( animationDelegate )
	{
		SEL stopSelector = NSSelectorFromString( animationStopSelector );
		
		if( [animationDelegate respondsToSelector:stopSelector] )
		{
			[animationDelegate performSelector:stopSelector withObject:anim withObject:view];
		}
	}
}

@end
