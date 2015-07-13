//
//  Card.m
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "Card.h"

static NSString * const kSuitKey = @"suit";
static NSString * const kValueKey = @"value";
static NSString * const kImageURLKey = @"image";

@implementation Card

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.suit = dictionary[kSuitKey];
        self.value = dictionary[kValueKey];
        self.imageURL = [NSURL URLWithString:dictionary[kImageURLKey]];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             kSuitKey : self.suit,
             kValueKey : self.value,
             kImageURLKey : self.imageURL
             };
}

@end
