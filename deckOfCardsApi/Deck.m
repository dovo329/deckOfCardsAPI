//
//  Deck.m
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "Deck.h"

static NSString * const kIdentifierKey = @"deck_id";
static NSString * const key = @"value";

@implementation Deck

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.identifier = dictionary[kIdentifierKey];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             kIdentifierKey : self.identifier
             };
}

@end
