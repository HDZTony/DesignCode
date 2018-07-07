//
//  WebViewViewController.h
//  DesignCode
//
//  Created by hdz on 2018/7/7.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface WebViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (copy, nonatomic)NSString *urlString;
@end
