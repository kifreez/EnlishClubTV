//
//  KFNoveltyTableViewCell.h
//  EngClub
//
//  Created by Kif on 03.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFNoveltyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageOfNovelty;
@property (weak, nonatomic) IBOutlet UILabel *titleOfNovelty;
@property (weak, nonatomic) IBOutlet UILabel *levelsOfNovelty;

@end
