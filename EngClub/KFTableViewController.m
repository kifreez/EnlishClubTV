//
//  KFTableViewController.m
//  EngClub
//
//  Created by Kif on 31.01.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import "KFTableViewController.h"
#import "KFDrawerViewController.h"
#import "KFServerManager.h"
#import "KFNewsTableViewCell.h"
#import "KFNoveltyTableViewCell.h"
#import "KFNews.h"
#import "KFNovelty.h"
#import <PGDrawerTransition.h>
#import <UIImageView+AFNetworking.h>

@interface KFTableViewController ()

@property (assign, nonatomic) BOOL loadingData;
@property (strong, nonatomic) NSMutableArray *newsArray;
@property (strong, nonatomic) NSMutableArray *noveltyArray;
@property (strong, nonatomic) KFDrawerViewController *drawerViewController;
@property (strong, nonatomic) PGDrawerTransition *drawerTransition;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;

@end

@implementation KFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsArray = [NSMutableArray array];
    self.noveltyArray = [NSMutableArray array];

    [self postNewsFromServer];
    [self postNoveltyFromServer];

    self.drawerViewController = [[KFDrawerViewController alloc] initWithNibName:@"SideBarView" bundle:nil];
    self.drawerTransition = [[PGDrawerTransition alloc] initWithTargetViewController:self
                                                                drawerViewController:self.drawerViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menuButton setTarget:self];
    [self.menuButton setAction:@selector(open:)];
}

- (IBAction)open:(id)sender {
    [self.drawerTransition presentDrawerViewController];
}

#pragma mark - POST News request

- (void) postNewsFromServer {

    self.loadingData = YES;

    [[KFServerManager sharedManager]
     postNewsOnSuccess:^(NSArray *news) {
         [self.newsArray addObjectsFromArray:news];

         NSMutableArray* newPaths = [NSMutableArray array];

         for (int i = (int)[self.newsArray count] - (int)[news count]; i < [self.newsArray count]; i++) {

             [newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
         }

         [self.tableView reloadData];

         self.loadingData = NO;

     }
     onFailure:^(NSError *error, NSInteger statusCode) {
         NSLog(@"Error = %@, code = %ld", [error localizedDescription], (long)statusCode);
     }];
    
}

#pragma mark - POST Novelty request

- (void) postNoveltyFromServer {

    self.loadingData = YES;

    [[KFServerManager sharedManager]
     postNoveltyOnSuccess:^(NSArray *novelty) {
         [self.noveltyArray addObjectsFromArray:novelty];

         NSMutableArray* newPaths = [NSMutableArray array];

         for (int i = (int)[self.noveltyArray count] - (int)[novelty count]; i < [self.noveltyArray count]; i++) {

             [newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
         }

         [self.tableView beginUpdates];
         [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
         [self.tableView endUpdates];

         self.loadingData = NO;

     }
     onFailure:^(NSError *error, NSInteger statusCode) {
         NSLog(@"Error = %@, code = %ld", [error localizedDescription], (long)statusCode);
     }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsArray count] + [self.noveltyArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString* identifierNews = @"cellForNews";
    static NSString* identifierNovelty = @"cellForNovelty";

    if (indexPath.row < 3) {

        KFNoveltyTableViewCell *cellNovelty = [tableView dequeueReusableCellWithIdentifier:identifierNovelty];

        KFNovelty* novelty = [self.noveltyArray objectAtIndex:indexPath.row];

        cellNovelty.titleOfNovelty.text = [NSString stringWithFormat:@"%@", novelty.title];
        cellNovelty.levelsOfNovelty.text = [NSString stringWithFormat:@"%@", novelty.levels];

        NSURLRequest* request = [NSURLRequest requestWithURL:novelty.imageUrl];

        cellNovelty.imageOfNovelty.image = nil;

        [cellNovelty.imageOfNovelty setImageWithURLRequest:request
                                    placeholderImage:nil
                                             success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {

                                                 cellNovelty.imageOfNovelty.image = image;
                                                 [cellNovelty layoutSubviews];
                                             }
                                             failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                                 
                                             }];

        return cellNovelty;

    } else {

        NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:indexPath.row - 3 inSection:1];

        KFNewsTableViewCell *cellNews = [tableView dequeueReusableCellWithIdentifier:identifierNews];

        KFNews* news = [self.newsArray objectAtIndex:newIndexPath.row];

        cellNews.titleLabel.text = [NSString stringWithFormat:@"%@", news.title];
        cellNews.descriptionLabel.text = [NSString stringWithFormat:@"%@", news.content];

        NSURLRequest* request = [NSURLRequest requestWithURL:news.imageUrl];

        cellNews.imageOfNews.image = nil;

        [cellNews.imageOfNews setImageWithURLRequest:request
                                    placeholderImage:nil
                                             success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {

                                                 cellNews.imageOfNews.image = image;
                                                 [cellNews layoutSubviews];
                                             }
                                             failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {

                                             }];

        NSDate *date = [NSDate dateWithTimeIntervalSince1970:([news.date integerValue] / 1000)];

        NSDateFormatter * formatter =  [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MM.yyyy"];
        
        NSString *formatedDate = [formatter stringFromDate:date];
        cellNews.dateOfNews.text = [NSString stringWithFormat:@"%@", formatedDate];

        return cellNews;
    }


    return nil;
}

@end
