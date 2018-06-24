//
//  ViewController.m
//  DesignCode
//
//  Created by hdz on 2018/6/18.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import "SectionViewController.h"
#import "Data.h"
#import "SectionCollectionViewCell.h"
@interface ViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic)Data *data;
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
    self.data = [[Data alloc] init];
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
//    UICollectionView *collectionView = (UICollectionView *)scrollView;
//    if (collectionView) {
//        for (UICollectionViewCell *cell in collectionView.visibleCells) {
//            NSIndexPath *indexPath = [collectionView indexPathForCell:cell];
//            UICollectionViewLayoutAttributes *attributes = [collectionView layoutAttributesForItemAtIndexPath:indexPath];
//            CGRect cellFrame = [collectionView convertRect:attributes.frame toView:self.view];
//            NSLog(@"%@",NSStringFromCGRect(cellFrame));
//        }
//    }
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.sections.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SectionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sectionCell" forIndexPath:indexPath];
    NSDictionary<NSString *,NSString *> *section = self.data.sections[indexPath.row];
    cell.titleLabel.text = section[@"title"];
    cell.captionLabel.text = section[@"caption"];
    cell.coverImageView.image = [UIImage imageNamed:section[@"image"]];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"HomeToSection" sender:indexPath];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"HomeToSection"]) {
        SectionViewController *sectionController = (SectionViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = sender;
        NSDictionary *section = self.data.sections[indexPath.row];
        sectionController.sections = self.data.sections;
        sectionController.section = section;
        sectionController.indexPath = indexPath;
    }
}
@end
