//
//  NSObject+Deck.h
//  Matchismo
//
//  Created by Steven on 7/19/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;

- (void) addCard: (Card *) card atTop:(BOOL) atTop;
- (void) addCard: (Card *) card;
- (Card *) drawRandomCard;

@end
