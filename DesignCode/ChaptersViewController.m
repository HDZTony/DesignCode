//
//  ChaptersViewController.m
//  DesignCode
//
//  Created by hdz on 2018/6/28.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "ChaptersViewController.h"
#import "Data.h"
#import "SectionCollectionViewCell.h"
@interface ChaptersViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) Data *data;
@end

@implementation ChaptersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chapter1ControllerView.delegate = self;
    self.chapter1ControllerView.dataSource = self;
    self.data = [[Data alloc] init];
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
@end
