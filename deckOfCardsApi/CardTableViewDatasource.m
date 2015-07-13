//
//  CardTableViewDatasource.m
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "CardTableViewDatasource.h"
@import UIKit;
#import "CardController.h"
#import "Card.h"
#import "CardImageTableViewCell.h"

static NSString * const kCardCellID = @"cardCell";

@interface CardTableViewDatasource () <UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) NSArray *cards;

@end

@implementation CardTableViewDatasource

- (void)configureTableView:(UITableView *)tableView
{
    self.tableView = tableView;
    
    [CardController requestNewDeckWithCompletion:^(Deck *deck) {
        NSLog(@"%@", deck.identifier);
        self.deck = deck;
        
        [CardController shuffleDeck:deck withCompletion:^(BOOL success) {
            [CardController requestCards:52 fromDeck:deck withCompletion:^(NSArray *cards) {
                /*for (Card *card in cards) {
                    NSLog(@"%@", card.value);
                }*/
                self.cards = cards;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }];
        }];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // if using storyboards we don't register the cell
    CardImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCardCellID forIndexPath:indexPath];
    //cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row+1];
    Card *card = self.cards[indexPath.row];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", card.suit, card.value];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", card.imageURL];
    
    [cell updateWithCard:card];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cards.count;
}

@end
