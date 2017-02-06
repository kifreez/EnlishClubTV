//
//  KFNews.m
//  EngClub
//
//  Created by Kif on 02.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import "KFNews.h"

@implementation KFNews

- (instancetype)initWithServerResponse:(NSDictionary*) responseObject {
    self = [super init];
    if (self) {

        self.title = [responseObject objectForKey:@"title"];
        self.content = [responseObject objectForKey:@"content"];
        self.date = [responseObject objectForKey:@"date"];

        NSString* urlString = [responseObject objectForKey:@"image"];

        if (urlString) {
            self.imageUrl = [NSURL URLWithString:urlString];
        }

    }
    return self;
}

@end
