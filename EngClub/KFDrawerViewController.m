//
//  KFSideBarViewController.m
//  EngClub
//
//  Created by Kif on 31.01.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import "KFDrawerViewController.h"
#import "KFTableViewController.h"
#import <PGDrawerTransition.h>


@interface KFDrawerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *productButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *menuItems;

@property (strong, nonatomic) KFTableViewController *vc;

@end

@implementation KFDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.menuItems.firstObject setBackgroundColor:[UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:1.0f]];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.homeButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];

    [self.productButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.productButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];

    [self.aboutButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.aboutButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.homeButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)touchDown:(UIButton*)sender {

    UIColor *backgroundColor = [UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:1.0f];
    UIColor *tintColor = [UIColor colorWithRed:51.0f/255.0f green:116.0f/255.0f blue:186.0f/255.0f alpha:1.0f];
    sender.backgroundColor = backgroundColor;
    [sender setTitleColor:tintColor forState:UIControlStateHighlighted];

}

- (IBAction)touchUpInside:(UIButton*)sender {
    sender.backgroundColor = [UIColor whiteColor];
    [sender setTitleColor:nil forState:UIControlStateHighlighted];
    [self setSelectedMenuItem:sender];
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (void)setSelectedMenuItem:(UIButton*)item {
    [self.menuItems makeObjectsPerformSelector:@selector(setBackgroundColor:) withObject:[UIColor whiteColor]];

    item.backgroundColor = [UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:1.0f];
}

@end
