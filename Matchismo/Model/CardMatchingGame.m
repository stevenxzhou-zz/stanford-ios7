//
//  NSObject+CardMatchingGame.m
//  Matchismo
//
//  Created by Steven on 8/5/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readwrite) NSUInteger score;

@end


@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if  (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self)
    {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

int const MATCH_BONUS = 4;
int const MIS_MATCH_PENALTY = 2;
int const COST_TO_CHOOSE = 1;


- (void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score = self.score + matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                        
                    } else {
                        self.score = self.score - MIS_MATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    
                    break;
                }
            }
            
            self.score = self.score - COST_TO_CHOOSE;
            card.chosen = YES;
        }
        
    }
}
@end
