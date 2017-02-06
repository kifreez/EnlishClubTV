//
//  KFNews.h
//  EngClub
//
//  Created by Kif on 02.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KFNews : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* content;
@property (strong, nonatomic) NSURL* imageUrl;
@property (strong, nonatomic) NSNumber* date;

- (instancetype)initWithServerResponse:(NSDictionary*) responseObject;

@end
