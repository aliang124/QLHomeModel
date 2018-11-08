//
//  WTCyclePagerView.h
//  Project
//
//  Created by elji on 2017/6/14.
//  Copyright © 2017年 elji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCyclePagerTransformLayout.h"

NS_ASSUME_NONNULL_BEGIN

// pagerView scrolling direction
typedef NS_ENUM(NSUInteger, WTPagerScrollDirection) {
    WTPagerScrollDirectionLeft,
    WTPagerScrollDirectionRight,
};

@class WTCyclePagerView;
@protocol WTCyclePagerViewDataSource <NSObject>

- (NSInteger)numberOfItemsInPagerView:(WTCyclePagerView *)pageView;

- (__kindof UICollectionViewCell *)pagerView:(WTCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index;

/**
 return pagerView layout,and cache layout
 */
- (WTCyclePagerViewLayout *)layoutForPagerView:(WTCyclePagerView *)pageView;

@end

@protocol WTCyclePagerViewDelegate <NSObject>

@optional

/**
 pagerView did scroll to new index page
 */
- (void)pagerView:(WTCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

/**
 pagerView did selected item cell
 */
- (void)pagerView:(WTCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index;

// custom layout
- (void)pagerView:(WTCyclePagerView *)pageView initializeTransformAttributes:(UICollectionViewLayoutAttributes *)attributes;

- (void)pagerView:(WTCyclePagerView *)pageView applyTransformToAttributes:(UICollectionViewLayoutAttributes *)attributes;


// scrollViewDelegate

- (void)pagerViewDidScroll:(WTCyclePagerView *)pageView;

- (void)pagerViewWillBeginDragging:(WTCyclePagerView *)pageView;

- (void)pagerViewDidEndDragging:(WTCyclePagerView *)pageView willDecelerate:(BOOL)decelerate;

- (void)pagerViewWillBeginDecelerating:(WTCyclePagerView *)pageView;

- (void)pagerViewDidEndDecelerating:(WTCyclePagerView *)pageView;

- (void)pagerViewWillBeginScrollingAnimation:(WTCyclePagerView *)pageView;

- (void)pagerViewDidEndScrollingAnimation:(WTCyclePagerView *)pageView;

@end


@interface WTCyclePagerView : UIView

// will be automatically resized to track the size of the pagerView
@property (nonatomic, strong, nullable) UIView *backgroundView; 

@property (nonatomic, weak, nullable) id<WTCyclePagerViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id<WTCyclePagerViewDelegate> delegate;

// pager view, don't set dataSource and delegate
@property (nonatomic, weak, readonly) UICollectionView *collectionView;
// pager view layout
@property (nonatomic, strong, readonly) WTCyclePagerViewLayout *layout;

/**
 is infinite cycle pageview
 */
@property (nonatomic, assign) BOOL isInfiniteLoop;

/**
 pagerView automatic scroll time interval, default 0,disable automatic
 */
@property (nonatomic, assign) CGFloat autoScrollInterval;

/**
 current page index
 */
@property (nonatomic, assign, readonly) NSInteger curIndex;

// scrollView property
@property (nonatomic, assign, readonly) CGPoint contentOffset;
@property (nonatomic, assign, readonly) BOOL tracking;
@property (nonatomic, assign, readonly) BOOL dragging;
@property (nonatomic, assign, readonly) BOOL decelerating;


/**
 reload data, !!important!!: will clear layout and call delegate layoutForPagerView
 */
- (void)reloadData;

/**
 update data is reload data, but not clear layuot
 */
- (void)updateData;

/**
 if you only want update layout
 */
- (void)setNeedUpdateLayout;

/**
 will set layout nil and call delegate->layoutForPagerView
 */
- (void)setNeedClearLayout;

/**
 current index cell in pagerView
 */
- (__kindof UICollectionViewCell * _Nullable)curIndexCell;

/**
 visible cells in pageView
 */
- (NSArray<__kindof UICollectionViewCell *> *_Nullable)visibleCells;


/**
 visible pageView indexs, maybe repeat index
 */
- (NSArray *)visibleIndexs;

/**
 scroll to item at index
 */
- (void)scrollToItemAtIndex:(NSInteger)index animate:(BOOL)animate;

/**
 scroll to next or pre item
 */
- (void)scrollToNearlyIndexAtDirection:(WTPagerScrollDirection)direction animate:(BOOL)animate;

/**
 register pager view cell with class
 */
- (void)registerClass:(Class)Class forCellWithReuseIdentifier:(NSString *)identifier;

/**
 register pager view cell with nib
 */
- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

/**
 dequeue reusable cell for pagerView
 */
- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
