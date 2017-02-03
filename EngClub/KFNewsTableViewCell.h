//
//  KFTableViewCell.h
//  EngClub
//
//  Created by Kif on 02.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFNewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageOfNews;
@property (weak, nonatomic) IBOutlet UILabel *dateOfNews;

@end
