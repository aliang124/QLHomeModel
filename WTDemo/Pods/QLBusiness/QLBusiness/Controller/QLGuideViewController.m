//
//  QLGuideViewController.m
//  QLBusiness
//
//  Created by jienliang on 2018/12/7.
//  Copyright © 2018   All rights reserved.
//
#define GD_Screen_WIDTH [UIScreen mainScreen].bounds.size.width
#define GD_Screen_HEIGHT [UIScreen mainScreen].bounds.size.height
#define ImageNamed(name) [UIImage imageNamed:name]

#import "QLGuideViewController.h"
@interface QLGuideViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation QLGuideViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化guideView
    [self setupGuideView];
}

#pragma mark - 初始化guideView
- (void)setupGuideView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.contentSize = CGSizeMake(self.imageArray.count*GD_Screen_WIDTH, 0);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    // UIImageView
    CGFloat imgViewY = 0;
    CGFloat imgViewW = GD_Screen_WIDTH;
    CGFloat imgViewH = GD_Screen_HEIGHT;
    for (int i = 0; i < self.imageArray.count; i++) {
        CGFloat imgViewX = i * GD_Screen_WIDTH;
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH)];
        NSString *name = self.imageArray[i];
        imgView.image = ImageNamed(name);
        [self.scrollView addSubview:imgView];
        
        if (i == self.imageArray.count-1) { // 最后一张是否有按钮可点击进入
            // UIButton
            UIButton *btn = nil;
            if (self.onCreateButton) {
                btn = self.onCreateButton();
            } else {
                btn = [self createDefault];
            }
            CGFloat btnW = 120;
            CGFloat btnH = 30;
            CGFloat btnX = imgViewX + (GD_Screen_WIDTH-btnW)/2;
            CGFloat btnY = GD_Screen_HEIGHT - 90;
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            [self.scrollView addSubview:btn];
        }
    }

    // UIPageControl
    CGFloat pageControlW = 100;
    CGFloat pageControlH = 30;
    CGFloat pageControlX = (GD_Screen_WIDTH-pageControlW) * 0.5;
    CGFloat pageControlY = GD_Screen_HEIGHT - pageControlH;
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(pageControlX, pageControlY, pageControlW, pageControlH)];
    self.pageControl.numberOfPages = self.imageArray.count;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:self.pageControl];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.pageControl.currentPage == self.imageArray.count-1) {
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / GD_Screen_WIDTH;
}

#pragma mark - 监听按钮点击事件
- (void)btnClick:(UIButton *)sender {
}

- (UIButton *)createDefault {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    [btn setTitle:@"立即进入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
