//
//  QLDefine.h
//  QLBusiness
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#ifndef QLBusiness_QLDefine_h
#define QLBusiness_QLDefine_h
/**
 *     @brief     状态栏区域高度，如果是iPhoneX加上刘海区域高度
 */
#define WT_Height_StatusBar (iPhoneX ? 44.0f : 20.0f)
/**
 *     @brief     实际操作title区域和按钮区域高度
 */
#define WT_NavBar_Title_Height 48
/**
 *     @brief     总高度
 */
#define WT_NavBar_Height (WT_NavBar_Title_Height+WT_Height_StatusBar)

#define QL_SafeArea_TOP (iPhoneX ? 44 : 0)
#define QL_SafeArea_BOTTOM (iPhoneX ? 34 : 0)
#define QL_TabBar_HEIGHT ((!iPhoneX) ? 56 : (56 + QL_SafeArea_BOTTOM))



//导航栏的黄色
#define QL_NavBar_BgColor_Yellow WTColorHex(0xF8DC3D)
//导航栏标题颜色黑色
#define QL_NavBar_TitleColor_Black WTColorHex(0x232A34)
#define QL_UserName_TitleColor_Black WTColorHex(0x36342A)
//描述字体颜色灰色
#define QL_DescColor_Gray WTColorHex(0x63625C)
#define QL_DateTextColor_Gray WTColorHex(0xC2C1BC)

//多页面滑动的下面游标颜色
#define QL_NavBar_CursorColor_Black WTColorHex(0x4D4207)
#define QL_TagColor_Green WTColorHex(0xE5FBF7)
#define QL_TagTextColor_Green WTColorHex(0x10BE9F)

//线条颜色
#define QL_TableView_LineColor WTColorHex(0xDDE5EA)
#define QL_Border_LineColor WTColorHex(0xDBDBDB)

#endif
