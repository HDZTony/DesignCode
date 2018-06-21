//
//  ViewController.h
//  DesignCode
//
//  Created by hdz on 2018/6/18.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *deviceImageView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *playVisualEffectView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *heroView;
@property (weak, nonatomic) IBOutlet UIView *bookView;

@property (weak, nonatomic) IBOutlet UICollectionView *chapterCollectionView;

@end

