//
//  WTTabPagerBar.h
//  WTPagerControllerDemo
//
//  Created by tany on 2017/7/13.
//  Copyright © 2017年 tany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTTabPagerBarLayout.h"

NS_ASSUME_NONNULL_BEGIN

@class WTTabPagerBar;
@protocol WTTabPagerBarDataSource <NSObject>

- (NSInteger)numberOfItemsInPagerTabBar;

- (UICollectionViewCell<WTTabPagerBarCellProtocol> *)pagerTabBar:(WTTabPagerBar *)pagerTabBar cellForItemAtIndex:(NSInteger)index;

@end

@protocol WTTabPagerBarDelegate <NSObject>

@optional

// configure layout
- (void)pagerTabBar:(WTTabPagerBar *)pagerTabBar configureLayout:(WTTabPagerBarLayout *)layout;

// if cell wdith is not variable,you can set layout.cellWidth. otherwise ,you can implement this return cell width. cell width not contain cell edge
- (CGFloat)pagerTabBar:(WTTabPagerBar *)pagerTabBar widthForItemAtIndex:(NSInteger)index;

// did select cell item
- (void)pagerTabBar:(WTTabPagerBar *)pagerTabBar didSelectItemAtIndex:(NSInteger)index;

// transition frome cell to cell with animated
- (void)pagerTabBar:(WTTabPagerBar *)pagerTabBar transitionFromeCell:(UICollectionViewCell<WTTabPagerBarCellProtocol> * _Nullable)fromCell toCell:(UICollectionViewCell<WTTabPagerBarCellProtocol> * _Nullable)toCell animated:(BOOL)animated;

// transition frome cell to cell with progress
- (void)pagerTabBar:(WTTabPagerBar *)pagerTabBar transitionFromeCell:(UICollectionViewCell<WTTabPagerBarCellProtocol> * _Nullable)fromCell toCell:(UICollectionViewCell<WTTabPagerBarCellProtocol> * _Nullable)toCell progress:(CGFloat)progress;

@end

@interface WTTabPagerBar : UIView

@property (nonatomic, weak, readonly) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *progressView;
// automatically resized to self.bounds
@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, weak, nullable) id<WTTabPagerBarDataSource> dataSource;

@property (nonatomic, weak, nullable) id<WTTabPagerBarDelegate> delegate;

@property (nonatomic, strong) WTTabPagerBarLayout *layout;

@property (nonatomic, assign) BOOL autoScrollItemToCenter;

@property (nonatomic, assign, readonly) NSInteger countOfItems;

@property (nonatomic, assign, readonly) NSInteger curIndex;

@property (nonatomic, assign) UIEdgeInsets contentInset;

- (void)registerClass:(Class)Class forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (__kindof UICollectionViewCell<WTTabPagerBarCellProtocol> *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

- (void)reloadData;

- (void)scrollToItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex animate:(BOOL)animate;
- (void)scrollToItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress;
- (void)scrollToItemAtIndex:(NSInteger)index atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (CGFloat)cellWidthForTitle:(NSString * _Nullable)title;
- (CGRect)cellFrameWithIndex:(NSInteger)index;
- (nullable UICollectionViewCell<WTTabPagerBarCellProtocol> *)cellForIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
