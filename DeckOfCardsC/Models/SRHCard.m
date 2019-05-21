//
//  SRHCard.m
//  DeckOfCardsC
//
//  Created by Bobba Kadush on 5/21/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHCard.h"

@implementation SRHCard

-(instancetype)initWithCode:(NSString *)code image:(NSString *)image
{
    self = [super init];
    if (self) {
        _code = code;
        _image = image;
    }
    return self;
}
- (instancetype)initWithDictionary:(NSDictionary<NSString *, NSString *> *)dictionary
{
    
    NSString *codeFromJson = dictionary[@"code"];
    NSString *imageFromJson = dictionary[@"image"];
//    NSDictionary<NSString *,NSString *> *card = dictionary[@"cards"];
//    NSString *codeFromJson = card[@"code"];
//    NSString *imageFromJson = card[@"image"];
    if (![codeFromJson isKindOfClass:[NSString class]] || ![imageFromJson isKindOfClass:[NSString class]]){
        return nil;
    }
    return [self initWithCode:codeFromJson image:imageFromJson];
}


@end
