//
//  NSObject_Card+PlayingCard.m
//  Matchismo
//
//  Created by Steven on 7/19/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import "PlayingCard.h"


@implementation PlayingCard : Card

@synthesize suit = _suit;

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♣️", @"♥️", @"♦️", @"♠️"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A", @"2", @"3", @"4", @"5", @"6", @"7",@"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank
{
    return [self.rankStrings count] - 1;
}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (void) setSuit:(NSString *)suit
{

    if ([[PlayingCard validSuits]containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (int) match: (NSArray *) otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *card = [otherCards firstObject];
        if (card.rank == self.rank) {
            score = 4;
        } else if ([card.suit isEqualToString: self.suit]){
            score = 1;
        }
    }
    
    return score;
}

@end
