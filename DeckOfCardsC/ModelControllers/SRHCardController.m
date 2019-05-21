//
//  SRHCardController.m
//  DeckOfCardsC
//
//  Created by Bobba Kadush on 5/21/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHCardController.h"

@implementation SRHCardController
+ (void)fetchCardCompletion:(void (^)(SRHCard * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    NSLog(@"%@", [url absoluteString]);
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"there was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data) {
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray<NSDictionary *> *cardDictionaries = jsonDictionary[@"cards"];
            NSDictionary * firstCardDictionary = cardDictionaries[0];
            SRHCard *card = [[SRHCard alloc] initWithDictionary:firstCardDictionary];
            completion(card);
            return;
        }
        completion(nil);
    }]resume];
}

+ (void)fetchCardImageURL:(NSString *)imageURL completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:imageURL];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error in %s , %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data){
            UIImage *cardImage = [UIImage imageWithData:data];
            completion(cardImage);
            return;
        }
        completion(nil);
    }]resume];
    
}
@end
