//
//  WTNetworkHelper.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//暴露在.h外部只须导入WTNetworkHelper头文件即可
#import "WTNetworkCache.h"

typedef NS_ENUM(NSUInteger, WTNetworkStatusType){
    /**未知网络*/
    WTNetworkStatusUnknown,
    /**无网路*/
    WTNetworkStatusNotReachable,
    /**手机网络*/
    WTNetworkstatusReachableWWAN,
    /**WiFi网络*/
    WTNetworkStatusReachableWiFi
};

typedef NS_ENUM(NSUInteger, WTRequestSerializer){
    /**设置请求数据为JSON格式*/
    WTRequestSerializerJSON,
    /**设置请求数据为二进制格式*/
    WTRequestSerializerHTTP
};

typedef NS_ENUM(NSUInteger, WTResponseSerializer) {
    /**设置响应数据为JSON格式*/
    WTResponsetSerializerJSON,
    /**设置响应数据为二进制格式*/
    WTResponseSerializerHTTP
};

/**请求成功的Block*/
typedef void(^WTHttpRequestSuccess)(id responseObject);

/**请求失败的Block*/
typedef void(^WTHttpRequestFailed)(NSError *error);

/**缓存的Block*/
typedef void(^WTHttpRequestCache)(id responseCache);

/*上传或者下载的进度*/
typedef void(^WTHttpProgress)(NSProgress *progress);

/**网络状态Block*/
typedef void(^WTNetworkStatus)(WTNetworkStatusType status);



@interface WTNetworkHelper : NSObject

/*实时获取网络状态，此方法可多次调用*/
+ (void)networkStatusWithBlock:(WTNetworkStatus)networkStatus;

/*判断是否有网*/
+ (BOOL)isNetwork;

/*是否是手机网络*/
+ (BOOL)isWWANNetwork;

/*是否是WiFi网络*/
+ (BOOL)isWiFiNetwork;

/*取消所有Http请求*/
+ (void)cancelAllRequest;

/*取消指定URL的Http请求*/
+ (void)cancelRequestWithURLStr:(NSString *)URLStr;

/**
 GET请求，不带缓存

 @param URL 请求地址
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象任务
 */
+ (__kindof NSURLSessionTask *)GETWithURL:(NSString *)URL
                               parameters:(NSDictionary *)parameters
                               success:(WTHttpRequestSuccess)success
                               failure:(WTHttpRequestFailed)failure;

/**
 GET请求，带缓存

 @param URL 请求地址
 @param parameters 请求参数
 @param responseCache 缓存数据回调
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象任务
 */
+ (__kindof NSURLSessionTask *)GETWithURL:(NSString *)URL
                               parameters:(NSDictionary *)parameters
                               responseCache:(WTHttpRequestCache)responseCache
                               success:(WTHttpRequestSuccess)success
                               failure:(WTHttpRequestFailed)failure;

/**
POST请求，不带缓存
 
 @param URL 请求地址
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象任务
 */
+ (__kindof NSURLSessionTask *)POSTWithURL:(NSString *)URL
                               parameters:(NSDictionary *)parameters
                               success:(WTHttpRequestSuccess)success
                               failure:(WTHttpRequestFailed)failure;

/**
POST请求，带缓存
 
 @param URL 请求地址
 @param parameters 请求参数
 @param responseCache 缓存数据回调
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象任务
 */
+ (__kindof NSURLSessionTask *)POSTWithURL:(NSString *)URL
                               parameters:(NSDictionary *)parameters
                            responseCache:(WTHttpRequestCache)responseCache
                                  success:(WTHttpRequestSuccess)success
                                  failure:(WTHttpRequestFailed)failure;


