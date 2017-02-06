//
//  KFServerManager.h
//  EngClub
//
//  Created by Kif on 30.01.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KFServerManager : NSObject

+ (KFServerManager *) sharedManager;

- (void) postNewsOnSuccess:(void(^)(NSArray* news)) success
                     onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

- (void) postNoveltyOnSuccess:(void(^)(NSArray* novelty)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;
@end
