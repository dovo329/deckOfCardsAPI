//
//  CardController.h
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardController : NSObject

+ (void)requestNewDeckWithCompletion:(void (^)(Deck *))completion;

+ (void)requestCards:(NSInteger)numberOfCards fromDeck:(Deck *)deck withCompletion:(void (^)(NSArray *cards))completion;

+ (void)shuffleDeck:(Deck *)deck withCompletion:(void(^)(BOOL success))completion;

@end
