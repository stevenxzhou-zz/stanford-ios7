//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Steven on 7/19/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;
@property (weak, nonatomic) IBOutlet UILabel *score;

@end

@implementation CardGameViewController

- (CardMatchingGame *) game {

    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.CardButtons count] usingDeck:[self createDeck]];
    }
    
    return _game;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chooseButtonIndex = [self.CardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
}

- (void) updateUI {
    
    for (UIButton *cardButton in self.CardButtons) {
        NSUInteger cardButtonIndex = [self.CardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.score.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
}

- (NSString *) titleForCard: (Card *) card  {
    return card.isChosen? card.contents:@"";
}

- (UIImage *) backgroundImageForCard: (Card *) card {
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}
@end
