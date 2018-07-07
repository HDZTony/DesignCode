//
//  MoreViewController.m
//  DesignCode
//
//  Created by hdz on 2018/7/7.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "MoreViewController.h"
#import "WebViewViewController.h"
@interface MoreViewController ()

@end

@implementation MoreViewController
- (IBAction)safariButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"More to Web" sender:@"https://designcode.io"];
}
- (IBAction)communityButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"More to Web" sender:@"https://spectrum.chat/design-code"];
}
- (IBAction)emailButtonTapped:(id)sender {
    
}
- (IBAction)twitterHandleTapped:(id)sender {
    [self performSegueWithIdentifier:@"More to Web" sender:@"https://twitter.com/mengto"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"More to Web"]) {
        UINavigationController *destinationController = segue.destinationViewController;
        WebViewViewController *webViewController =  destinationController.viewControllers.firstObject;
        webViewController.urlString = sender;
    }
    
}


@end
