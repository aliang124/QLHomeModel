//
//  QLListDianZanCountView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/28.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLListDianZanCountView.h"

@interface QLListDianZanCountView () {
    UIImageView *liuYanIcon;
    UILabel *liuYanCountLab;
    
    UIImageView *liulanIcon;
    UILabel *liulanCountLab;
}
@end

@implementation QLListDianZanCountView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        //留言数
        liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(self.width-12, 1.5, 9, 7)];
        liuYanCountLab.font = WTFontSys(10);
        liuYanCountLab.textColor = QL_DescColor_Gray;
        [self addSubview:liuYanCountLab];
        
        liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
        [self addSubview:liuYanIcon];

        //浏览数
        liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(self.width-12, 1.5, 9, 7)];
        liulanCountLab.font = WTFontSys(10);
        liulanCountLab.textColor = QL_DescColor_Gray;
        [self addSubview:liulanCountLab];
        
        liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
        [self addSubview:liulanIcon];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //点赞数
    liuYanCountLab.text = @"12";
    [liuYanCountLab sizeToFit];
    liuYanCountLab.top = (self.height-liuYanCountLab.height)/2;
    liuYanCountLab.left = self.width-11-liuYanCountLab.width;
    liuYanIcon.left = liuYanCountLab.left-15;
    //评论数
    liulanCountLab.text = @"34";
    [liulanCountLab sizeToFit];
    liulanCountLab.top = (self.height-liulanCountLab.height)/2;
    liulanCountLab.left = liuYanIcon.left-18-liulanCountLab.width;
    liulanIcon.left = liulanCountLab.left-15;
}
@end
