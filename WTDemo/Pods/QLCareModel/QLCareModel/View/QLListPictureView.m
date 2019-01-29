//
//  QLListPictureView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/28.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLListPictureView.h"

@implementation QLListPictureView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        
        //图片区域
        float width = (self.width-16-16)/3;
        self.netImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
        [self addSubview:self.netImg1];
        
        self.netImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.netImg1.right+16, 0, width, self.height)];
        [self addSubview:self.netImg2];
        
        self.netImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.netImg2.right+16, 0, width, self.height)];
        [self addSubview:self.netImg3];

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.netImg1 setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    [self.netImg2 setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    [self.netImg3 setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
}
@end
