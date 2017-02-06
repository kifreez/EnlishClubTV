//
//  KFServerManager.m
//  EngClub
//
//  Created by Kif on 30.01.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

#import "KFServerManager.h"
#import "KFNews.h"
#import "KFNovelty.h"
#import <AFNetworking.h>

@implementation KFServerManager

+ (KFServerManager *) sharedManager {

    static KFServerManager* manager = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KFServerManager alloc] init];
    });

    return manager;

}

#pragma mark - POST News

- (void) postNewsOnSuccess:(void(^)(NSArray* news)) success
                 onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys: @"news", @"query" , nil];

    NSURL *url = [NSURL URLWithString:@"http://english-club.tv/api"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:url.absoluteString
       parameters:params
         progress:nil
          success:^(NSURLSessionDataTask * operation, NSArray* responseObject) {
              NSLog (@"JSON: %@", responseObject);

              NSMutableArray* objectsNewsArray = [[NSMutableArray alloc] init];

              for (NSDictionary* dict in responseObject) {
                  KFNews* news = [[KFNews alloc] initWithServerResponse:dict];
                  [objectsNewsArray addObject:news];
              }

              if (success) {
                  success(objectsNewsArray);
              }

          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog (@"error: %@", error);
          }];

}

#pragma mark - POST Novelty

- (void) postNoveltyOnSuccess:(void(^)(NSArray* novelty)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys: @"novelty", @"query" , nil];

    NSURL *url = [NSURL URLWithString:@"http://english-club.tv/api"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:url.absoluteString
       parameters:params
         progress:nil
          success:^(NSURLSessionDataTask * operation, NSArray* responseObject) {
              NSLog (@"JSON: %@", responseObject);

              NSMutableArray* objectsNoveltyArray = [[NSMutableArray alloc] init];

              for (NSDictionary* dict in responseObject) {
                  KFNovelty* noveltys = [[KFNovelty alloc] initWithServerResponse:dict];
                  [objectsNoveltyArray addObject:noveltys];
              }

              if (success) {
                  success(objectsNoveltyArray);
              }

          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog (@"error: %@", error);
          }];

}

@end
