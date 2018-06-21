//
//  ViewController.m
//  DesignCode
//
//  Created by hdz on 2018/6/18.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
@interface ViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController
- (IBAction)playButtonTaped:(id)sender {
    NSString *urlString = @"https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175";
    NSURL *url = [NSURL URLWithString:urlString];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerViewController *avController = [[AVPlayerViewController alloc] init];
    avController.player = player;
    [self presentViewController:avController animated:YES completion:^{
        [player play];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.chapterCollectionView.delegate = self;
    self.chapterCollectionView.dataSource = self;
    self.titleLabel.alpha = 0;
    self.deviceImageView.alpha = 0;
    self.playVisualEffectView.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        self.titleLabel.alpha = 1;
        self.deviceImageView.alpha = 1;
        self.playVisualEffectView.alpha = 1;
    }];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < 0) {
        self.heroView.transform = CGAffineTransformMakeTranslation(0, offsetY);
        self.playVisualEffectView.transform = CGAffineTransformMakeTranslation(0, -offsetY/3);
        self.titleLabel.transform = CGAffineTransformMakeTranslation(0, -offsetY/3);
        self.deviceImageView.transform = CGAffineTransformMakeTranslation(0, -offsetY/4);
        self.backgroundImageView.transform = CGAffineTransformMakeTranslation(0, -offsetY/5);
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sectionCell" forIndexPath:indexPath];
    return cell;
}

@end
