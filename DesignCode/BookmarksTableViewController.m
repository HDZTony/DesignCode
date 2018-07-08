//
//  BookmarksTableViewController.m
//  DesignCode
//
//  Created by hdz on 2018/6/28.
//  Copyright © 2018年 mobi.hdz. All rights reserved.
//

#import "BookmarksTableViewController.h"
#import "BookmarksTableViewCell.h"
#import "Data.h"
#import "SectionViewController.h"
@interface BookmarksTableViewController ()
@property (strong, nonatomic)Data *data;
@end
@implementation BookmarksTableViewController
-(Data *)data{
    if (!_data) {
        _data = [[Data alloc] init];
    }
    return _data;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"bookmark"];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.allBookmarks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookmarksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookmarkCell" forIndexPath:indexPath];
    NSDictionary *bookmark = self.data.allBookmarks[indexPath.row];
    cell.chapterTitleLabel.text = bookmark[@"section"];
    cell.titleLabel.text = bookmark[@"part"];
    cell.bodyLabel.text = bookmark[@"content"];
    cell.chapterNumberLabel.text = bookmark[@"chapter"];
    NSString *imageName = [NSString stringWithFormat:@"Bookmarks-%@", [(NSString*)bookmark[@"type"] capitalizedString]];
    cell.badgeImageView.image = [UIImage imageNamed:imageName];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"Bookmarks to Section" sender:indexPath];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Bookmarks to Section"]) {
        SectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.sections = self.data.sections;
        destinationVC.section = self.data.sections[0];
        destinationVC.indexPath = sender;
    }
}
- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender {
    UIViewController *sourceViewController = sender.sourceViewController;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
