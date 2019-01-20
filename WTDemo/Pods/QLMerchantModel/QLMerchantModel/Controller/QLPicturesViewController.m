//
//  QLPicturesViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/13.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLPicturesViewController.h"
#import "HomeCell.h"
#import <CKYPhotoBrowser/KYPhotoBrowserController.h>
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLPicturesViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, KYPhotoBrowserControllerDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation QLPicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"相册";
    [self initView];
}

- (void)initView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height, WTScreenWidth, WTScreenHeight-WT_TabBar_Height-WT_NavBar_Height) collectionViewLayout:layout];
    [_collectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:@"HomeCell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    NSObject *obj = _imageArray[indexPath.item];
    if ([obj isKindOfClass:[UIImage class]]) {
        [cell updateImage:(UIImage *)obj];
    }
    else if ([obj isKindOfClass:[NSString class]]) {
        [cell updateImageURL:(NSString *)obj];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = WTScreenWidth/3-15;
    return CGSizeMake(width, width);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [KYPhotoBrowserController showPhotoBrowserWithImages:self.imageArray currentImageIndex:indexPath.item delegate:self];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (UIImageView *)sourceImageViewForIndex:(NSInteger)index
{
    HomeCell *cell = (HomeCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    if (cell) {
        
        return cell.imageView;
    }
    return nil;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        NSArray *images = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542593731&di=392abf890c5d3d1e8ae849cb0091500c&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F960a304e251f95cada6c0462c3177f3e6609524c.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541999013499&di=37df0ebd8911e9abe4a8617187a992b7&imgtype=0&src=http%3A%2F%2Fpic2.cxtuku.com%2F00%2F02%2F87%2Fb771a97b66b2.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541999013499&di=88b667506d3ed9d6717146fc2aade38b&imgtype=0&src=http%3A%2F%2Fyimentuku.com%2Fupfiles%2Fruyi5_886C41B8224095802FF474DADE2495DE%2F650%2FRYD-051.jpg"];
        _imageArray = [NSMutableArray arrayWithArray:images];
    }
    return _imageArray;
}

@end
