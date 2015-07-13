//
//  CardImageTableViewCell.h
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/13/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface CardImageTableViewCell : UITableViewCell

- (void)updateWithCard:(Card *)card;
    
@end
