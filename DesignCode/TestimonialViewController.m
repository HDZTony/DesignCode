//
//  TestimonialViewController.m
//  DesignCode
//
//  Created by hdz on 2018/6/22.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "TestimonialViewController.h"
#import "TestimonialCollectionViewCell.h"
@interface TestimonialViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation TestimonialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TestimonialCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testimonialCell" forIndexPath:indexPath];
    return cell;
}


@end
