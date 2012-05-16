//
//  HintView.h
//  TBHintView
//
//  Created by Stefan Immich on 4/5/12.
//  Copyright (c) 2012 touchbee Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    kHintViewOrientationTop,
    kHintViewOrientationBottom
    
} TBHintViewOrientation;


typedef enum
{
    kHintViewPresentationFade,
    kHintViewPresentationDrop,
    kHintViewPresentationSwirl,
    kHintViewPresentationSlide,
    kHintViewPresentationBounce
    
} TBHintViewPresentationAnimation;


@protocol TBHintViewDataSource;
@protocol TBHintViewDelegate;

@interface TBHintView : UIView<UIScrollViewDelegate>

@property (nonatomic,assign) id<TBHintViewDataSource> dataSource;
@property (nonatomic,assign) id<TBHintViewDelegate> delegate;

@property (nonatomic,copy) UIImage* backgroundImage;
@property (nonatomic,copy) UIColor* textColor;
@property (nonatomic,assign) CGFloat spanWidthWeight; // Width weight between 0.01f and 1.0f
@property (nonatomic,assign) TBHintViewPresentationAnimation presentationAnimation;
@property (nonatomic,assign) TBHintViewOrientation orientation;
@property (nonatomic,assign) CGFloat maximumHeight;
@property (nonatomic,assign) NSUInteger type;

-(void) show;
-(void) show:(NSTimeInterval)duration;

-(void) dismiss;

@end



@protocol TBHintViewDataSource<NSObject>

@required

-(NSInteger) numberOfPagesInHintView:(TBHintView*)hintView; 

@optional

// However, one of these 3 need to be implemented
-(UIView*) viewForPage:(NSUInteger)page hintView:(TBHintView*)hintView;
-(NSString*) textForPage:(NSUInteger)page hintView:(TBHintView*)hintView;
-(UIImage*) imageForPage:(NSUInteger)page hintView:(TBHintView*)hintView;

-(NSString*) titleForPage:(NSUInteger)page hintView:(TBHintView*)hintView;
-(UIImage*) titleIconForPage:(NSUInteger)page hintView:(TBHintView*)hintView;

@end



@protocol TBHintViewDelegate<NSObject>

@optional

-(void) dismissedHintView:(TBHintView*)hintView;
-(CGFloat) heightForHintView:(TBHintView*)hintView;

@end