/**
 上传图片文件

 @param URLStr 请求地址
 @param parameters 请求参数
 @param images 图片数组
 @param name 文件对应服务器上的字段
 @param fileName 文件名
 @param mimeType 图片文件类型：png/jpeg(默认类型)
 @param progress 上传进度
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象可取消请求，调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadURLStr:(NSString *)URLStr
                               parameters:(NSDictionary *)parameters
                               images:(NSArray<UIImage *> *)images
                               name:(NSString *)name
                               fileName:(NSString *)fileName
                               mimeType:(NSString *)mimeType
                               progress:(WTHttpProgress)progress
                               success:(WTHttpRequestSuccess)success
                               failure:(WTHttpRequestFailed)failure;

/**
 下载文件

 @param URLStr 请求地址
 @param fileDir 文件存储的目录(默认存储目录为Download)
 @param progress 文件下载的进度信息
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回NSURLSessionTask实例，可用于暂停继续，暂停---调用suspend  开始---调用resume方法
 */
+ (__kindof NSURLSessionTask *)downloadWithURLStr:(NSString *)URLStr
                                          fileDir:(NSString *)fileDir
                                          progress:(WTHttpProgress)progress
                                          success:(WTHttpRequestSuccess)success
                                          failure:(WTHttpRequestFailed)failure;
/*
 **************************************  说明  **********************************************
 *
 * 在一开始设计接口的时候就想着方法接口越少越好,越简单越好,只有GET,POST,上传,下载,监测网络状态就够了.
 *
 * 无奈的是在实际开发中,每个APP与后台服务器的数据交互都有不同的请求格式,如果要修改请求格式,就要在此封装
 * 内修改,再加上此封装在支持CocoaPods后,如果使用者pod update最新WTNetworkHelper,那又要重新修改此
 * 封装内的相关参数.
 *
 * 依个人经验,在项目的开发中,一般都会将网络请求部分封装 2~3 层,第2层配置好网络请求工具的在本项目中的各项
 * 参数,其暴露出的方法接口只需留出请求URL与参数的入口就行,第3层就是对整个项目请求API的封装,其对外暴露出的
 * 的方法接口只留出请求参数的入口.这样如果以后项目要更换网络请求库或者修改请求URL,在单个文件内完成配置就好
 * 了,大大降低了项目的后期维护难度
 *
 * 综上所述,最终还是将设置参数的接口暴露出来,如果通过CocoaPods方式使用WTNetworkHelper,在设置项目网络
 * 请求参数的时候,强烈建议开发者在此基础上再封装一层,通过以下方法配置好各种参数与请求的URL,便于维护
 *
 **************************************  说明  **********************************************
 */


#pragma mark -- 重置AFHTTPSessionManager相关属性

/**
 设置网络请求参数的格式:默认为JSON格式

 @param requestSerializer WTRequestSerializerJSON---JSON格式  WTRequestSerializerHTTP--HTTP
 */
+ (void)setRequestSerializer:(WTRequestSerializer)requestSerializer;



/**
 设置服务器响应数据格式:默认为JSON格式

 @param responseSerializer WTResponseSerializerJSON---JSON格式  WTResponseSerializerHTTP--HTTP

 */
+ (void)setResponseSerializer:(WTResponseSerializer)responseSerializer;



/**
 设置请求超时时间(默认30s)

 @param time 超时时间
 */
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time;


/**
 设置请求头
 */
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

/**
 是否打开网络加载菊花(默认打开)

 @param open YES(打开) NO(关闭)
 */
+ (void)openNetworkActivityIndicator:(BOOL)open;

/**
 配置自建证书的Https请求，参考链接:http://blog.csdn.net/syg90178aw/article/details/52839103

 @param cerPath 自建https证书路径
 @param validatesDomainName 是否验证域名(默认YES) 如果证书的域名与请求的域名不一致，需设置为NO
 服务器使用其他信任机构颁发的证书也可以建立连接，但这个非常危险，建议打开 .validatesDomainName=NO,主要用于这种情况:客户端请求的是子域名，而证书上是另外一个域名。因为SSL证书上的域名是独立的
 For example:证书注册的域名是www.baidu.com,那么mail.baidu.com是无法验证通过的
 */
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;
@end
