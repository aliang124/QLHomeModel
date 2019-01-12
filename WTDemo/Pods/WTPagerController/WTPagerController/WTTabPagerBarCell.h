//
//  WTTabTitleViewCell.h
//  WTPagerControllerDemo
//
//  Created by tany on 16/5/4.
//  Copyright © 2016年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol WTTabPagerBarCellProtocol <NSObject>

/**
 font ,textColor will use WTTabPagerBarLayout's textFont,textColor
 */
@property (nonatomic, strong, readonly) UILabel *titleLabel;

@end

@interface WTTabPagerBarCell : UICollectionViewCell<WTTabPagerBarCellProtocol>
@property (nonatomic, weak,readonly) UILabel *titleLabel;

+ (NSString *)cellIdentifier;
@end
NS_ASSUME_NONNULL_END
