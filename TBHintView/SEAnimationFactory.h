//
//  SEAnimationManager.h
//  TBHintView
//
//  Created by Stefan Immich on 9/7/11.
//  Copyright 2011 touchbee Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/**
	
 */
typedef enum _SEAnimationDirection 
{
	kSEAnimationTop = 0,
	kSEAnimationRight,
	kSEAnimationBottom,
	kSEAnimationLeft,
	kSEAnimationTopLeft,
	kSEAnimationTopRight,
	kSEAnimationBottomLeft,
	kSEAnimationBottomRight
}
SEAnimationDirection;

/**
 
 */
typedef enum _SEAnimationSpinDirection
{
	kSEAnimationSpinClockwise,
	kSEAnimationSpinCounterClockwise
}
SEAnimationSpinDirection;

/**
	
 */
extern NSString* const kSEAnimationKeyView;
extern NSString* const kSEAnimationKeyName;
extern NSString* const kSEAnimationKeyType;
extern NSString* const kSEAnimationKeyDelegate;
extern NSString* const kSEAnimationKeyStartSelector;
extern NSString* const kSEAnimationKeyStopSelector;

extern NSString* const kSEAnimationTypeIn;
extern NSString* const kSEAnimationTypeOut;
extern NSString* const kSEAnimationTypeActive;

extern NSString* const kSEAnimationScale;
extern NSString* const kSEAnimationRotate;
extern NSString* const kSEAnimationPulse;
extern NSString* const kSEAnimationBounce;
extern NSString* const kSEAnimationWiggle;

extern NSString* const kSEAnimationMoveTo;

extern NSString* const kSEAnimationFadeIn;
extern NSString* const kSEAnimationFadeOut;
extern NSString* const kSEAnimationDropIn;
extern NSString* const kSEAnimationDropOut;
extern NSString* const kSEAnimationSwirlIn;
extern NSString* const kSEAnimationSwirlOut;
extern NSString* const kSEAnimationSlideIn;
extern NSString* const kSEAnimationSlideOut;
extern NSString* const kSEAnimationBounceIn;
extern NSString* const kSEAnimationBounceOut;


/**
	
 */
@interface SEAnimationFactory : NSObject {

}

+(SEAnimationFactory*) sharedInstance;

-(CAAnimation*) fadeIn:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*) fadeIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) fadeOut:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*) fadeOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) slideIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration;
-(CAAnimation*) slideIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) slideOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration;
-(CAAnimation*) slideOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) bounceIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration;
-(CAAnimation*) bounceIn:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) bounceOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration;
-(CAAnimation*) bounceOut:(UIView*)view direction:(SEAnimationDirection)direction boundaryView:(UIView*)boundaryView  duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) dropIn:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*) dropIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) dropOut:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*) dropOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) swirlIn:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*) swirlIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) swirlOut:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*) swirlOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*) move:(UIView*)view to:(CGPoint)to duration:(NSTimeInterval)duration;
-(CAAnimation*) moveFrom:(CGPoint)from to:(CGPoint)to duration:(NSTimeInterval)duration;
-(CAAnimation*) moveAlongPath:(CGPathRef)path duration:(NSTimeInterval)duration;


-(CAAnimation*) scale:(UIView*)view from:(float)from to:(float)to duration:(NSTimeInterval)duration;
-(CAAnimation*) rotate:(UIView*)view duration:(NSTimeInterval)duration;

-(CAAnimation*) pulse:(UIView*)view minScale:(float)minScale maxScale:(float)maxScale;
-(CAAnimation*) bounce:(UIView*)view height:(float)height;
-(CAAnimation*) rotate:(UIView*)view spinDirection:(SEAnimationSpinDirection)spinDirection timePerSpin:(NSTimeInterval)timePerSpin;
-(CAAnimation*) wiggle:(UIView*)view maxDegrees:(float)degrees maxTranslation:(float)translation;

@end
