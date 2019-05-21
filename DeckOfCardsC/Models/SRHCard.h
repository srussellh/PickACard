//
//  SRHCard.h
//  DeckOfCardsC
//
//  Created by Bobba Kadush on 5/21/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRHCard : NSObject

@property (nonatomic, copy, readonly) NSString *image;
@property (nonatomic, copy, readonly) NSString *code;

-(instancetype) initWithCode:(NSString *)code image:(NSString *)image;

-(instancetype) initWithDictionary:(NSDictionary<NSString *, NSString*> *)dictionary;

@end

NS_ASSUME_NONNULL_END
