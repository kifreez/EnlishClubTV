//
//  KFNovelty.h
//  EngClub
//
//  Created by Kif on 02.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KFNovelty : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* levels;
@property (strong, nonatomic) NSURL* imageUrl;

- (instancetype)initWithServerResponse:(NSDictionary*) responseObject;

@end
