//
//  KFNovelty.m
//  EngClub
//
//  Created by Kif on 02.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import "KFNovelty.h"

@implementation KFNovelty

- (instancetype)initWithServerResponse:(NSDictionary*) responseObject {
    self = [super init];
    if (self) {

        self.title = [responseObject objectForKey:@"title"];
        self.levels = [responseObject objectForKey:@"levels"];

        NSString* urlString = [responseObject objectForKey:@"image"];

        if (urlString) {
            self.imageUrl = [NSURL URLWithString:urlString];
        }

    }
    return self;
}

@end
