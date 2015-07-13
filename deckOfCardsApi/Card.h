//
//  Card.h
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <Foundation/Foundation.h>

/*typedef NS_ENUM(NSUInteger, CardSuit) {
    CardSuitHeart,
    CardSuitClub,
    CardSuitSpade,
    CardSuitDiamond
};*/

@interface Card : NSObject

//@property (nonatomic, assign) CardSuit suit;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSURL *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
