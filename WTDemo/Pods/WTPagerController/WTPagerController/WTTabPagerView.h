//
//  WTTabPagerView.h
//  WTPagerControllerDemo
//
//  Created by jienliang on 2017/7/18.
//  Copyright © 2017年 tany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTPagerView.h"
#import "WTTabPagerBar.h"

NS_ASSUME_NONNULL_BEGIN

@class WTTabPagerView;
@protocol WTTabPagerViewDataSource <NSObject>

- (NSInteger)numberOfViewsInTabPagerView;

- (UIView *)tabPagerView:(WTTabPagerView *)tabPagerView viewForIndex:(NSInteger)index prefetching:(BOOL)prefetching;

- (NSString *)tabPagerView:(WTTabPagerView *)tabPagerView titleForIndex:(NSInteger)index;

@end

@protocol WTTabPagerViewDelegate <NSObject>
@optional

// display cell
- (void)tabPagerView:(WTTabPagerView *)tabPagerView willDisplayCell:(UICollectionViewCell<WTTabPagerBarCellProtocol> *)cell atIndex:(NSInteger)index;

// did select cell item
- (void)tabPagerView:(WTTabPagerView *)tabPagerView didSelectTabBarItemAtIndex:(NSInteger)index;

// appear && disappear
- (void)tabPagerView:(WTTabPagerView *)tabPagerView willAppearView:(UIView *)view forIndex:(NSInteger)index;
- (void)tabPagerView:(WTTabPagerView *)tabPagerView didDisappearView:(UIView *)view forIndex:(NSInteger)index;

// scrolling
- (void)tabPagerViewWillBeginScrolling:(WTTabPagerView *)tabPagerView animate:(BOOL)animate;
- (void)tabPagerViewDidEndScrolling:(WTTabPagerView *)tabPagerView animate:(BOOL)animate;

@end

@interface WTTabPagerView : UIView

@property (nonatomic, weak, readonly) WTTabPagerBar *tabBar;
@property (nonatomic, weak, readonly) WTPagerView *pageView;

@property (nonatomic, strong, readonly) WTPagerViewLayout<UIView *> *layout;

@property (nonatomic, weak, nullable) id<WTTabPagerViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id<WTTabPagerViewDelegate> delegate;

@property (nonatomic, assign) CGFloat tabBarHeight;

// register tabBar cell
- (void)registerClass:(Class)Class forTabBarCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forTabBarCellWithReuseIdentifier:(NSString *)identifier;

// register && dequeue pager Cell, usage like tableView
- (void)registerClass:(Class)Class forPagerCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forPagerCellWithReuseIdentifier:(NSString *)identifier;
- (UIView *)dequeueReusablePagerCellWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;


- (void)scrollToViewAtIndex:(NSInteger)index animate:(BOOL)animate;

- (void)updateData;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
