//
//  SRHCardController.h
//  DeckOfCardsC
//
//  Created by Bobba Kadush on 5/21/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRHCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface SRHCardController : NSObject
+(void) fetchCardCompletion:(void (^) (SRHCard * _Nullable))completion;
+(void) fetchCardImageURL:(NSString *)imageURL completion:(void (^) (UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
