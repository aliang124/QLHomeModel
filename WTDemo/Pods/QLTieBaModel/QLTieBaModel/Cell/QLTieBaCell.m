//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLTieBaCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLTieBaItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50+100;
        self.hasBottomLine = NO;
        self.titleTextHeight = 5;
        self.descTextHeight = 5;
    }
    return self;
}

@end

@interface QLTieBaCell()
{
    //背景view
    UIButton *bgView;
    //上面用户信息
    UIImageView *iconImg;
    UILabel *userNameLab;
    UIButton *guanBtn;//关注按钮
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
}
@end

@implementation QLTieBaCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    //总背景
    bgView = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, WTScreenWidth-8-8, 8)];
    [bgView setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [bgView setBackgroundImage:[WTUtil createImageFromColor:WTColorHex(0xcccccc)] forState:UIControlStateHighlighted];
    [bgView addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:bgView];
    //用户信息区域
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 30, 30)];
    iconImg.backgroundColor = [UIColor redColor];
    iconImg.layer.cornerRadius = 15;
    iconImg.layer.masksToBounds = YES;
    [bgView addSubview:iconImg];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+7, iconImg.top, bgView.width-iconImg.right-7-15, 30)];
    userNameLab.font = WTFontSys(12);
    userNameLab.textColor = QL_NavBar_TitleColor_Black;
    [bgView addSubview:userNameLab];
    
    guanBtn = [[UIButton alloc] initWithFrame:CGRectMake(bgView.width-56-12, 12, 56, 24)];
    guanBtn.layer.borderColor = QL_Border_LineColor.CGColor;
    [guanBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
    guanBtn.layer.borderWidth = 0.5;
    guanBtn.layer.masksToBounds = YES;
    guanBtn.titleLabel.font = WTFontSys(12);
    [guanBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [bgView addSubview:guanBtn];
    
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(13, 49.5, bgView.width-13-15, WT_Line_Height)];
    lineImg.backgroundColor = QL_TableView_LineColor;
    [bgView addSubview:lineImg];
    //文字描述区域
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(11, lineImg.bottom+10, bgView.width-12-15, 5)];
    titleLab.font = WTFontSys(14);
    titleLab.numberOfLines = 2;
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    [bgView addSubview:titleLab];

    descLab = [[UILabel alloc] initWithFrame:CGRectMake(11, titleLab.bottom+7, bgView.width-12-15, 5)];
    descLab.font = WTFontSys(12);
    descLab.numberOfLines = 2;
    descLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:descLab];
    //图片区域
    float width = (bgView.width-12-12-10-10)/3;
    float height = width * 0.92;
    
    netImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, descLab.bottom+7, width, height)];
    netImg1.backgroundColor = [UIColor redColor];
    [bgView addSubview:netImg1];

    netImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(netImg1.right+10, netImg1.top, width, height)];
    netImg2.backgroundColor = [UIColor redColor];
    [bgView addSubview:netImg2];

    netImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(netImg2.right+10, netImg1.top, width, height)];
    netImg3.backgroundColor = [UIColor redColor];
    [bgView addSubview:netImg3];
    //底部tagLab
    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 10, 14)];
    tagLab.font = WTFontSys(10);
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.backgroundColor = WTColorHex(0xE5FBF7);
    tagLab.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:tagLab];
    
    //留言数
    liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(bgView.width-12, netImg1.bottom+9, 9, 7)];
    liuYanCountLab.font = WTFontSys(10);
    liuYanCountLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:liuYanCountLab];
    
    liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
    
    //浏览数
    liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(bgView.width-12, netImg1.bottom+9, 9, 7)];
    liulanCountLab.font = WTFontSys(10);
    liulanCountLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:liulanCountLab];
    
    liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
    [bgView addSubview:liulanIcon];
    
    [bgView addSubview:liuYanIcon];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = WT_Color_ViewBackGround;
    self.contentView.backgroundColor = WT_Color_ViewBackGround;
    //
    userNameLab.text = @"用户A";
    titleLab.text = @"爸妈做到这5点，宝宝将来不愁大长腿！";
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
    bgView.height = netImg1.bottom+32;
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
    liuYanCountLab.left = bgView.width-12-liuYanCountLab.width;
    
    liuYanIcon.top = netImg1.bottom+9;
    liuYanIcon.left = liuYanCountLab.left-5-10;
    //浏览数
    liulanCountLab.text = @"1212";
    liulanCountLab.top = netImg1.bottom+9;
    [liulanCountLab sizeToFit];
    liulanCountLab.left = liuYanIcon.left-16-liulanCountLab.width;
    
    liulanIcon.top = netImg1.bottom+9;
    liulanIcon.left = liulanCountLab.left-5-10;
    
    self.item.cellHeight = bgView.height;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPress {
    if (self.item.selectionHandler) {
        self.item.selectionHandler(self.item);
    }
}
@end
