//
//  WTTabPagerController.h
//  WTPagerControllerDemo
//
//  Created by jienliang on 2017/7/18.
//  Copyright © 2017年 tany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTTabPagerBar.h"
#import "WTPagerController.h"
#import "WTViewController.h"
NS_ASSUME_NONNULL_BEGIN

@class WTTabPagerController;
@protocol WTTabPagerControllerDataSource <NSObject>

- (NSInteger)numberOfControllersInTabPagerController;

- (UIViewController *)tabPagerController:(WTTabPagerController *)tabPagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching;

- (NSString *)tabPagerController:(WTTabPagerController *)tabPagerController titleForIndex:(NSInteger)index;

@end

@protocol WTTabPagerControllerDelegate <NSObject>
@optional

// display cell
- (void)tabPagerController:(WTTabPagerController *)tabPagerController willDisplayCell:(UICollectionViewCell<WTTabPagerBarCellProtocol> *)cell atIndex:(NSInteger)index;

// did select cell item
- (void)tabPagerController:(WTTabPagerController *)tabPagerController didSelectTabBarItemAtIndex:(NSInteger)index;

// scrolling
- (void)tabPagerControllerWillBeginScrolling:(WTTabPagerController *)tabPagerController animate:(BOOL)animate;
- (void)tabPagerControllerDidEndScrolling:(WTTabPagerController *)tabPagerController animate:(BOOL)animate;

@end

@interface WTTabPagerController : WTViewController

@property (nonatomic, strong, readonly) WTTabPagerBar *tabBar;
@property (nonatomic, strong, readonly) WTPagerController *pagerController;
@property (nonatomic, strong, readonly) WTPagerViewLayout<UIViewController *> *layout;

@property (nonatomic, weak, nullable) id<WTTabPagerControllerDataSource> dataSource;
@property (nonatomic, weak, nullable) id<WTTabPagerControllerDelegate> delegate;

// you can custom tabBar orignY and height.
@property (nonatomic, assign) CGFloat tabBarOrignY;
@property (nonatomic, assign) CGFloat tabBarHeight;

// register tabBar cell
- (void)registerClass:(Class)Class forTabBarCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forTabBarCellWithReuseIdentifier:(NSString *)identifier;

// register && dequeue pager Cell, usage like tableView
- (void)registerClass:(Class)Class forPagerCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forPagerCellWithReuseIdentifier:(NSString *)identifier;
- (UIViewController *)dequeueReusablePagerCellWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;


- (void)scrollToControllerAtIndex:(NSInteger)index animate:(BOOL)animate;

- (void)updateData;

- (void)reloadData;


@end

NS_ASSUME_NONNULL_END
