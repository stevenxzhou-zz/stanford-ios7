//
//  NSObject+CardMatchingGame.h
//  Matchismo
//
//  Created by Steven on 8/5/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
// Designated initialization
- (instancetype) initWithCardCount: (NSUInteger )count usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSUInteger score;

@end
