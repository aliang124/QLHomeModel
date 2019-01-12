//
//  WTDefine.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#ifndef WTBaseCore_WTDefine_h
#define WTBaseCore_WTDefine_h
/**
 *    @brief    屏幕宽
 */
#define WTScreenWidth [UIScreen mainScreen].bounds.size.width
/**
 *    @brief    屏高
 */
#define WTScreenHeight [UIScreen mainScreen].bounds.size.height
/**
 *     @brief     底部Tab高度.
 */
#define WT_TabBar_Height ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define WT_SafeArea_TOP (iPhoneX ? 44 : 0)
#define WT_SafeArea_BOTTOM (iPhoneX ? 34 : 0)

/**
 *     @brief     状态栏区域高度，如果是iPhoneX加上刘海区域高度
 */
#define WT_Default_Height_StatusBar (iPhoneX ? 44.0f : 20.0f)
/**
 *     @brief     实际操作title区域和按钮区域高度
 */
#define WT_Default_NavBar_Title_Height 44
/**
 *     @brief     总高度
 */
#define WT_Default_NavBar_Height (WT_Default_NavBar_Title_Height+WT_Default_Height_StatusBar)
/**
 *     @brief    线条高度
 */
#define WT_Line_Height  (1 / [UIScreen mainScreen].scale)

/**
 *     @brief     线条颜色
 */
#define WT_Color_Line WTColorHex(0xe1e1e1)
/**
 *     @brief     view默认背景色.
 */
#define WT_Color_ViewBackGround  WTColorHex(0xf4f4f4)
/**
 *     @brief     文本黑色字体颜色.
 */
#define WT_Color_TextBlackColor  WTColorHex(0x333333)
/**
 *     @brief     文本灰色字体颜色.
 */
#define WT_Color_TextGrayColor  WTColorHex(0x666666)
/**
 *     @brief     导航栏蓝色
 */
#define WT_Color_BlueColor   WTColorHex(0x3086f9)

/**
 *    @brief    push一个viewController
 */
#define WTRootNavPush(vc) [(UINavigationController *)[WTUtil appDelegate].window.rootViewController pushViewController:vc animated:YES]
/**
 *    @brief    弹出一个viewController
 */
#define WTRootNavPop(_ANIMATE) [(UINavigationController *)[WTUtil appDelegate].window.rootViewController popViewControllerAnimated:_ANIMATE]

/*** 判断当前设备类型 */
#define ISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define ISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


/***GCD线程****/
//GCD - 一次性执行
#define WTDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define WTDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define WTDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);


/**
 *    @brief    系统版本号.
 */
#define WTSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
/**
 *    @brief    系统字体.
 */
#define WTFontSys(_size) [UIFont systemFontOfSize:_size]
/**
 *  @brief  加粗系统字体.
 */
#define WTFontBoldSys(_size) [UIFont boldSystemFontOfSize:_size]
/**
 *  @brief  block简写.
 */
#define WTBlock(block, ...) if (block) { block(__VA_ARGS__); };

/**
 *  @brief  弱引用.
 */
#define WT(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define WO(obj,weakObj)  __weak __typeof(&*obj)weakObj = obj;

/**
 *  @brief  数组为空判断.
 */
#define WTArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/**
 *  @brief  字典为空判断.
 */
#define WTDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/**
 *  @brief  RGB颜色
 */
#define WTColor(r,g,b) WTColorRGBA(r,g,b,1.0)
/**
 *  @brief  RGBA颜色.
 */
#define WTColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/**
 *  @brief  16进制颜色.
 */
#define WTColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


/**
 *    @brief    注册一个接收通知
 */
#define WTAddNotification(notifiName,notifiSelector) \
[[NSNotificationCenter defaultCenter] addObserver:self selector:(notifiSelector) name:(notifiName) object:nil]
/**
 *    @brief    发送一个通知
 */
#define WTPostNotification(notifiName,obj) \
[[NSNotificationCenter defaultCenter] postNotificationName:notifiName object:obj]
/**
 *    @brief    删除所有通知
 */
#define WTRemoveAllNotification()     \
[[NSNotificationCenter defaultCenter] removeObserver:self]

/********存储数据*********/
#define WTUserDefaults [NSUserDefaults standardUserDefaults]

#define WTUserDefaultsSetObj(obj, key) \
[WTUserDefaults setObject:obj forKey:key]; \
[WTUserDefaults synchronize];

#define WTUserDefaultsObjForKey(key) [WTUserDefaults objectForKey:key]

#endif
