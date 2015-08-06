//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Steven on 7/19/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;

@end

@implementation CardGameViewController

- (Deck *) deck
{
    if (!_deck)
    {
        _deck = [[Deck alloc] init];
    }
    return _deck;
}

- (void)setFlipCount: (int)flipCount{
    _flipCount=flipCount;
    self.flipLabel.text=[NSString stringWithFormat:@"Flips: %d", _flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        UIImage *image = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        UIImage *image = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:[[self.deck drawRandomCard] contents]  forState:UIControlStateNormal];
    }
    
    self.flipCount++;
    
}

@end
