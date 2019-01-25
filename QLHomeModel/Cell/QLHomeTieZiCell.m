//
//  QLHomeTieZiCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLHomeTieZiCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLHomeTieZiItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 100;
        self.titleTextHeight = 5;
        self.descTextHeight = 5;
    }
    return self;
}

@end

@interface QLHomeTieZiCell()
{
    //标题描述信息
    UILabel *titleLab;
    UILabel *descLab;
    //图片
    UIImageView *netImg1;
    UIImageView *netImg2;
    UIImageView *netImg3;
    //底部
    UILabel *tagLab;
    UILabel *liuYanCountLab;
    UIImageView *liuYanIcon;
    UILabel *liulanCountLab;
    UIImageView *liulanIcon;
    //
    UIView *lineImg;
}
@end

@implementation QLHomeTieZiCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    //文字描述区域
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(11, 11, WTScreenWidth-12-15, 5)];
    titleLab.font = WTFontSys(14);
    titleLab.numberOfLines = 2;
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    [self.contentView addSubview:titleLab];

    descLab = [[UILabel alloc] initWithFrame:CGRectMake(11, titleLab.bottom+7, WTScreenWidth-12-13, 5)];
    descLab.font = WTFontSys(12);
    descLab.numberOfLines = 2;
    descLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:descLab];
    //图片区域
    float width = (WTScreenWidth-12-12-10-10)/3;
    float height = width * 0.92;
    
    netImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, descLab.bottom+7, width, height)];
    [self.contentView addSubview:netImg1];

    netImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(netImg1.right+10, netImg1.top, width, height)];
    [self.contentView addSubview:netImg2];

    netImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(netImg2.right+10, netImg1.top, width, height)];
    [self.contentView addSubview:netImg3];
    //底部tagLab
    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 10, 14)];
    tagLab.font = WTFontSys(10);
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.backgroundColor = WTColorHex(0xE5FBF7);
    tagLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:tagLab];
    
    //留言数
    liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width-12, netImg1.bottom+9, 9, 7)];
    liuYanCountLab.font = WTFontSys(10);
    liuYanCountLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:liuYanCountLab];
    
    liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
    
    //浏览数
    liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width-12, netImg1.bottom+9, 9, 7)];
    liulanCountLab.font = WTFontSys(10);
    liulanCountLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:liulanCountLab];
    
    liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
    [self.contentView addSubview:liulanIcon];

    [self.contentView addSubview:liuYanIcon];
    
    lineImg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    //
    titleLab.text = self.item.titleText;
    descLab.text = @"青春期是长高的一个黄金期，爸妈都知道，小南就略过不提。重点说说爸妈可能忽略的“3岁前”吧。先说说宝宝身高增长的";

    //标题自适应高度缓存
    if (self.item.titleTextHeight==5) {
        [titleLab sizeToFit];
        self.item.titleTextHeight = titleLab.height;
    }
    //描述自适应高度缓存
    if (self.item.descTextHeight==5) {
        [descLab sizeToFit];
        self.item.descTextHeight = descLab.height;
    }
    descLab.top = titleLab.bottom+7;
    netImg1.top = descLab.bottom+7;
    netImg2.top = descLab.bottom+7;
    netImg3.top = descLab.bottom+7;
    self.contentView.height = netImg1.bottom+32;
    //
    tagLab.top = netImg1.bottom+6;
    tagLab.text = @"吃喝玩乐";
    [tagLab sizeToFit];
    tagLab.width = tagLab.width + 8;
    tagLab.height = tagLab.height + 4;
    //留言数
    liuYanCountLab.text = @"1212";
    liuYanCountLab.top = netImg1.bottom+9;
    [liuYanCountLab sizeToFit];
    liuYanCountLab.left = WTScreenWidth-12-liuYanCountLab.width;
    
    liuYanIcon.top = netImg1.bottom+9;
    liuYanIcon.left = liuYanCountLab.left-5-10;
    //浏览数
    liulanCountLab.text = @"1212";
    liulanCountLab.top = netImg1.bottom+9;
    [liulanCountLab sizeToFit];
    liulanCountLab.left = liuYanIcon.left-16-liulanCountLab.width;
    
    liulanIcon.top = netImg1.bottom+9;
    liulanIcon.left = liulanCountLab.left-5-10;
    [netImg1 setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    [netImg2 setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    [netImg3 setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    self.item.cellHeight = tagLab.bottom+12;
    lineImg.top = self.item.cellHeight-0.5;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
