//
//  Deck.h
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deck : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSArray *cards;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
