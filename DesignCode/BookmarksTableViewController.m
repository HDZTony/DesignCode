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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
