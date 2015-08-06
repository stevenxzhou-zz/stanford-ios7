//
//  NSObject+Deck.m
//  Matchismo
//
//  Created by Steven on 7/19/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import "Deck.h"

@implementation Deck : NSObject

- (NSMutableArray *) cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard: (Card *) card atTop:(BOOL) atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void) addCard:(Card *)card
{
    return [self addCard:card atTop:NO];
}

- (Card *) drawRandomCard
{
    Card *randomCard = nil;
    
    if([self.cards count])
    {
    
        unsigned int index = arc4random()%[self.cards count];
    
        randomCard = self.cards[index];
        
        [self.cards removeObjectAtIndex: index];
    }
    
    return randomCard;
}
@end
