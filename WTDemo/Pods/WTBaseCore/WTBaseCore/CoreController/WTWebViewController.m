//
//  WTWebViewController.m
//  IFXY
//
//  Created by elji on 15/7/14.
//  Copyright (c) 2015年 elji. All rights reserved.
//

#import "WTWebViewController.h"
#import "WTBaseCore.h"
#import <WebKit/WebKit.h>

API_AVAILABLE(ios(8.0))
@interface WTWebViewController ()<UIScrollViewDelegate,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,CAAnimationDelegate>
{
}
@property (nonatomic,strong) WKWebView *wkWebView;
@property (nonatomic,strong) UIProgressView *progressView;
@end

@implementation WTWebViewController
- (instancetype)initWithUrlString:(NSString *)aUrlString
{
    if (self = [super init]) {
        NSString *url = [[WTUtil strRelay:aUrlString] trim];
        _urlString = url;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navBar.title = [WTUtil strRelay:self.navTitle];
     
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    configuration.preferences = preferences;
    
    _wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, WT_Default_NavBar_Height, WTScreenWidth, WTScreenHeight-WT_Default_NavBar_Height) configuration:configuration];
    _wkWebView.backgroundColor = [UIColor whiteColor];
    _wkWebView.UIDelegate = self;
    _wkWebView.navigationDelegate = self;
    _wkWebView.backgroundColor = [UIColor whiteColor];
    _wkWebView.scrollView.bounces = NO;
    [self.view addSubview:_wkWebView];
    [self webViewLoadRequest:_urlString];
    
    //进度条初始化
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1)];
    self.progressView.backgroundColor = [UIColor blueColor];
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view addSubview:self.progressView];
    
    [_wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"AppModel"];
    
    [_wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [self.wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webViewLoadRequest:(NSString *)url
{
    if ([url hasPrefix:@"http://"]||[url hasPrefix:@"https://"]) {
        [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    } else {
        NSString *path = [[NSBundle mainBundle] pathForResource:url ofType:@"html"];
        [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    }
}

- (void)backBtnPress {
    if ([_wkWebView canGoBack]) {
        [_wkWebView goBack];
    } else {
         [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
    [self.wkWebView setNavigationDelegate:nil];
    [self.wkWebView setUIDelegate:nil];
}

#pragma mark - WKScriptMessageHandler
- (void)webViewDidFinishLoad {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.wkWebView.estimatedProgress;
        if (self.progressView.progress == 1) {
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }
    else if ([keyPath isEqualToString:@"title"]) {
        if (object == self.wkWebView) {
            self.title = [WTUtil strRelay:self.wkWebView.title];
            if (![WTUtil strNilOrEmpty:self.navTitle]) {
                self.title = [WTUtil strRelay:self.navTitle];
            }
        }
        else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

/**
 *  页面开始加载时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
}

/**
 *  页面加载完成之后调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.progressView.hidden = YES;
     NSString *js = [NSString stringWithFormat:@"setVersion('%@')",[WTUtil getAppVersion]];
     [self.wkWebView evaluateJavaScript:js completionHandler:^(id _Nullable value, NSError* _Nullable error) {
          NSLog(@"%@", value);
     }];
    if ([self respondsToSelector:@selector(webViewDidFinishLoad)]) {
        [self webViewDidFinishLoad];
    }
}

/**
 *  加载失败时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 *  @param error      错误
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.progressView.hidden = YES;
}

/**
 *  在发送请求之前，决定是否跳转
 *
 *  @param webView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSString *url = navigationAction.request.URL.absoluteString;
    NSLog(@"%@",url);
    if (0) {
    }
    else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@"AppModel"]) {
         NSDictionary *body = message.body;
         NSString *bodyStr = body[@"body"];
    }
}

- (void)clearWebCache {
     NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
     //// Date from
     NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
     //// Execute
     [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
          // Done
     }];
}
@end
