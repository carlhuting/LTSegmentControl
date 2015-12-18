//
//  LTSegmentControl.m
//  IMComponent
//
//  Created by carlhuting on 15/12/17.
//  Copyright © 2015年 lemon tree. All rights reserved.
//

#import "LTSegmentedControl.h"

@interface LTSegmentedControl ()
@property (nonatomic, strong) UIView *indicatorView;
@end

@implementation LTSegmentedControl

- (instancetype)initWithItems:(NSArray<NSString *>*)items {
    self = [super init];
    if (self) {
        _items = [items copy];
        [self setupUI];
    }
    return self;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        _indicatorView.backgroundColor = [UIColor greenColor];
        _indicatorView.alpha = 0.5;
    }
    return _indicatorView;
}

- (NSUInteger)numberOfSegments {
    return self.items.count;
}

- (void)setupUI {
    _lineSpace = 2;
    _minWidth = 60;
    _titleColor = [UIColor blackColor];
    _hightlightColor = [UIColor darkTextColor];
    self.backgroundColor = [UIColor lightGrayColor];
    
    [_items enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitleColor:_titleColor forState:UIControlStateNormal];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:_hightlightColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        btn.tag = idx + 100;
    }];
    [self addSubview:self.indicatorView];
}

- (void)tapped:(UIButton *)sender {
    if (self.selectedSegmentIndex == (sender.tag - 100 )) {
        return ;
    }
    self.selectedSegmentIndex = sender.tag - 100;
}

- (void)movefrom:(NSUInteger)from to:(NSUInteger)to {
    UIButton *fromButton = self.subviews[from];
    fromButton.selected = NO;
    UIButton *toButton = self.subviews[to];
    toButton.selected = YES;

    CGRect frame = self.indicatorView.frame;
    frame.origin.x = toButton.frame.origin.x;
    frame.size.width = toButton.frame.size.width;
    [UIView animateWithDuration:.23 animations:^{
        self.indicatorView.frame = frame;
    }];
    CGFloat maxoffset = self.contentSize.width - self.bounds.size.width;
    if (!self.scrollEnabled || (maxoffset <= 3.0)) {
        return ;
    }
    
    if (CGRectGetMidX(toButton.frame) < CGRectGetMidX(self.frame)) {
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
        return ;
    }
    
    CGFloat offsetY = CGRectGetMidX(toButton.frame) - CGRectGetMidX(self.frame);
    offsetY = MIN(offsetY, maxoffset);
    
    [self setContentOffset:CGPointMake(offsetY, 0) animated:YES];
}

- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex {
    if (selectedSegmentIndex == _selectedSegmentIndex || selectedSegmentIndex >= self.items.count) {
        return ;
    }
    [self movefrom:self.selectedSegmentIndex to:selectedSegmentIndex];
    if (self.segmentDelegate && [self.segmentDelegate respondsToSelector:@selector(selectedIndexChanged:)]) {
        [self.segmentDelegate selectedIndexChanged:selectedSegmentIndex];
    }
    _selectedSegmentIndex = selectedSegmentIndex ;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat contentWidth = 0;
    for (NSInteger index = 0; index < self.items.count; index++) {
        UIButton * btn = (UIButton *)self.subviews[index];
        [btn sizeToFit];
        CGFloat width = MAX(CGRectGetWidth(btn.bounds), self.minWidth);
       // width = MIN(width, self.maxWidth);
        btn.frame = CGRectMake(contentWidth, self.bounds.origin.y, width, self.bounds.size.height);
        contentWidth += width + self.lineSpace;
    }
    self.contentSize = CGSizeMake(contentWidth, self.bounds.size.height);
    UIButton *current = (UIButton *)self.subviews[self.selectedSegmentIndex];
    CGRect frame = current.frame;
    self.indicatorView.frame = frame;
}

@end
