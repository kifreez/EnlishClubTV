//
//  KFSideBarViewController.m
//  EngClub
//
//  Created by Kif on 31.01.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import "KFSideBarViewController.h"
#import <PGDrawerTransition.h>

@interface KFSideBarViewController ()
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *productButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@end

@implementation KFSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor redColor];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.homeButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.homeButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];

    [self.productButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.productButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];

    [self.aboutButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.aboutButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
