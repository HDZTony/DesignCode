//
//  SectionViewController.m
//  DesignCode
//
//  Created by hdz on 2018/6/18.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "SectionViewController.h"

@interface SectionViewController ()


@end

@implementation SectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.section[@"title"];
    self.captionLabel.text = self.section[@"caption"];
    self.bodyLabel.text = self.section[@"body"];
    self.coverImage.image = [UIImage imageNamed:self.section[@"image"]];
    self.progressLabel.text = [NSString stringWithFormat:@"%ld/%lu",self.indexPath.row + 1,(unsigned long)self.sections.count ];
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}
@end
