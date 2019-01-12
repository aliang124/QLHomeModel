//
//  WTPagerViewLayout.h
//  WTPagerControllerDemo
//
//  Created by jienliang on 2017/7/9.
//  Copyright © 2017年 tany. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TY_PagerReuseIdentify)
// resueId
@property (nonatomic, strong, readonly, nullable) NSString *ty_pagerReuseIdentify;

@end

@class WTPagerViewLayout<ItemType>;
@protocol WTPagerViewLayoutDataSource <NSObject>

- (NSInteger)numberOfItemsInPagerViewLayout;

// if item is preload, prefetch will YES
- (id)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout itemForIndex:(NSInteger)index prefetching:(BOOL)prefetching;

// return item's view
- (UIView *)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout viewForItem:(id)item atIndex:(NSInteger)index;

// see WTPagerView&&WTPagerController, add&&remove item ,must implement scrollView addSubView item's view
- (void)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout addVisibleItem:(id)item atIndex:(NSInteger)index;
- (void)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout removeInVisibleItem:(id)item atIndex:(NSInteger)index;

@optional

// if have not viewController return nil.
- (UIViewController *)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout viewControllerForItem:(id)item atIndex:(NSInteger)index;

@end

@protocol WTPagerViewLayoutDelegate <NSObject>

@optional

// Transition animation customization

// if you implement ↓↓↓transitionFromIndex:toIndex:progress:,only tap change index will call this, you can set progressAnimateEnabel NO that not call progress method
- (void)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex animated:(BOOL)animated;

// if you implement the method,also you need implement ↑↑↑transitionFromIndex:toIndex:animated:,deal with tap change index animate
- (void)pagerViewLayout:(WTPagerViewLayout *)pagerViewLayout transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress;

// ScrollViewDelegate

- (void)pagerViewLayoutDidScroll:(WTPagerViewLayout *)pagerViewLayout;
- (void)pagerViewLayoutWillBeginScrollToView:(WTPagerViewLayout *)pagerViewLayout animate:(BOOL)animate;
- (void)pagerViewLayoutDidEndScrollToView:(WTPagerViewLayout *)pagerViewLayout animate:(BOOL)animate;
- (void)pagerViewLayoutWillBeginDragging:(WTPagerViewLayout *)pagerViewLayout;
- (void)pagerViewLayoutDidEndDragging:(WTPagerViewLayout *)pagerViewLayout willDecelerate:(BOOL)decelerate;
- (void)pagerViewLayoutWillBeginDecelerating:(WTPagerViewLayout *)pagerViewLayout;
- (void)pagerViewLayoutDidEndDecelerating:(WTPagerViewLayout *)pagerViewLayout;
- (void)pagerViewLayoutDidEndScrollingAnimation:(WTPagerViewLayout *)pagerViewLayout;

@end

@interface WTPagerViewLayout<__covariant ItemType> : NSObject

@property (nonatomic, weak, nullable) id<WTPagerViewLayoutDataSource> dataSource;
@property (nonatomic, weak, nullable) id<WTPagerViewLayoutDelegate> delegate;

// strong,will control the delegate,don't set delegate on other place.
@property (nonatomic, strong, readonly) UIScrollView *scrollView;
// if viewcontroller's automaticallyAdjustsScrollViewInsets YES ,will cause frame problems, you can set YES, default YES
@property (nonatomic, assign) BOOL adjustScrollViewInset;

@property (nonatomic, assign, readonly) NSInteger countOfPagerItems;
@property (nonatomic, assign, readonly) NSInteger curIndex;// default -1

@property (nonatomic, strong, readonly) NSCache<NSNumber *,ItemType> *memoryCache;; // will cache pagerView,you can set countLimit
@property (nonatomic, assign) BOOL autoMemoryCache; // default YES

@property (nonatomic, assign) NSInteger prefetchItemCount;// preload left and right item's count , default 0
// because when superview add subview(have tableView) will call relodData,if set Yes will optimize. default NO
@property (nonatomic, assign) BOOL prefetchItemWillAddToSuperView;

@property (nonatomic, assign, readonly) NSRange prefetchRange;
@property (nonatomic, assign, readonly) NSRange visibleRange;

@property (nonatomic, strong, nullable, readonly) NSArray<NSNumber *> * visibleIndexs;
@property (nonatomic, strong, nullable, readonly) NSArray<ItemType> * visibleItems;

// default YES, if NO,will not call delegate transitionFromIndex:toIndex:progress:,but will call transitionFromIndex:toIndex:
@property (nonatomic, assign) BOOL progressAnimateEnabel;

// default NO, when scroll visible range change will add item.If YES add item only when scroll animate end, suggest set prefetchItemCount 1 or more
@property (nonatomic, assign) BOOL addVisibleItemOnlyWhenScrollAnimatedEnd;

// default 0.5,when scroll progress percent will change index, only progressAnimateEnabel is NO or don't implement delegate transitionFromIndex: toIndex: progress:
@property (nonatomic, assign) CGFloat changeIndexWhenScrollProgress;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 initializer will strong scrollView,and control delegate,don't set delegate on other place.
 */
- (instancetype)initWithScrollView:(UIScrollView *)scrollView NS_DESIGNATED_INITIALIZER; // strong scrollView

- (ItemType _Nullable)itemForIndex:(NSInteger)idx;

- (UIView *)viewForItem:(ItemType)item atIndex:(NSInteger)index;
// if have not viewController return nil.
- (UIViewController *_Nullable)viewControllerForItem:(id)item atIndex:(NSInteger)index;

// view's frame at index 
- (CGRect)frameForItemAtIndex:(NSInteger)index;

// register && dequeue's usage like tableView
- (void)registerClass:(Class)Class forItemWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forItemWithReuseIdentifier:(NSString *)identifier;
- (ItemType)dequeueReusableItemWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

// scroll to index
- (void)scrollToItemAtIndex:(NSInteger)index animate:(BOOL)animate;

// update data and layout，the same to relaodData,but don't reset propertys(curIndex,visibleDatas,prefechDatas)
- (void)updateData;

// reload data and reset propertys
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
