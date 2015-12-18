//
//  LTSegmentedControl.h
//  IMComponent
//
//  Created by carlhuting on 15/12/17.
//  Copyright © 2015年 lemon tree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UIColor;

@protocol LTSegmentedControlDelegate <NSObject>

@optional
- (void)selectedIndexChanged:(NSUInteger) index;
@end

@interface LTSegmentedControl : UIScrollView

@property (nonatomic, strong) NSArray<NSString *>* items;
@property(nonatomic,readonly) NSUInteger numberOfSegments;
@property(nonatomic) NSUInteger selectedSegmentIndex;

@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, assign) CGFloat minWidth;
@property (nonatomic, assign) CGFloat maxWidth;

@property (nonatomic, strong) UIColor *hightlightColor;
@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, weak) id<LTSegmentedControlDelegate> segmentDelegate;
/// a indicatorView for custom
@property (nonatomic, strong) UIView *indicatorView;

- (instancetype)initWithItems:(NSArray<NSString *>*) items;

@end

@interface LTSegmentedControl (IndicatorView)
- (UIView *)topLineIndicatorView;
- (UIView *)bottomLineIndicatorView;
@end

NS_ASSUME_NONNULL_END